import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/flight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MyFlightsScreen extends StatefulWidget {
  const MyFlightsScreen({super.key});

  @override
  State<MyFlightsScreen> createState() => _MyFlightsScreenState();
}

class _MyFlightsScreenState extends State<MyFlightsScreen> {
  bool _wasAuthenticated = false;

  @override
  void initState() {
    super.initState();
    // Загружаем полеты при открытии только если авторизован
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
        _wasAuthenticated = isAuthenticated;
        if (isAuthenticated) {
          context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        // Отслеживаем изменения статуса авторизации
        final isNowAuthenticated = appState.isAuthenticated;
        
        // Если пользователь вышел (был авторизован, стал неавторизован)
        if (_wasAuthenticated && !isNowAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              // Очищаем данные при выходе
              context.read<FlightsBloc>().add(const ClearFlightsEvent());
            }
          });
        }
        
        // Если пользователь вошел (был неавторизован, стал авторизован)
        if (!_wasAuthenticated && isNowAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              // Загружаем данные при входе
              context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
            }
          });
        }
        
        _wasAuthenticated = isNowAuthenticated;
        
        // Если не авторизован, показываем экран авторизации
        if (!appState.isAuthenticated) {
          return _buildUnauthenticatedState(context);
        }

        // Если авторизован, показываем список полетов
        return RefreshIndicator(
          onRefresh: () async {
            context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: true));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(16.w),
            child: BlocBuilder<FlightsBloc, FlightsState>(
              builder: (context, state) {
                return state.when(
                  loading: () => _buildLoadingState(),
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) =>
                      _buildErrorState(errorForUser),
                  success: (flights, airport, departureAirport, arrivalAirport, dateFrom, dateTo) => _buildSuccessState(flights),
                  flightCreated: (flight) => _buildSuccessState([]), // Игнорируем состояние создания на экране моих полётов
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildUnauthenticatedState(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          Icon(Icons.lock_outline, size: 80, color: Color(0xFF9CA5AF)),
          SizedBox(height: 24.h),
          Text('Требуется авторизация', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
          SizedBox(height: 12.h),
          Text(
            'Для просмотра ваших полетов необходимо войти в систему',
            style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          ElevatedButton.icon(
            onPressed: () async {
              final result = await showCupertinoModalBottomSheet<bool>(
                barrierColor: Colors.black12,
                topRadius: const Radius.circular(20),
                context: context,
                builder: (context) => PhoneAuthScreen(),
              );

              // После успешной авторизации обновляем статус и загружаем данные
              if (result == true && context.mounted) {
                final appState = Provider.of<AppState>(context, listen: false);
                await appState.checkAuthStatus();
                if (appState.isAuthenticated && context.mounted) {
                  context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
                }
              }
            },
            icon: Icon(Icons.login, color: Colors.white),
            label: Text('Войти', style: AppStyles.bold16s.copyWith(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A6EFA),
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: List.generate(
        3,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Color(0xFFD9E6F8)),
            color: Colors.white,
          ),
          child: Shimmer(
            duration: const Duration(milliseconds: 1000),
            color: const Color(0xFF8D66FE),
            colorOpacity: 0.2,
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Colors.grey[300]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Color(0xFF9CA5AF)),
          SizedBox(height: 16.h),
          Text(
            error,
            style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
            },
            child: Text('Повторить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A6EFA),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(List<FlightEntity> flights) {
    if (flights.isEmpty) {
      return Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.flight, size: 64, color: Color(0xFF9CA5AF)),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                'У вас пока нет созданных полетов',
                style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                'Создайте свой первый полет, нажав кнопку "Создать полет" на вкладке "Поиск"',
                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: flights.map((flight) {
        return FlightCard(
          flight: flight,
          onTap: () {
            AutoRouter.of(context).push(FlightDetailRoute(flightId: flight.id));
          },
        );
      }).toList(),
    );
  }
}

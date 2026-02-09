import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/bookings_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/booking_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/pilot_contacts_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  bool _wasAuthenticated = false;

  @override
  void initState() {
    super.initState();
    // Загружаем бронирования при открытии только если авторизован
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
        _wasAuthenticated = isAuthenticated;
        if (isAuthenticated) {
          context.read<BookingsBloc>().add(GetBookingsEvent());
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
              context.read<BookingsBloc>().add(ClearBookingsEvent());
            }
          });
        }

        // Если пользователь вошел (был неавторизован, стал авторизован)
        if (!_wasAuthenticated && isNowAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              // Загружаем данные при входе
              context.read<BookingsBloc>().add(GetBookingsEvent());
            }
          });
        }

        _wasAuthenticated = isNowAuthenticated;

        // Если не авторизован, показываем экран авторизации
        if (!appState.isAuthenticated) {
          return _buildUnauthenticatedState(context);
        }

        // Если авторизован, показываем список бронирований
        return RefreshIndicator(
          onRefresh: () async {
            context.read<BookingsBloc>().add(GetBookingsEvent());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              left: AppSpacing.horizontal,
              right: AppSpacing.horizontal,
              top: AppSpacing.section,
              bottom: AppSpacing.section,
            ),
            child: BlocBuilder<BookingsBloc, BookingsState>(
              builder: (context, state) {
                return state.when(
                  loading: () => _buildLoadingState(),
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) =>
                      _buildErrorState(errorForUser),
                  success: (bookings) => _buildSuccessState(bookings),
                  bookingCreated: (booking) =>
                      _buildSuccessState([]), // После создания показываем пустой список, т.к. нужно перезагрузить
                  bookingConfirmed: (booking) {
                    // Показываем модальное окно с контактами пилота после подтверждения
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.mounted) {
                        showPilotContactsBottomSheet(context: context, booking: booking);
                      }
                    });
                    return _buildSuccessState(
                      [],
                    ); // После подтверждения показываем пустой список, т.к. нужно перезагрузить
                  },
                  bookingCancelled: (booking) =>
                      _buildSuccessState([]), // После отмены показываем пустой список, т.к. нужно перезагрузить
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
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          Icon(Icons.lock_outline, size: 80, color: Color(0xFF9CA5AF)),
          SizedBox(height: 24),
          Text('Требуется авторизация', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
          SizedBox(height: 12),
          Text(
            'Для просмотра ваших бронирований необходимо войти в систему',
            style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () async {
              final result = await showLogin(context);

              // После успешной авторизации обновляем статус и загружаем данные
              if (result == true && context.mounted) {
                final appState = Provider.of<AppState>(context, listen: false);
                await appState.checkAuthStatus();
                if (appState.isAuthenticated && context.mounted) {
                  context.read<BookingsBloc>().add(GetBookingsEvent());
                }
              }
            },
            icon: Icon(Icons.login, color: Colors.white),
            label: Text('Войти', style: AppStyles.bold16s.copyWith(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A6EFA),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFFD9E6F8)),
            color: Colors.white,
          ),
          child: Shimmer(
            duration: const Duration(milliseconds: 1000),
            color: const Color(0xFF8D66FE),
            colorOpacity: 0.2,
            child: Container(
              height: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[300]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Color(0xFF9CA5AF)),
          SizedBox(height: 16),
          Text(
            error,
            style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<BookingsBloc>().add(GetBookingsEvent());
            },
            child: Text('Повторить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A6EFA),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(List<BookingEntity> bookings) {
    // Если состояние bookingCreated/bookingConfirmed/bookingCancelled, перезагружаем список
    final currentState = context.read<BookingsBloc>().state;
    if (currentState is! SuccessBookingsState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<BookingsBloc>().add(GetBookingsEvent());
        }
      });
      return _buildLoadingState();
    }

    final bookingsList = currentState.bookings;

    if (bookingsList.isEmpty) {
      return Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.bookmark, size: 64, color: Color(0xFF9CA5AF)),
            SizedBox(height: 16),
            Center(
              child: Text(
                'У вас пока нет бронирований',
                style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Забронируйте место на любом доступном полете',
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
      children: bookingsList.map((booking) {
        return BookingCard(
          booking: booking,
          onTap: () {
            AutoRouter.of(context).push(FlightDetailRoute(flightId: booking.flightId));
          },
          onCancel: () {
            _showCancelDialog(context, booking.id);
          },
        );
      }).toList(),
    );
  }

  void _showCancelDialog(BuildContext context, int bookingId) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Отменить бронирование?', style: AppStyles.bold16s),
        content: Text('Вы уверены, что хотите отменить это бронирование?', style: AppStyles.regular14s),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Нет', style: AppStyles.bold14s.copyWith(color: Color(0xFF9CA5AF))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<BookingsBloc>().add(CancelBookingEvent(bookingId: bookingId));
            },
            child: Text('Да, отменить', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }
}

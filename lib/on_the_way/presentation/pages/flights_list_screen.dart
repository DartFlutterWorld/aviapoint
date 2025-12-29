import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/bookings_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/pages/my_bookings_screen.dart';
import 'package:aviapoint/on_the_way/presentation/pages/my_flights_screen.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/filter_bottom_sheet.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/flight_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/flight_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

@RoutePage()
class FlightsListScreen extends StatefulWidget {
  final int? initialTabIndex;
  
  const FlightsListScreen({super.key, this.initialTabIndex});

  @override
  State<FlightsListScreen> createState() => _FlightsListScreenState();
}

class _FlightsListScreenState extends State<FlightsListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _airport;
  DateTime? _dateFrom;
  DateTime? _dateTo;
  late AirportService _airportService;
  bool _wasAuthenticated = false;

  @override
  void initState() {
    super.initState();
    // Инициализируем состояние авторизации
    _wasAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Срабатывает только когда вкладка уже переключена (не во время анимации)
        setState(() {}); // Обновляем UI при смене вкладки для обновления FAB
        // Загружаем данные при переключении вкладок
        final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
        if (_tabController.index == 0) {
          // Вкладка "Поиск" - загружаем все полеты с текущими фильтрами
          context.read<FlightsBloc>().add(
            GetFlightsEvent(
              airport: _airport,
              dateFrom: _dateFrom,
              dateTo: _dateTo,
              isRefresh: false,
            ),
          );
        } else if (isAuthenticated) {
          if (_tabController.index == 1) {
            // Вкладка "Мои полеты"
            context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
          } else if (_tabController.index == 2) {
            // Вкладка "Мои бронирования"
            context.read<BookingsBloc>().add(GetBookingsEvent());
          }
        }
      }
    });
    // Инициализируем AirportService с Dio из getIt
    final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
    _airportService = AirportService(apiDatasource.dio);
    // Загружаем полеты при открытии (после первого кадра, чтобы контекст был готов)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Если указан начальный индекс вкладки, переключаемся на неё
        if (widget.initialTabIndex != null && widget.initialTabIndex! >= 0 && widget.initialTabIndex! < 3) {
          _tabController.animateTo(widget.initialTabIndex!);
          // Загружаем данные для выбранной вкладки
          final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
          if (isAuthenticated) {
            if (widget.initialTabIndex == 1) {
              context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
            } else if (widget.initialTabIndex == 2) {
              context.read<BookingsBloc>().add(GetBookingsEvent());
            }
          }
        } else {
          context.read<FlightsBloc>().add(const GetFlightsEvent(isRefresh: false));
        }
      }
    });
  }

  @override
  void didUpdateWidget(FlightsListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Если изменился initialTabIndex, переключаемся на нужную вкладку
    if (widget.initialTabIndex != null && 
        widget.initialTabIndex != oldWidget.initialTabIndex &&
        widget.initialTabIndex! >= 0 && 
        widget.initialTabIndex! < 3) {
      _tabController.animateTo(widget.initialTabIndex!);
      // Загружаем данные для выбранной вкладки
      final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
      if (isAuthenticated) {
        if (widget.initialTabIndex == 1) {
          context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
        } else if (widget.initialTabIndex == 2) {
          context.read<BookingsBloc>().add(GetBookingsEvent());
        }
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _applyFilters(DateTime? dateFrom, DateTime? dateTo) {
    setState(() {
      _dateFrom = dateFrom;
      _dateTo = dateTo;
    });
    context.read<FlightsBloc>().add(
      GetFlightsEvent(
        airport: _airport,
        dateFrom: dateFrom,
        dateTo: dateTo,
        isRefresh: false,
      ),
    );
  }

  void _onSearch(String? airport) {
    setState(() {
      _airport = airport;
    });
    context.read<FlightsBloc>().add(
      GetFlightsEvent(
        airport: airport,
        dateFrom: _dateFrom,
        dateTo: _dateTo,
        isRefresh: false,
      ),
    );
  }

  void _clearAllFilters() {
    setState(() {
      _airport = null;
      _dateFrom = null;
      _dateTo = null;
    });
    context.read<FlightsBloc>().add(const GetFlightsEvent(isRefresh: false));
  }

  bool get _hasActiveFilters =>
      _airport != null || _dateFrom != null || _dateTo != null;

  @override
  Widget build(BuildContext context) {
    // Слушаем изменения авторизации
    return Consumer<AppState>(
      builder: (context, appState, child) {
        final isNowAuthenticated = appState.isAuthenticated;
        
        // Если пользователь вышел (был авторизован, стал неавторизован)
        if (_wasAuthenticated && !isNowAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              // Очищаем данные при выходе
              context.read<FlightsBloc>().add(const ClearFlightsEvent());
              context.read<BookingsBloc>().add(ClearBookingsEvent());
              // Если на вкладке "Поиск", загружаем все полеты
              if (_tabController.index == 0) {
                context.read<FlightsBloc>().add(
                  GetFlightsEvent(
                    airport: _airport,
                    dateFrom: _dateFrom,
                    dateTo: _dateTo,
                    isRefresh: false,
                  ),
                );
              }
            }
          });
        }
        
        // Если пользователь вошел (был неавторизован, стал авторизован)
        if (!_wasAuthenticated && isNowAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              // Загружаем данные в зависимости от текущей вкладки
              if (_tabController.index == 0) {
                // Вкладка "Поиск" - загружаем все полеты с текущими фильтрами
                context.read<FlightsBloc>().add(
                  GetFlightsEvent(
                    airport: _airport,
                    dateFrom: _dateFrom,
                    dateTo: _dateTo,
                    isRefresh: false,
                  ),
                );
              } else if (_tabController.index == 1) {
                // Вкладка "Мои полеты"
                context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
              } else if (_tabController.index == 2) {
                // Вкладка "Мои бронирования"
                context.read<BookingsBloc>().add(GetBookingsEvent());
              }
            }
          });
        }
        
        _wasAuthenticated = isNowAuthenticated;
        
        return _buildScaffold(context);
      },
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'По пути',
          style: TextStyle(
            color: Color(0xFF223B76),
            fontSize: 14.sp,
            fontFamily: 'Geologica-Medium',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundAppBar,
        elevation: 1,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xFF0A6EFA),
          unselectedLabelColor: Color(0xFF9CA5AF),
          indicatorColor: Color(0xFF0A6EFA),
          labelStyle: AppStyles.bold14s,
          unselectedLabelStyle: AppStyles.regular14s,
          tabs: const [
            Tab(text: 'Поиск'),
            Tab(text: 'Мои полеты'),
            Tab(text: 'Мои бронирования'),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: TabBarView(
        controller: _tabController,
        children: [_buildSearchTab(), MyFlightsScreen(), MyBookingsScreen()],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton.extended(
              onPressed: () async {
                final appState = Provider.of<AppState>(context, listen: false);
                // Если не авторизован, показываем авторизацию
                if (!appState.isAuthenticated) {
                  final result = await showCupertinoModalBottomSheet<bool>(
                    barrierColor: Colors.black12,
                    topRadius: const Radius.circular(20),
                    context: context,
                    builder: (context) => PhoneAuthScreen(),
                  );

                  // После успешной авторизации обновляем статус и переходим на создание полета
                  if (result == true && context.mounted) {
                    await appState.checkAuthStatus();
                    if (appState.isAuthenticated && context.mounted) {
                      AutoRouter.of(context).push(const CreateFlightRoute());
                    }
                  }
                } else {
                  // Если авторизован, сразу переходим на создание полета
                  AutoRouter.of(context).push(const CreateFlightRoute());
                }
              },
              backgroundColor: Color(0xFF0A6EFA),
              icon: Icon(Icons.add, color: Colors.white),
              label: Text('Создать полет', style: AppStyles.bold14s.copyWith(color: Colors.white)),
            )
          : null,
    );
  }

  Widget _buildSearchTab() {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<FlightsBloc>().add(
          GetFlightsEvent(
            airport: _airport,
            dateFrom: _dateFrom,
            dateTo: _dateTo,
            isRefresh: true,
          ),
        );
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Поисковая строка - Поиск по аэропорту (включая промежуточные точки)
            FlightSearchBarWidget(
              hintText: 'Поиск по аэропорту (включая промежуточные точки)',
              initialValue: _airport,
              airportService: _airportService,
              onSelected: (code) => _onSearch(code),
              onClear: () => _onSearch(null),
            ),
            SizedBox(height: 12.h),
            // Активные фильтры (чипсы)
            if (_hasActiveFilters) ...[
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  if (_airport != null)
                    Chip(
                      label: Text('Аэропорт: $_airport', style: AppStyles.regular12s),
                      deleteIcon: Icon(Icons.close, size: 16),
                      onDeleted: () => _onSearch(null),
                      backgroundColor: Color(0xFFD9E6F8),
                      labelStyle: AppStyles.regular12s.copyWith(color: Color(0xFF374151)),
                    ),
                  if (_dateFrom != null || _dateTo != null)
                    Chip(
                      label: Text(
                        _dateFrom != null && _dateTo != null
                            ? '${DateFormat('dd.MM.yyyy').format(_dateFrom!)} - ${DateFormat('dd.MM.yyyy').format(_dateTo!)}'
                            : _dateFrom != null
                            ? 'От: ${DateFormat('dd.MM.yyyy').format(_dateFrom!)}'
                            : 'До: ${DateFormat('dd.MM.yyyy').format(_dateTo!)}',
                        style: AppStyles.regular12s,
                      ),
                      deleteIcon: Icon(Icons.close, size: 16),
                      onDeleted: () => _applyFilters(null, null),
                      backgroundColor: Color(0xFFD9E6F8),
                      labelStyle: AppStyles.regular12s.copyWith(color: Color(0xFF374151)),
                    ),
                ],
              ),
              SizedBox(height: 12.h),
              // Кнопка "Сбросить все"
              OutlinedButton.icon(
                onPressed: _clearAllFilters,
                icon: Icon(Icons.clear_all, color: Color(0xFFEF4444), size: 18),
                label: Text('Сбросить все фильтры', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  side: BorderSide(color: Color(0xFFEF4444)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
              ),
              SizedBox(height: 12.h),
            ],
            // Кнопка фильтров по дате
            OutlinedButton.icon(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
                  builder: (context) =>
                      FilterBottomSheet(initialDateFrom: _dateFrom, initialDateTo: _dateTo, onApply: _applyFilters),
                );
              },
              icon: Icon(Icons.filter_list, color: Color(0xFF0A6EFA)),
              label: Text('Фильтры по дате', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                side: BorderSide(color: Color(0xFFD9E6F8)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
            ),
            SizedBox(height: 24.h),
            // Список полетов
            BlocBuilder<FlightsBloc, FlightsState>(
              builder: (context, state) {
                return state.when(
                  loading: () => _buildLoadingState(),
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) =>
                      _buildErrorState(errorForUser),
                  success: (flights, airport, departureAirport, arrivalAirport, dateFrom, dateTo) => _buildSuccessState(flights),
                );
              },
            ),
          ],
        ),
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
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFEF4444)),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Color(0xFFEF4444), size: 48),
          SizedBox(height: 12.h),
          Text(
            error,
            style: AppStyles.regular14s.copyWith(color: Color(0xFF991B1B)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          ElevatedButton(
            onPressed: () {
              context.read<FlightsBloc>().add(
                GetFlightsEvent(
                  airport: _airport,
                  dateFrom: _dateFrom,
                  dateTo: _dateTo,
                  isRefresh: false,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A6EFA)),
            child: Text('Повторить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(List<FlightEntity> flights) {
    if (flights.isEmpty) {
      return Container(
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            Icon(Icons.flight_takeoff, size: 64, color: Color(0xFF9CA5AF)),
            SizedBox(height: 16.h),
            Text('Полеты не найдены', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 8.h),
            Text(
              'Попробуйте изменить параметры поиска',
              style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: flights.map((flight) {
        return FlightCard(
          flight: flight,
          onTap: () {
            try {
              AutoRouter.of(context).push(FlightDetailRoute(flightId: flight.id));
            } catch (e, stackTrace) {
              print('Ошибка навигации к деталям полета: $e');
              print('StackTrace: $stackTrace');
              // Попробуем альтернативный способ
              context.router.push(FlightDetailRoute(flightId: flight.id));
            }
          },
        );
      }).toList(),
    );
  }
}

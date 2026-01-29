import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/floating_action_button_widget.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';
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
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
  bool _hasLoadedInitialData = false;

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
          context.read<FlightsBloc>().add(GetFlightsEvent(airport: _airport, dateFrom: _dateFrom, dateTo: _dateTo, isRefresh: false));
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
    if (widget.initialTabIndex != null && widget.initialTabIndex != oldWidget.initialTabIndex && widget.initialTabIndex! >= 0 && widget.initialTabIndex! < 3) {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Перезагружаем данные при возврате на экран (например, при переключении вкладок через AutoTabsScaffold)
    // Используем флаг, чтобы не загружать данные повторно при первом вызове (это уже делается в initState)
    if (!_hasLoadedInitialData) {
      _hasLoadedInitialData = true;
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
        // Загружаем данные в зависимости от текущей вкладки
        if (_tabController.index == 0) {
          // Вкладка "Поиск" - загружаем все полеты с текущими фильтрами
          context.read<FlightsBloc>().add(GetFlightsEvent(airport: _airport, dateFrom: _dateFrom, dateTo: _dateTo, isRefresh: false));
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
    context.read<FlightsBloc>().add(GetFlightsEvent(airport: _airport, dateFrom: dateFrom, dateTo: dateTo, isRefresh: false));
  }

  void _onSearch(String? airport) {
    setState(() {
      _airport = airport;
    });
    context.read<FlightsBloc>().add(GetFlightsEvent(airport: airport, dateFrom: _dateFrom, dateTo: _dateTo, isRefresh: false));
  }

  void _clearAllFilters() {
    setState(() {
      _airport = null;
      _dateFrom = null;
      _dateTo = null;
    });
    context.read<FlightsBloc>().add(const GetFlightsEvent(isRefresh: false));
  }

  bool get _hasActiveFilters => _airport != null || _dateFrom != null || _dateTo != null;

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
                context.read<FlightsBloc>().add(GetFlightsEvent(airport: _airport, dateFrom: _dateFrom, dateTo: _dateTo, isRefresh: false));
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
                context.read<FlightsBloc>().add(GetFlightsEvent(airport: _airport, dateFrom: _dateFrom, dateTo: _dateTo, isRefresh: false));
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final adaptiveBold14s = AppStyles.bold14s;
        final adaptiveRegular14s = AppStyles.regular14s;
        final fabMargin = 12.0;

        return Scaffold(
          appBar: CustomAppBar(
            title: 'По пути',
            withBack: false,
            withProfile: true,
            bottom: TabBar(
              controller: _tabController,
              labelColor: Color(0xFF0A6EFA),
              unselectedLabelColor: Color(0xFF9CA5AF),
              indicatorColor: Color(0xFF0A6EFA),
              labelStyle: adaptiveBold14s,
              unselectedLabelStyle: adaptiveRegular14s,
              tabs: const [
                Tab(text: 'Поиск'),
                Tab(text: 'Мои полеты'),
                Tab(text: 'Мои брони'),
              ],
            ),
          ),
          backgroundColor: AppColors.background,
          body: TabBarView(controller: _tabController, children: [_buildSearchTab(), MyFlightsScreen(), MyBookingsScreen()]),
          floatingActionButton: _tabController.index == 0
              ? FloatingActionButtonWidget(
                  title: 'Создать\nполёт',
                  margin: EdgeInsets.only(bottom: fabMargin),
                  onTap: () async {
                    final appState = Provider.of<AppState>(context, listen: false);
                    // Если не авторизован, показываем авторизацию
                    if (!appState.isAuthenticated) {
                      final result = await showLogin(context);

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
                )
              : null,
        );
      },
    );
  }

  Widget _buildSearchTab() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final adaptiveRegular12s = AppStyles.regular12s;
        final spacing8 = AppSpacing.horizontal;
        final borderRadius20 = 20.0;
        final padding24 = 24.0;
        final iconSize = 16.0; // Единый размер для всех иконок

        return RefreshIndicator(
          onRefresh: () async {
            context.read<FlightsBloc>().add(GetFlightsEvent(airport: _airport, dateFrom: _dateFrom, dateTo: _dateTo, isRefresh: true));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: AppSpacing.horizontal, right: AppSpacing.horizontal, top: AppSpacing.section),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: AppSpacing.section),
                // Поисковая строка и кнопка фильтра по дате
                Row(
                  children: [
                    Expanded(
                      child: FlightSearchBarWidget(
                        hintText: 'Поиск по аэропортам',
                        initialValue: _airport,
                        airportService: _airportService,
                        onSelected: (code) => _onSearch(code),
                        onClear: () => _onSearch(null),
                      ),
                    ),
                    SizedBox(width: spacing8),
                    // Кнопка фильтра по дате - только иконка календаря
                    Container(
                      height: 48, // Высота как у TextField
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFD9E6F8)),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (kIsWeb) {
                              // Для веба - модальное окно
                              showDialog<void>(
                                context: context,
                                builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius20)),
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 500.0, maxHeight: 600.0),
                                    padding: EdgeInsets.all(padding24),
                                    child: FilterBottomSheet(initialDateFrom: _dateFrom, initialDateTo: _dateTo, onApply: _applyFilters),
                                  ),
                                ),
                              );
                            } else {
                              // Для мобильного - bottom sheet
                              showUniversalBottomSheet<void>(
                                context: context,
                                title: '',
                                height: MediaQuery.of(context).size.height * 0.9,
                                backgroundColor: Colors.transparent,
                                showCloseButton: false,
                                child: FilterBottomSheet(initialDateFrom: _dateFrom, initialDateTo: _dateTo, onApply: _applyFilters),
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(Icons.calendar_today, color: Color(0xFF0A6EFA), size: iconSize),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.medium),
                // Активные фильтры (чипсы)
                if (_hasActiveFilters) ...[
                  Row(
                    children: [
                      // Кнопка "Сбросить все" - красный крестик на белом фоне
                      Container(
                        height: 32, // Высота как у Chip
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16), // Закругления как у Chip
                          border: Border.all(color: Color(0xFFEF4444), width: 1),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _clearAllFilters,
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Icon(Icons.close, color: Color(0xFFEF4444), size: iconSize),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: spacing8),
                      if (_airport != null) ...[
                        Chip(
                          label: Text(_airport!, style: adaptiveRegular12s),
                          deleteIcon: Icon(Icons.close, size: iconSize),
                          onDeleted: () => _onSearch(null),
                          backgroundColor: Color(0xFFD9E6F8),
                          labelStyle: adaptiveRegular12s.copyWith(color: Color(0xFF374151)),
                          labelPadding: EdgeInsets.symmetric(horizontal: 4),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          visualDensity: VisualDensity.compact,
                        ),
                        if (_dateFrom != null || _dateTo != null) SizedBox(width: spacing8),
                      ],
                      if (_dateFrom != null || _dateTo != null)
                        Chip(
                          label: Text(
                            _dateFrom != null && _dateTo != null
                                ? '${formatDate(_dateFrom!)} - ${formatDate(_dateTo!)}'
                                : _dateFrom != null
                                ? 'От: ${formatDate(_dateFrom!)}'
                                : 'До: ${formatDate(_dateTo!)}',
                            style: adaptiveRegular12s,
                          ),
                          deleteIcon: Icon(Icons.close, size: iconSize),
                          onDeleted: () => _applyFilters(null, null),
                          backgroundColor: Color(0xFFD9E6F8),
                          labelStyle: adaptiveRegular12s.copyWith(color: Color(0xFF374151)),
                          labelPadding: EdgeInsets.symmetric(horizontal: 4),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          visualDensity: VisualDensity.compact,
                        ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.section),
                ],
                // Список полетов
                BlocBuilder<FlightsBloc, FlightsState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => _buildLoadingState(context),
                      error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => _buildErrorState(context, errorForUser),
                      success: (flights, airport, departureAirport, arrivalAirport, dateFrom, dateTo) => _buildSuccessState(context, flights),
                      flightCreated: (flight) => _buildSuccessState(context, []), // Игнорируем состояние создания на экране списка
                    );
                  },
                ),
                SizedBox(height: AppSpacing.section),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final horizontalMargin = AppSpacing.horizontal;
    final verticalMargin = AppSpacing.section;
    final padding = 12.0;
    final borderRadius16 = 16.0;
    final borderRadius8 = 8.0;
    final height = 120.0;

    return Column(
      children: List.generate(
        3,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius16),
            border: Border.all(color: Color(0xFFD9E6F8)),
            color: Colors.white,
          ),
          child: Shimmer(
            duration: const Duration(milliseconds: 1000),
            color: const Color(0xFF8D66FE),
            colorOpacity: 0.2,
            child: Container(
              height: height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius8), color: Colors.grey[300]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    final padding = 16.0;
    final borderRadius12 = 12.0;
    final iconSize = 48.0;
    final spacing = 12.0;
    final adaptiveRegular14s = AppStyles.regular14s;
    final adaptiveBold16s = AppStyles.bold16s;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(borderRadius12),
        border: Border.all(color: Color(0xFFEF4444)),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Color(0xFFEF4444), size: iconSize),
          SizedBox(height: spacing),
          Text(
            error,
            style: adaptiveRegular14s.copyWith(color: Color(0xFF991B1B)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacing),
          ElevatedButton(
            onPressed: () {
              context.read<FlightsBloc>().add(GetFlightsEvent(airport: _airport, dateFrom: _dateFrom, dateTo: _dateTo, isRefresh: false));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A6EFA)),
            child: Text('Повторить', style: adaptiveBold16s.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, List<FlightEntity> flights) {
    final padding = 32.0;
    final iconSize = 64.0;
    final spacing16 = AppSpacing.section;
    final spacing8 = 8.0;
    final adaptiveBold16s = AppStyles.bold16s;
    final adaptiveRegular14s = AppStyles.regular14s;

    if (flights.isEmpty) {
      return Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Icon(Icons.flight_takeoff, size: iconSize, color: Color(0xFF9CA5AF)),
            SizedBox(height: spacing16),
            Text('Полеты не найдены', style: adaptiveBold16s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: spacing8),
            Text(
              'Попробуйте изменить параметры поиска',
              style: adaptiveRegular14s.copyWith(color: Color(0xFF9CA5AF)),
              textAlign: TextAlign.center,
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

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_question_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flight_detail_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/bookings_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/questions_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/booking_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/pilot_booking_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/review_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/question_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/create_review_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/edit_review_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/question_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/select_passenger_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/flight_route_map.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';
import 'package:collection/collection.dart';

@RoutePage()
class FlightDetailScreen extends StatefulWidget {
  final int flightId;

  const FlightDetailScreen({super.key, @PathParam('id') required this.flightId});

  @override
  State<FlightDetailScreen> createState() => _FlightDetailScreenState();
}

class _FlightDetailScreenState extends State<FlightDetailScreen> {
  bool _wasAuthenticated = false;
  bool _hasReloadedAfterAuth = false;
  // Кеш профилей для получения данных пассажиров
  Map<int, ProfileEntity> _profilesCache = {};
  bool _isLoadingProfiles = false;

  @override
  void initState() {
    super.initState();
    // Инициализируем состояние авторизации
    final appState = Provider.of<AppState>(context, listen: false);
    _wasAuthenticated = appState.isAuthenticated;
    // Загружаем профили для получения данных пассажиров
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadProfiles();
      }
    });
  }

  /// Загружает профили из API и кеширует их
  Future<void> _loadProfiles() async {
    if (_isLoadingProfiles || _profilesCache.isNotEmpty) return;

    if (!mounted) return;
    setState(() {
      _isLoadingProfiles = true;
    });

    try {
      final profileRepository = getIt<ProfileRepository>();
      final result = await profileRepository.fetchProfiles();

      if (!mounted) return;

      result.fold(
        (failure) {
          print('❌ [FlightDetail] Ошибка загрузки профилей: ${failure.message}');
          if (mounted) {
            setState(() {
              _isLoadingProfiles = false;
            });
          }
        },
        (profiles) {
          if (mounted) {
            setState(() {
              _profilesCache = {for (var profile in profiles) profile.id: profile};
              _isLoadingProfiles = false;
            });
            print('✅ [FlightDetail] Загружено профилей: ${profiles.length}');
          }
        },
      );
    } catch (e) {
      print('❌ [FlightDetail] Исключение при загрузке профилей: $e');
      if (mounted) {
        setState(() {
          _isLoadingProfiles = false;
        });
      }
    }
  }

  /// Получает профиль пассажира по ID
  ProfileEntity? _getPassengerProfile(int passengerId) {
    return _profilesCache[passengerId];
  }

  @override
  Widget build(BuildContext context) {
    final flightId = widget.flightId;
    return BlocProvider(
      create: (context) => FlightDetailBloc(onTheWayRepository: getIt())..add(flightId),
      child: BlocProvider.value(
        value: context.read<BookingsBloc>(),
        child: BlocProvider(
          create: (context) =>
              ReviewsBloc(onTheWayRepository: getIt())..add(GetReviewsByFlightIdEvent(flightId: flightId)),
          child: MultiBlocListener(
            listeners: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  // После успешной авторизации перезагружаем данные полета
                  state.maybeWhen(
                    success: (authEntity) {
                      print('🔵 [FlightDetailScreen] BlocListener: Получено событие успешной авторизации');
                      // Используем задержку, чтобы AppState успел обновиться
                      Future.delayed(Duration(milliseconds: 500), () {
                        if (context.mounted) {
                          final flightDetailBloc = context.read<FlightDetailBloc>();
                          flightDetailBloc.add(widget.flightId);
                          print(
                            '✅ [FlightDetailScreen] BlocListener: Обновление деталей полета после успешной авторизации flightId=${widget.flightId}',
                          );
                        }
                      });
                    },
                    orElse: () {},
                  );
                },
              ),
              BlocListener<BookingsBloc, BookingsState>(
                listener: (context, state) {
                  // Обновляем детали полета после отмены, подтверждения или создания бронирования
                  state.maybeWhen(
                    bookingCancelled: (booking) {
                      // Если отмененное бронирование относится к этому полету, обновляем детали
                      if (booking.flightId == flightId && context.mounted) {
                        final flightDetailBloc = context.read<FlightDetailBloc>();
                        flightDetailBloc.add(flightId);
                        print(
                          '✅ [FlightDetailScreen] Обновление деталей полета после отмены бронирования flightId=$flightId',
                        );
                      }
                    },
                    bookingConfirmed: (booking) {
                      // Если подтвержденное бронирование относится к этому полету, обновляем детали
                      if (booking.flightId == flightId && context.mounted) {
                        final flightDetailBloc = context.read<FlightDetailBloc>();
                        flightDetailBloc.add(flightId);
                        print(
                          '✅ [FlightDetailScreen] Обновление деталей полета после подтверждения бронирования flightId=$flightId',
                        );
                      }
                    },
                    bookingCreated: (booking) {
                      // Если созданное бронирование относится к этому полету, обновляем детали
                      if (booking.flightId == flightId && context.mounted) {
                        final flightDetailBloc = context.read<FlightDetailBloc>();
                        flightDetailBloc.add(flightId);
                        print(
                          '✅ [FlightDetailScreen] Обновление деталей полета после создания бронирования flightId=$flightId',
                        );
                      }
                    },
                    error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                      // Игнорируем ошибку 403 (Forbidden) - это нормально, если пользователь не пилот полета
                      if (statusCode?.contains('403') == true || responseMessage?.contains('Forbidden') == true) {
                        print('⚠️ [FlightDetailScreen] Игнорируем ошибку 403: пользователь не пилот полета');
                        return;
                      }
                      // Для других ошибок можно показать уведомление, но не обязательно
                    },
                    orElse: () {}, // Игнорируем другие состояния
                  );
                },
              ),
              BlocListener<FlightsBloc, FlightsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (flights, airport, departureAirport, arrivalAirport, dateFrom, dateTo) {
                      // Проверяем, что полет действительно был удален (его нет в списке)
                      // Это предотвращает показ сообщения при обычной перезагрузке списка
                      final flightExists = flights.any((f) => f.id == flightId);

                      if (!flightExists && context.mounted) {
                        // Полет был удален - возвращаемся назад
                        // Сообщение об отмене показывается в методе _showCancelFlightDialog
                        Navigator.of(context).pop();
                      } else if (flightExists && context.mounted) {
                        // Находим полет в списке
                        final updatedFlight = flights.firstWhere((f) => f.id == flightId);

                        // Проверяем текущий статус полета в FlightDetailBloc
                        if (!context.mounted) return;
                        final flightDetailState = context.read<FlightDetailBloc>().state;
                        final currentFlightStatus = flightDetailState.maybeWhen(
                          success: (f) => f.status,
                          orElse: () => null,
                        );

                        // Обновляем детали полета только если статус изменился на 'completed'
                        // Это нужно для отображения секции отзывов после завершения полета
                        if (updatedFlight.status == 'completed' && currentFlightStatus != 'completed') {
                          if (!context.mounted) return;
                          final flightDetailBloc = context.read<FlightDetailBloc>();
                          flightDetailBloc.add(flightId);
                          print('✅ [FlightDetailScreen] Обновление деталей полета после завершения flightId=$flightId');
                        }
                      }
                    },
                    error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                      // Показываем ошибку только если это действительно ошибка удаления
                      // Проверяем, что это не просто ошибка загрузки списка
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(responseMessage ?? errorForUser),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 4),
                          ),
                        );
                      }
                    },
                    orElse: () {},
                  );
                },
              ),
            ],
            child: Consumer<AppState>(
              builder: (context, appState, child) {
                // Отслеживаем переход из неавторизованного в авторизованное состояние
                final isNowAuthenticated = appState.isAuthenticated;
                if (isNowAuthenticated && !_wasAuthenticated && !_hasReloadedAfterAuth) {
                  print('🔵 [FlightDetailScreen] Consumer: Обнаружен переход в авторизованное состояние');
                  _hasReloadedAfterAuth = true;
                  // Перезагружаем данные полета после авторизации
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Future.delayed(Duration(milliseconds: 200), () {
                      if (mounted) {
                        final flightDetailBloc = context.read<FlightDetailBloc>();
                        flightDetailBloc.add(widget.flightId);
                        print(
                          '✅ [FlightDetailScreen] Consumer: Обновление деталей полета после авторизации flightId=${widget.flightId}',
                        );
                      }
                    });
                  });
                }
                _wasAuthenticated = isNowAuthenticated;

                return Scaffold(
                  appBar: CustomAppBar(title: 'Детали полета', withBack: true),
                  backgroundColor: AppColors.background,
                  body: BlocBuilder<FlightDetailBloc, FlightDetailState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => _buildLoadingState(),
                        error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) =>
                            _buildErrorState(context, errorForUser),
                        success: (flight) => _buildSuccessState(context, flight),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Показать экран авторизации
  Future<void> _showAuthScreen(BuildContext context) async {
    await showCupertinoModalBottomSheet<bool>(
      barrierColor: Colors.black12,
      topRadius: const Radius.circular(20),
      context: context,
      builder: (context) => PhoneAuthScreen(),
    );
    // После успешной авторизации пользователь останется на этой же странице
    // UI автоматически обновится через Provider/Bloc
  }

  void _showConfirmDialog(BuildContext context, int bookingId, int flightId) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Подтвердить бронирование?', style: AppStyles.bold16s),
        content: Text('Вы уверены, что хотите подтвердить это бронирование?', style: AppStyles.regular14s),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF9CA5AF))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<BookingsBloc>().add(ConfirmBookingEvent(bookingId: bookingId));
              // Обновляем детали полета (список бронирований обновится автоматически через BLoC)
              context.read<FlightDetailBloc>().add(flightId);
            },
            child: Text('Подтвердить', style: AppStyles.bold14s.copyWith(color: Color(0xFF10B981))),
          ),
        ],
      ),
    );
  }

  void _showCancelBookingDialog(BuildContext context, int bookingId, int flightId) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Отклонить бронирование?', style: AppStyles.bold16s),
        content: Text('Вы уверены, что хотите отклонить это бронирование?', style: AppStyles.regular14s),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF9CA5AF))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<BookingsBloc>().add(CancelBookingEvent(bookingId: bookingId));
              // Обновляем список бронирований и детали полета
              context.read<BookingsBloc>().add(GetBookingsByFlightIdEvent(flightId: flightId));
              context.read<FlightDetailBloc>().add(flightId);
            },
            child: Text('Отклонить', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }

  void _showCancelFlightDialog(BuildContext context, int flightId) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Отменить полёт?', style: AppStyles.bold16s),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Вы уверены, что хотите отменить этот полёт?', style: AppStyles.regular14s),
            SizedBox(height: 12.h),
            Text(
              '⚠️ Внимание: Все бронирования на этот полёт будут автоматически отменены. Полёт и бронирования сохранятся в истории.',
              style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF9CA5AF))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<FlightsBloc>().add(DeleteFlightEvent(flightId: flightId));
            },
            child: Text('Отменить полёт', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }

  void _showCompleteFlightDialog(BuildContext context, int flightId) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Завершить полёт?', style: AppStyles.bold16s),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Вы уверены, что хотите завершить этот полёт?', style: AppStyles.regular14s),
            SizedBox(height: 12.h),
            Text(
              '✅ После завершения полёта пассажиры и пилот смогут оставлять отзывы друг о друге.',
              style: AppStyles.regular14s.copyWith(color: Color(0xFF10B981)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF9CA5AF))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<FlightsBloc>().add(UpdateFlightEvent(flightId: flightId, status: 'completed'));
              // Обновление деталей полета произойдет автоматически через BlocListener после успешного обновления
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Полёт успешно завершён'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: Text('Завершить полёт', style: AppStyles.bold14s.copyWith(color: Color(0xFFFFA726))),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Column(
        children: [
          Shimmer(
            duration: const Duration(milliseconds: 1000),
            color: const Color(0xFF8D66FE),
            colorOpacity: 0.2,
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: Colors.grey[300]),
            ),
          ),
          SizedBox(height: 16.h),
          Shimmer(
            duration: const Duration(milliseconds: 1000),
            color: const Color(0xFF8D66FE),
            colorOpacity: 0.2,
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Color(0xFFEF4444), size: 64),
            SizedBox(height: 16.h),
            Text(
              error,
              style: AppStyles.regular14s.copyWith(color: Color(0xFF991B1B)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                context.read<FlightDetailBloc>().add(widget.flightId);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A6EFA)),
              child: Text('Повторить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, FlightEntity flight) {
    final priceFormat = NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0);
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    // Проверяем, является ли текущий пользователь владельцем полета
    final profileState = context.read<ProfileBloc>().state;
    final isOwner = profileState.maybeWhen(success: (profile) => profile.id == flight.pilotId, orElse: () => false);

    // Загружаем бронирования только если пользователь является пилотом полета
    // Для пассажиров бронирования загружаются через GetBookingsEvent в других местах
    if (isOwner && isAuthenticated) {
      final bookingsState = context.read<BookingsBloc>().state;
      // Загружаем только если еще не загружены или если это ошибка 403 (которую мы игнорируем)
      final shouldLoad = bookingsState.maybeWhen(
        success: (bookings) {
          // Проверяем, есть ли бронирования для этого полета
          final hasBookingsForFlight = bookings.any((b) => b.flightId == flight.id);
          return !hasBookingsForFlight; // Загружаем, если нет бронирований для этого полета
        },
        error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
          // Если это ошибка 403, не загружаем (пользователь не пилот)
          if (statusCode?.contains('403') == true || responseMessage?.contains('Forbidden') == true) {
            return false;
          }
          return true; // Для других ошибок пытаемся загрузить снова
        },
        orElse: () => true, // Если loading или другое состояние, загружаем
      );

      if (shouldLoad) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<BookingsBloc>().add(GetBookingsByFlightIdEvent(flightId: flight.id));
        });
      }
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Информация о полете
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Color(0xFFD9E6F8)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Статус полета (поднят наверх)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.tag, size: 16, color: Color(0xFF9CA5AF)),
                        SizedBox(width: 6.w),
                        Text('ID полета: ${flight.id}', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: flight.status == 'active'
                            ? Color(0xFFD1FAE5)
                            : flight.status == 'completed'
                            ? Color(0xFFFFF4E6)
                            : Color(0xFFFEE2E2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            flight.status == 'active'
                                ? Icons.check_circle
                                : flight.status == 'completed'
                                ? Icons.done_all
                                : Icons.cancel,
                            size: 16,
                            color: flight.status == 'active'
                                ? Color(0xFF10B981)
                                : flight.status == 'completed'
                                ? Color(0xFFFFA726)
                                : Color(0xFFEF4444),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            flight.status == 'active'
                                ? 'Активен'
                                : flight.status == 'completed'
                                ? 'Завершен'
                                : 'Отменен',
                            style: AppStyles.regular12s.copyWith(
                              color: flight.status == 'active'
                                  ? Color(0xFF10B981)
                                  : flight.status == 'completed'
                                  ? Color(0xFFFFA726)
                                  : Color(0xFFEF4444),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Карта с маршрутом
                if (flight.waypoints != null && flight.waypoints!.isNotEmpty) ...[
                  FlightRouteMap(
                    flight: flight,
                    airportService: AirportService((getIt<ApiDatasource>() as ApiDatasourceDio).dio),
                    height: 300,
                  ),
                  SizedBox(height: 24.h),
                ],
                // Маршрут с детальной информацией
                // ВСЕ точки маршрута (включая первую и последнюю) теперь в waypoints
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (flight.waypoints != null && flight.waypoints!.isNotEmpty) ...[
                      // Отображаем все точки из waypoints
                      ...flight.waypoints!.asMap().entries.map((entry) {
                        final index = entry.key;
                        final waypoint = entry.value;
                        final isFirst = index == 0;
                        final isLast = index == flight.waypoints!.length - 1;

                        return Column(
                          children: [
                            if (index > 0) ...[
                              SizedBox(height: 16.h),
                              Padding(
                                padding: EdgeInsets.only(left: 28.w),
                                child: Icon(
                                  Icons.arrow_downward,
                                  size: 24,
                                  color: isLast ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF),
                                ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                            _buildAirportInfoDetail(
                              context: context,
                              icon: isFirst ? Icons.flight_takeoff : (isLast ? Icons.flight_land : Icons.flight),
                              code: waypoint.airportCode,
                              identRu: waypoint.airportIdentRu,
                              name: waypoint.airportName,
                              city: waypoint.airportCity,
                              region: waypoint.airportRegion,
                              type: waypoint.airportType,
                              isInternational: false,
                            ),
                            // Время прибытия/отправления и комментарий для точки
                            if (waypoint.arrivalTime != null ||
                                waypoint.departureTime != null ||
                                (waypoint.comment != null && waypoint.comment!.isNotEmpty)) ...[
                              SizedBox(height: 12.h),
                              Padding(
                                padding: EdgeInsets.only(left: 28.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Для первой точки - только время отправления
                                    if (isFirst && waypoint.departureTime != null)
                                      _buildInfoRow(
                                        Icons.access_time,
                                        'Время отправления',
                                        DateFormat('dd.MM.yyyy HH:mm').format(waypoint.departureTime!),
                                      ),
                                    // Для последней точки - только время прибытия
                                    if (isLast && waypoint.arrivalTime != null)
                                      _buildInfoRow(
                                        Icons.access_time,
                                        'Время прибытия',
                                        DateFormat('dd.MM.yyyy HH:mm').format(waypoint.arrivalTime!),
                                      ),
                                    // Для промежуточных точек - оба времени
                                    if (!isFirst && !isLast) ...[
                                      if (waypoint.arrivalTime != null)
                                        _buildInfoRow(
                                          Icons.access_time,
                                          'Время прибытия',
                                          DateFormat('dd.MM.yyyy HH:mm').format(waypoint.arrivalTime!),
                                        ),
                                      if (waypoint.departureTime != null) ...[
                                        if (waypoint.arrivalTime != null) SizedBox(height: 8.h),
                                        _buildInfoRow(
                                          Icons.access_time,
                                          'Время отправления',
                                          DateFormat('dd.MM.yyyy HH:mm').format(waypoint.departureTime!),
                                        ),
                                      ],
                                    ],
                                    // Комментарий для всех точек - более заметный UI
                                    if (waypoint.comment != null && waypoint.comment!.isNotEmpty) ...[
                                      // Добавляем отступ только если есть время перед комментарием
                                      if ((isFirst && waypoint.departureTime != null) ||
                                          (isLast && waypoint.arrivalTime != null) ||
                                          (!isFirst &&
                                              !isLast &&
                                              (waypoint.arrivalTime != null || waypoint.departureTime != null)))
                                        SizedBox(height: 12.h),
                                      // Выделенный блок для комментария
                                      Container(
                                        padding: EdgeInsets.all(12.w),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F6),
                                          borderRadius: BorderRadius.circular(8.r),
                                          border: Border.all(color: Color(0xFFE5E7EB)),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.comment_outlined, size: 20, color: Color(0xFF0A6EFA)),
                                            SizedBox(width: 8.w),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Комментарий',
                                                    style: AppStyles.regular12s.copyWith(
                                                      color: Color(0xFF9CA5AF),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    waypoint.comment!,
                                                    style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ],
                        );
                      }).toList(),
                    ],
                  ],
                ),
                SizedBox(height: 16.h),
                // Цена за место
                _buildInfoRow(Icons.attach_money, 'Цена за место', priceFormat.format(flight.pricePerSeat)),
                SizedBox(height: 12.h),
                // Всего мест и свободных мест
                if (flight.totalSeats != null) ...[
                  _buildInfoRow(Icons.event_seat, 'Всего мест', '${flight.totalSeats}'),
                  SizedBox(height: 12.h),
                  _buildInfoRow(Icons.event_seat, 'Свободных мест', '${flight.availableSeats}'),
                ] else ...[
                  _buildInfoRow(Icons.event_seat, 'Свободных мест', '${flight.availableSeats}'),
                ],
                // Тип самолета
                if (flight.aircraftType != null && flight.aircraftType!.isNotEmpty) ...[
                  SizedBox(height: 12.h),
                  _buildInfoRow(Icons.flight, 'Тип самолета', flight.aircraftType!),
                ],
                // Описание
                if (flight.description != null && flight.description!.isNotEmpty) ...[
                  SizedBox(height: 16.h),
                  Divider(),
                  SizedBox(height: 12.h),
                  Text(
                    'Дополнительная информация о полёте',
                    style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                  ),
                  SizedBox(height: 8.h),
                  Text(flight.description!, style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
                ],
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // Информация о пилоте (улучшенный UI)
          if (flight.pilotFullName != null || flight.pilotAverageRating != null) ...[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Color(0xFFD9E6F8)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, size: 20, color: Color(0xFF0A6EFA)),
                      SizedBox(width: 8.w),
                      Text('Пилот', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      // Аватар пилота
                      if (flight.pilotAvatarUrl != null && flight.pilotAvatarUrl!.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40.r),
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(flight.pilotAvatarUrl!),
                            width: 60.w,
                            height: 60.w,
                            fit: BoxFit.cover,
                            cacheManager: GetIt.instance<DefaultCacheManager>(),
                            placeholder: (context, url) => Container(
                              width: 60.w,
                              height: 60.w,
                              color: Color(0xFFF3F4F6),
                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 60.w,
                              height: 60.w,
                              color: Color(0xFFF3F4F6),
                              child: Icon(Icons.person, size: 30, color: Color(0xFF9CA5AF)),
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(color: Color(0xFFF3F4F6), shape: BoxShape.circle),
                          child: Icon(Icons.person, size: 30, color: Color(0xFF9CA5AF)),
                        ),
                      SizedBox(width: 16.w),
                      // Информация о пилоте
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (flight.pilotFullName != null) ...[
                              Text(flight.pilotFullName!, style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                              SizedBox(height: 8.h),
                            ],
                            if (flight.pilotAverageRating != null && flight.pilotAverageRating! > 0) ...[
                              Row(
                                children: [
                                  Icon(Icons.star, size: 18, color: Color(0xFFFFA726)),
                                  SizedBox(width: 4.w),
                                  Text(
                                    flight.pilotAverageRating!.toStringAsFixed(1),
                                    style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text('Рейтинг', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                                  SizedBox(width: 8.w),
                                  GestureDetector(
                                    child: Text(
                                      'Отзывы',
                                      style: AppStyles.regular14s.copyWith(
                                        color: Color(0xFF0A6EFA),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () {
                                      openPilotReviews(context: context, pilotId: flight.pilotId);
                                    },
                                  ),
                                ],
                              ),
                            ] else ...[
                              Text('Нет рейтинга', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
          // Секция фотографий (над бронированиями) - обновляется отдельно
          BlocBuilder<FlightDetailBloc, FlightDetailState>(
            buildWhen: (previous, current) {
              // Обновляем только если изменились фотографии
              if (previous is SuccessFlightDetailState && current is SuccessFlightDetailState) {
                final prevPhotos = previous.flight.photos ?? [];
                final currPhotos = current.flight.photos ?? [];
                return prevPhotos.length != currPhotos.length ||
                    !const ListEquality<String>().equals(prevPhotos, currPhotos);
              }
              return current is SuccessFlightDetailState;
            },
            builder: (context, state) {
              return state.maybeWhen(
                success: (updatedFlight) => _buildPhotosSection(context, updatedFlight, isAuthenticated, isOwner),
                orElse: () => _buildPhotosSection(context, flight, isAuthenticated, isOwner),
              );
            },
          ),
          // Бронирования (для пилота)
          if (isAuthenticated && isOwner) ...[
            BlocBuilder<BookingsBloc, BookingsState>(
              builder: (context, bookingsState) {
                return bookingsState.maybeWhen(
                  success: (bookings) {
                    final flightBookings = bookings.where((b) => b.flightId == flight.id).toList();
                    if (flightBookings.isEmpty) {
                      return SizedBox.shrink();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text('Бронирования', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                        ),
                        SizedBox(height: 12.h),
                        ...flightBookings.map((booking) {
                          return PilotBookingCard(
                            booking: booking,
                            onConfirm: () {
                              _showConfirmDialog(context, booking.id, flight.id);
                            },
                            onCancel: () {
                              _showCancelBookingDialog(context, booking.id, flight.id);
                            },
                          );
                        }),
                        SizedBox(height: 24.h),
                      ],
                    );
                  },
                  loading: () => SizedBox.shrink(),
                  bookingConfirmed: (booking) {
                    // Показываем загрузку во время обновления списка после подтверждения
                    return SizedBox.shrink();
                  },
                  bookingCreated: (booking) {
                    // Показываем загрузку во время обновления списка после создания
                    return SizedBox.shrink();
                  },
                  bookingCancelled: (booking) {
                    // Показываем загрузку во время обновления списка после отмены
                    return SizedBox.shrink();
                  },
                  orElse: () => SizedBox.shrink(),
                );
              },
            ),
          ],
          // Кнопки действий
          if (isAuthenticated) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  if (isOwner) ...[
                    // Кнопки для владельца (только для активных полетов)
                    if (flight.status == 'active')
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () async {
                                    final result = await AutoRouter.of(context).push(EditFlightRoute(flight: flight));
                                    // Обновляем детали полета после редактирования
                                    if (result == true && context.mounted) {
                                      context.read<FlightDetailBloc>().add(flight.id);
                                    }
                                  },
                                  icon: Icon(Icons.edit, color: Color(0xFF0A6EFA)),
                                  label: Text(
                                    'Редактировать',
                                    style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA)),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 14.h),
                                    side: BorderSide(color: Color(0xFFD9E6F8)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    _showCancelFlightDialog(context, flight.id);
                                  },
                                  icon: Icon(Icons.cancel, color: Color(0xFFEF4444)),
                                  label: Text(
                                    'Отменить полёт',
                                    style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444)),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 14.h),
                                    side: BorderSide(color: Color(0xFFEF4444)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _showCompleteFlightDialog(context, flight.id);
                              },
                              icon: Icon(Icons.check_circle, color: Colors.white),
                              label: Text('Завершить полёт', style: AppStyles.bold14s.copyWith(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFFA726),
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ] else ...[
                    // Кнопки для пассажира (только для активных полетов)
                    if (flight.status == 'active') ...[
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: flight.availableSeats > 0
                                  ? () {
                                      final flightDetailBloc = context.read<FlightDetailBloc>();
                                      showDialog<Map<String, dynamic>>(
                                        context: context,
                                        builder: (dialogContext) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider.value(value: context.read<BookingsBloc>()),
                                            BlocProvider.value(value: flightDetailBloc),
                                          ],
                                          child: BookingDialog(flight: flight),
                                        ),
                                      ).then((result) {
                                        if (result != null && result['success'] == true) {
                                          // Обновляем детали полета после успешного бронирования
                                          if (context.mounted) {
                                            flightDetailBloc.add(flight.id);
                                            // Сбрасываем состояние бронирования для следующего использования
                                            context.read<BookingsBloc>().add(GetBookingsEvent());

                                            // Если нужно переключиться на вкладку "Мои бронирования"
                                            if (result['switchToMyBookings'] == true) {
                                              // Возвращаемся на главный экран и переключаемся на вкладку "Мои бронирования"
                                              // Закрываем текущий экран деталей полета
                                              Navigator.of(context).pop();

                                              // Переключаемся на вкладку "Мои бронирования" через navigate
                                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                                if (context.mounted) {
                                                  // Используем navigate для перехода на OnTheWayNavigationRoute с нужной вкладкой
                                                  // Это заменит текущий маршрут на новый
                                                  context.router.navigate(
                                                    OnTheWayNavigationRoute(
                                                      children: [FlightsListRoute(initialTabIndex: 2)],
                                                    ),
                                                  );
                                                }
                                              });
                                            }
                                          }
                                        }
                                      });
                                    }
                                  : null, // Неактивна, если нет свободных мест
                              icon: Icon(Icons.bookmark),
                              label: Text('Забронировать место', style: AppStyles.bold16s),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0A6EFA),
                                disabledBackgroundColor: Color(0xFF9CA5AF),
                                disabledForegroundColor: Colors.white,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ] else ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF4E6),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Color(0xFFFFA726)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Color(0xFFFFA726)),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            'Для бронирования места или задать вопрос необходимо войти в систему',
                            style: AppStyles.regular14s.copyWith(color: Color(0xFFE65100)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _showAuthScreen(context),
                        icon: Icon(Icons.login, size: 18),
                        label: Text('Войти', style: AppStyles.bold14s),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0A6EFA),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          // SizedBox(height: 24.h),
          // Секция вопросов пилоту (доступна всем)
          _buildQuestionsSection(context, flight, isAuthenticated, isOwner),
          // SizedBox(height: 24.h),
          // Секция отзывов (только для завершенных полетов)
          if (flight.status == 'completed') _buildReviewsSection(context, flight, isAuthenticated, isOwner),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context, FlightEntity flight, bool isAuthenticated, bool isOwner) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      buildWhen: (previous, current) {
        // Перестраиваем при любом изменении состояния, чтобы обновить canReply
        // Особенно важно перестраивать при успешной загрузке отзывов
        if (previous is SuccessReviewsState && current is SuccessReviewsState) {
          // Перестраиваем, если количество отзывов изменилось (добавился ответ)
          return previous.reviews.length != current.reviews.length ||
              previous.reviews.any(
                (prevReview) => !current.reviews.any((currReview) => currReview.id == prevReview.id),
              ) ||
              current.reviews.any(
                (currReview) => !previous.reviews.any((prevReview) => prevReview.id == currReview.id),
              );
        }
        return true;
      },
      builder: (context, reviewsState) {
        // Получаем текущего пользователя
        final profileState = context.read<ProfileBloc>().state;
        final currentUserId = profileState.maybeWhen(success: (profile) => profile.id, orElse: () => null);

        // Проверяем, есть ли уже отзыв о пилоте от текущего пользователя
        bool hasPilotReview = false;
        // Проверяем, есть ли еще пассажиры без отзывов (для пилота)
        bool hasPassengersWithoutReviews = false;
        reviewsState.maybeWhen(
          success: (reviews, flights) {
            if (currentUserId != null) {
              hasPilotReview = reviews.any(
                (review) =>
                    review.reviewerId == currentUserId &&
                    review.reviewedId == flight.pilotId &&
                    review.replyToReviewId == null,
              );

              // Для пилота: проверяем, есть ли еще пассажиры без отзывов
              if (isOwner) {
                final bookingsState = context.read<BookingsBloc>().state;
                final confirmedBookings = bookingsState.maybeWhen(
                  success: (bookings) =>
                      bookings.where((b) => b.flightId == flight.id && b.status == 'confirmed').toList(),
                  orElse: () => <BookingEntity>[],
                );

                // Получаем список ID пассажиров, о которых уже есть отзывы от текущего пилота
                final reviewedPassengerIds = reviews
                    .where(
                      (review) =>
                          review.reviewerId == currentUserId &&
                          review.replyToReviewId == null &&
                          review.reviewedId != flight.pilotId,
                    )
                    .map((review) => review.reviewedId)
                    .toSet();

                // Проверяем, есть ли пассажиры, о которых еще нет отзывов
                hasPassengersWithoutReviews = confirmedBookings.any(
                  (booking) => !reviewedPassengerIds.contains(booking.passengerId),
                );
              }
            }
          },
          orElse: () {},
        );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isAuthenticated && ((!isOwner && !hasPilotReview) || (isOwner && hasPassengersWithoutReviews)))
                    TextButton.icon(
                      onPressed: () => _showCreateReviewDialog(context, flight, isOwner),
                      icon: Icon(Icons.add, size: 18, color: Color(0xFF0A6EFA)),
                      label: Text('Оставить отзыв', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
                    ),
                ],
              ),
              SizedBox(height: 16.h),
              reviewsState.when(
                loading: () => Center(
                  child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                ),
                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                  ),
                ),
                success: (reviews, flights) {
                  if (reviews.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.reviews_outlined, size: 48, color: Color(0xFF9CA5AF)),
                            SizedBox(height: 12.h),
                            Text('Пока нет отзывов', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                          ],
                        ),
                      ),
                    );
                  }

                  // Разделяем отзывы: о пилоте и о пассажирах
                  final mainReviews = reviews.where((r) => r.replyToReviewId == null).toList();
                  final replies = reviews.where((r) => r.replyToReviewId != null).toList();

                  // Отзывы о пилоте (где reviewedId == pilotId)
                  final pilotReviews = mainReviews.where((r) => r.reviewedId == flight.pilotId).toList();
                  // Отзывы о пассажирах (где reviewedId != pilotId)
                  final passengerReviews = mainReviews.where((r) => r.reviewedId != flight.pilotId).toList();

                  // Вычисляем средний рейтинг пилота из таблицы reviews (один раз для всех отзывов)
                  final pilotRatingReviews = reviews
                      .where(
                        (r) =>
                            r.reviewedId == flight.pilotId &&
                            r.rating != null &&
                            r.replyToReviewId == null, // Только основные отзывы, не ответы
                      )
                      .toList();

                  double? pilotAverageRating;
                  if (pilotRatingReviews.isNotEmpty) {
                    final ratingsSum = pilotRatingReviews.fold<int>(0, (sum, r) => sum + (r.rating ?? 0));
                    pilotAverageRating = ratingsSum / pilotRatingReviews.length;
                    print('🔵 [FlightDetail] Вычислен средний рейтинг пилота для всех отзывов:');
                    print('   - Всего отзывов о пилоте: ${pilotRatingReviews.length}');
                    print('   - Сумма рейтингов: $ratingsSum');
                    print('   - Средний рейтинг: $pilotAverageRating');
                  } else {
                    pilotAverageRating = null;
                    print('⚠️ [FlightDetail] Нет отзывов о пилоте для вычисления рейтинга');
                  }

                  final profileState = context.read<ProfileBloc>().state;
                  final currentUserId = profileState.maybeWhen(success: (profile) => profile.id, orElse: () => null);

                  // Получаем данные о бронированиях для поиска информации о пассажирах
                  final bookingsState = context.read<BookingsBloc>().state;
                  final bookings = bookingsState.maybeWhen(
                    success: (bookings) {
                      final flightBookings = bookings.where((b) => b.flightId == flight.id).toList();
                      print('🔵 [FlightDetail] Состояние бронирований: success');
                      print('   - Всего бронирований в состоянии: ${bookings.length}');
                      print('   - Бронирований для этого полета: ${flightBookings.length}');
                      if (flightBookings.isNotEmpty) {
                        print('   - ID бронирований для этого полета: ${flightBookings.map((b) => b.id).toList()}');
                      }
                      return flightBookings;
                    },
                    loading: () {
                      print('⚠️ [FlightDetail] Состояние бронирований: loading');
                      return <BookingEntity>[];
                    },
                    error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                      print('❌ [FlightDetail] Состояние бронирований: error');
                      print('   - errorForUser: $errorForUser');
                      print('   - errorFromApi: $errorFromApi');
                      return <BookingEntity>[];
                    },
                    orElse: () {
                      print('⚠️ [FlightDetail] Состояние бронирований: unknown');
                      return <BookingEntity>[];
                    },
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Секция: Отзывы о пилоте
                      if (pilotReviews.isNotEmpty) ...[
                        Text('Отзывы о пилоте', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                        SizedBox(height: 12.h),
                        ...pilotReviews.map((review) {
                          final reviewReplies = replies.where((r) => r.replyToReviewId == review.id).toList();
                          final canDelete = currentUserId != null && review.reviewerId == currentUserId;
                          final canEdit = currentUserId != null && review.reviewerId == currentUserId;

                          // Проверяем, может ли текущий пользователь ответить на отзыв о пилоте
                          // Пассажир может ответить только один раз
                          bool canReply = false;
                          if (currentUserId != null && review.reviewerId != currentUserId) {
                            // Проверяем, что пользователь имеет право отвечать (он пассажир этого полета)
                            final hasBooking = bookings.any(
                              (b) => b.passengerId == currentUserId && b.flightId == flight.id,
                            );

                            if (hasBooking) {
                              // Проверяем, что еще нет ответа от текущего пользователя на этот отзыв
                              // Используем reviewReplies, который уже отфильтрован для этого отзыва
                              final existingReplies = reviewReplies
                                  .where((r) => r.reviewerId == currentUserId)
                                  .toList();

                              // Если нет ответов от текущего пользователя, можно ответить
                              canReply = existingReplies.isEmpty;

                              // Отладочная информация
                              print('🔵 [FlightDetail] Проверка ответа на отзыв ${review.id}:');
                              print('   - currentUserId: $currentUserId');
                              print('   - review.reviewerId: ${review.reviewerId}');
                              print('   - hasBooking: $hasBooking');
                              print('   - Всего отзывов в списке: ${reviews.length}');
                              print('   - Всего ответов на этот отзыв: ${reviewReplies.length}');
                              print('   - Ответов от currentUserId: ${existingReplies.length}');
                              if (existingReplies.isNotEmpty) {
                                print('   - existingReplies IDs: ${existingReplies.map((r) => r.id).toList()}');
                                print(
                                  '   - existingReplies reviewerIds: ${existingReplies.map((r) => r.reviewerId).toList()}',
                                );
                              }
                              print('   - canReply: $canReply');
                            }
                          }

                          // Отладочная информация для отзывов о пилоте
                          print('🔵 [FlightDetail] Отзыв о пилоте ${review.id}:');
                          print('   - pilotFullName: ${flight.pilotFullName}');
                          print('   - pilotAvatarUrl: ${flight.pilotAvatarUrl}');
                          print('   - pilotAverageRating (вычисленный): $pilotAverageRating');
                          print('   - review.rating: ${review.rating}');

                          return Column(
                            key: ValueKey('pilot_review_${review.id}_${reviewReplies.length}_$canReply'),
                            children: [
                              ReviewCard(
                                key: ValueKey('review_card_${review.id}_$canReply'),
                                review: review,
                                canDelete: canDelete,
                                canEdit: canEdit,
                                onDelete: canDelete ? () => _showDeleteReviewDialog(context, review.id) : null,
                                onEdit: canEdit ? () => _showEditReviewDialog(context, review) : null,
                                onReply: canReply
                                    ? () => _showReplyToReviewDialog(context, flight, review, isOwner)
                                    : null,
                                onTap: () {}, // Отзывы на странице детальной информации о полёте не требуют навигации
                                reviewedName: flight.pilotFullName,
                                reviewedAvatarUrl: flight.pilotAvatarUrl,
                                reviewedRating: pilotAverageRating, // Используем вычисленный рейтинг
                              ),
                              // Отображаем ответы на отзыв (если они есть)
                              ...reviewReplies.map((reply) {
                                final canDeleteReply = currentUserId != null && reply.reviewerId == currentUserId;
                                final canEditReply = currentUserId != null && reply.reviewerId == currentUserId;
                                return Padding(
                                  padding: EdgeInsets.only(left: 40.w, top: 12.h),
                                  child: ReviewCard(
                                    review: reply,
                                    isReply: true,
                                    canDelete: canDeleteReply,
                                    canEdit: canEditReply,
                                    onDelete: canDeleteReply ? () => _showDeleteReviewDialog(context, reply.id) : null,
                                    onEdit: canEditReply ? () => _showEditReviewDialog(context, reply) : null,
                                    onTap: () {}, // Ответы не требуют навигации
                                  ),
                                );
                              }),
                            ],
                          );
                        }).toList(),
                        SizedBox(height: 24.h),
                      ],
                      // Секция: Отзывы о пассажирах
                      if (passengerReviews.isNotEmpty) ...[
                        Text('Отзывы о пассажирах', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                        SizedBox(height: 12.h),
                        ...passengerReviews.asMap().entries.map((entry) {
                          final index = entry.key;
                          final review = entry.value;
                          final reviewReplies = replies.where((r) => r.replyToReviewId == review.id).toList();
                          final canDelete = currentUserId != null && review.reviewerId == currentUserId;
                          final canEdit = currentUserId != null && review.reviewerId == currentUserId;
                          // Можно ответить только на отзыв, который оставлен на текущего пользователя
                          // Проверяем, что еще нет ответа от текущего пользователя на этот отзыв
                          bool canReply = false;
                          if (currentUserId != null && review.reviewedId == currentUserId) {
                            // Используем reviewReplies, который уже отфильтрован для этого отзыва
                            final existingReplies = reviewReplies.where((r) => r.reviewerId == currentUserId).toList();
                            // Если нет ответов от текущего пользователя, можно ответить
                            canReply = existingReplies.isEmpty;

                            print('🔵 [FlightDetail] Проверка ответа на отзыв о пассажире ${review.id}:');
                            print('   - currentUserId: $currentUserId');
                            print('   - review.reviewedId: ${review.reviewedId}');
                            print('   - Всего ответов на этот отзыв: ${reviewReplies.length}');
                            print('   - Ответов от currentUserId: ${existingReplies.length}');
                            print('   - canReply: $canReply');
                          }

                          // Получаем информацию о пассажире из таблицы профилей
                          // reviewedId - это ID пассажира (пользователя), о котором отзыв
                          final passengerProfile = _getPassengerProfile(review.reviewedId);

                          // Если профиль не найден и профили еще не загружаются, пытаемся загрузить (без await, так как это синхронный контекст)
                          if (passengerProfile == null && !_isLoadingProfiles && _profilesCache.isEmpty) {
                            print('⚠️ [FlightDetail] Профиль не найден, пытаемся загрузить профили...');
                            // Используем WidgetsBinding для безопасного вызова после build
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (mounted) {
                                _loadProfiles(); // Загружаем асинхронно, но не ждем
                              }
                            });
                          }

                          print('🔵 [FlightDetail] Получение данных пассажира для отзыва ${review.id}:');
                          print('   - review.reviewedId (ID пассажира): ${review.reviewedId}');
                          print('   - passengerProfile: ${passengerProfile != null ? "найден" : "не найден"}');
                          if (passengerProfile != null) {
                            print('   - passengerProfile.firstName: ${passengerProfile.firstName}');
                            print('   - passengerProfile.lastName: ${passengerProfile.lastName}');
                            print('   - passengerProfile.avatarUrl: ${passengerProfile.avatarUrl}');
                            print('   - passengerProfile.averageRating: ${passengerProfile.averageRating}');
                          } else {
                            print('   ⚠️ [FlightDetail] Профиль пассажира не найден в кеше!');
                            print('   - Размер кеша профилей: ${_profilesCache.length}');
                            print('   - ID в кеше: ${_profilesCache.keys.toList()}');
                            print('   - _isLoadingProfiles: $_isLoadingProfiles');
                          }

                          // Получаем информацию о пассажире из профиля
                          String? passengerName;
                          String? passengerAvatarUrl;
                          double? passengerRating;

                          if (passengerProfile != null) {
                            // Формируем полное имя из firstName и lastName
                            if (passengerProfile.firstName != null && passengerProfile.lastName != null) {
                              passengerName = '${passengerProfile.firstName} ${passengerProfile.lastName}'.trim();
                            } else if (passengerProfile.firstName != null) {
                              passengerName = passengerProfile.firstName;
                            } else if (passengerProfile.lastName != null) {
                              passengerName = passengerProfile.lastName;
                            }
                            passengerAvatarUrl = passengerProfile.avatarUrl;
                          }

                          // Вычисляем средний рейтинг пассажира из таблицы reviews
                          // Ищем все отзывы, где reviewedId == review.reviewedId (ID пассажира)
                          final passengerReviews = reviews
                              .where(
                                (r) =>
                                    r.reviewedId == review.reviewedId &&
                                    r.rating != null &&
                                    r.replyToReviewId == null, // Только основные отзывы, не ответы
                              )
                              .toList();

                          if (passengerReviews.isNotEmpty) {
                            final ratingsSum = passengerReviews.fold<int>(0, (sum, r) => sum + (r.rating ?? 0));
                            passengerRating = ratingsSum / passengerReviews.length;
                            print('🔵 [FlightDetail] Вычислен средний рейтинг пассажира:');
                            print('   - Всего отзывов о пассажире: ${passengerReviews.length}');
                            print('   - Сумма рейтингов: $ratingsSum');
                            print('   - Средний рейтинг: $passengerRating');
                          } else {
                            passengerRating = null;
                            print('⚠️ [FlightDetail] Нет отзывов о пассажире для вычисления рейтинга');
                          }

                          // Если информация о пассажире не найдена в профиле, используем fallback
                          // Важно: всегда должно быть имя, чтобы блок "Отзыв о:" отображался
                          if (passengerName == null || passengerName.isEmpty) {
                            passengerName = 'Пассажир #${review.reviewedId}';
                          }

                          // Убеждаемся, что имя не пустое (для отображения блока "Отзыв о:")
                          if (passengerName.isEmpty) {
                            passengerName = 'Пассажир #${review.reviewedId}';
                          }

                          // Отладочная информация
                          print('🔵 [FlightDetail] Отзыв о пассажире ${review.id}:');
                          print('   - reviewedId: ${review.reviewedId}');
                          print('   - passengerName: $passengerName');
                          print('   - passengerAvatarUrl: $passengerAvatarUrl');
                          print('   - passengerRating: $passengerRating');
                          print('   - review.rating (рейтинг отзыва): ${review.rating}');
                          print(
                            '   - passengerProfile: ${passengerProfile != null ? "найден (ID: ${passengerProfile.id})" : "не найден"}',
                          );
                          print('   - Передаем в ReviewCard:');
                          print('     reviewedName: $passengerName');
                          print('     reviewedRating: $passengerRating');

                          return Column(
                            key: ValueKey('passenger_review_${review.id}_${reviewReplies.length}_$canReply'),
                            children: [
                              // Разделитель между отзывами (кроме первого)
                              if (index > 0) ...[
                                SizedBox(height: 26.h),
                                Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB), indent: 0, endIndent: 0),
                                SizedBox(height: 26.h),
                              ],
                              ReviewCard(
                                key: ValueKey('review_card_${review.id}_$canReply'),
                                review: review,
                                canDelete: canDelete,
                                canEdit: canEdit,
                                onDelete: canDelete ? () => _showDeleteReviewDialog(context, review.id) : null,
                                onEdit: canEdit ? () => _showEditReviewDialog(context, review) : null,
                                onReply: canReply
                                    ? () => _showReplyToReviewDialog(context, flight, review, isOwner)
                                    : null,
                                onTap: () {}, // Отзывы на странице детальной информации о полёте не требуют навигации
                                // Информация о пилоте, который оставил отзыв (для блока со стрелкой)
                                reviewerName: flight.pilotFullName, // Имя пилота для блока "Кто оставил → О ком"
                                reviewerAvatarUrl: flight.pilotAvatarUrl,
                                reviewerRating: pilotAverageRating, // Средний рейтинг пилота (вычисленный из отзывов)
                                // Информация о пассажире, о котором отзыв
                                reviewedName: passengerName,
                                reviewedAvatarUrl: passengerAvatarUrl,
                                reviewedRating: passengerRating,
                              ),
                              // Отображаем ответы на отзыв (если они есть)
                              ...reviewReplies.map((reply) {
                                final canDeleteReply = currentUserId != null && reply.reviewerId == currentUserId;
                                final canEditReply = currentUserId != null && reply.reviewerId == currentUserId;
                                return Padding(
                                  padding: EdgeInsets.only(left: 40.w, top: 12.h),
                                  child: ReviewCard(
                                    review: reply,
                                    isReply: true,
                                    canDelete: canDeleteReply,
                                    canEdit: canEditReply,
                                    onDelete: canDeleteReply ? () => _showDeleteReviewDialog(context, reply.id) : null,
                                    onEdit: canEditReply ? () => _showEditReviewDialog(context, reply) : null,
                                    onTap: () {}, // Ответы не требуют навигации
                                  ),
                                );
                              }),
                            ],
                          );
                        }).toList(),
                      ],
                    ],
                  );
                },
                reviewCreated: (review) {
                  // После создания отзыва (включая ответ) обновляем список
                  // Важно: обновляем сразу, чтобы BlocBuilder перестроился с новыми данными
                  // Добавляем небольшую задержку, чтобы гарантировать, что состояние обновилось
                  Future.microtask(() {
                    if (context.mounted) {
                      context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
                    }
                  });
                  return SizedBox.shrink();
                },
                reviewUpdated: (review) {
                  // После обновления отзыва обновляем список
                  context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
                  return SizedBox.shrink();
                },
                reviewDeleted: () {
                  // После удаления отзыва обновляем список
                  context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCreateReviewDialog(BuildContext context, FlightEntity flight, bool isOwner) async {
    final profileState = context.read<ProfileBloc>().state;
    final currentUserId = profileState.maybeWhen(success: (profile) => profile.id, orElse: () => null);
    if (currentUserId == null) return;

    BookingEntity? userBooking;
    int? reviewedId;

    if (isOwner) {
      // Если пользователь - пилот, показываем диалог выбора пассажира
      final bookingsState = context.read<BookingsBloc>().state;
      final confirmedBookings = bookingsState.maybeWhen(
        success: (bookings) => bookings.where((b) => b.flightId == flight.id && b.status == 'confirmed').toList(),
        orElse: () => <BookingEntity>[],
      );

      if (confirmedBookings.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('На этом полёте нет подтверждённых бронирований'), backgroundColor: Colors.red),
        );
        return;
      }

      // Получаем список отзывов, чтобы исключить пассажиров, о которых уже есть отзывы
      final reviewsState = context.read<ReviewsBloc>().state;
      final existingReviews = reviewsState.maybeWhen(
        success: (reviews, flights) => reviews
            .where(
              (review) =>
                  review.reviewerId == currentUserId &&
                  review.replyToReviewId == null &&
                  review.reviewedId != flight.pilotId,
            )
            .toList(),
        orElse: () => <ReviewEntity>[],
      );

      // Получаем ID пассажиров, о которых уже есть отзывы
      final reviewedPassengerIds = existingReviews.map((review) => review.reviewedId).toSet();

      // Фильтруем список пассажиров, исключая тех, о которых уже есть отзывы
      final availableBookings = confirmedBookings
          .where((booking) => !reviewedPassengerIds.contains(booking.passengerId))
          .toList();

      if (availableBookings.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Вы уже оставили отзывы о всех пассажирах'), backgroundColor: Colors.orange),
        );
        return;
      }

      // Если только одно доступное бронирование, используем его сразу
      if (availableBookings.length == 1) {
        userBooking = availableBookings.first;
        reviewedId = userBooking.passengerId;
      } else {
        // Если несколько доступных бронирований, показываем диалог выбора
        final selectedBooking = await showDialog<BookingEntity>(
          context: context,
          builder: (dialogContext) => SelectPassengerDialog(
            bookings: availableBookings,
            onSelect: (booking) => Navigator.of(dialogContext).pop(booking),
          ),
        );

        if (selectedBooking == null) return;
        userBooking = selectedBooking;
        reviewedId = userBooking.passengerId;
      }
    } else {
      // Если пользователь - пассажир, используем GetBookingsEvent для получения всех его бронирований
      // Сначала загружаем бронирования, если они ещё не загружены
      final bookingsState = context.read<BookingsBloc>().state;
      final needsLoad = bookingsState.maybeWhen(
        success: (bookings) => false, // Уже загружены
        orElse: () => true, // Нужно загрузить
      );

      if (needsLoad) {
        // Загружаем бронирования пользователя
        context.read<BookingsBloc>().add(GetBookingsEvent());
        // Ждём загрузки (небольшая задержка для обработки события)
        await Future<void>.delayed(Duration(milliseconds: 500));
      }

      // Получаем обновлённое состояние
      final updatedBookingsState = context.read<BookingsBloc>().state;
      try {
        updatedBookingsState.maybeWhen(
          success: (bookings) {
            // Ищем подтверждённое бронирование пассажира на этот полёт
            try {
              userBooking = bookings.firstWhere(
                (b) => b.flightId == flight.id && b.passengerId == currentUserId && b.status == 'confirmed',
              );
              reviewedId = flight.pilotId;
            } catch (e) {
              userBooking = null;
              reviewedId = null;
            }
          },
          orElse: () {
            userBooking = null;
            reviewedId = null;
          },
        );
      } catch (e) {
        userBooking = null;
        reviewedId = null;
      }
    }

    // Проверяем наличие бронирования и reviewedId
    if (userBooking == null || reviewedId == null) {
      if (isOwner) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('На этом полёте нет подтверждённых бронирований'), backgroundColor: Colors.red),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('У вас нет подтверждённого бронирования на этот полёт'), backgroundColor: Colors.red),
        );
      }
      return;
    }

    final booking = userBooking!;
    final reviewed = reviewedId!;

    showDialog<bool>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<ReviewsBloc>(),
        child: CreateReviewDialog(booking: booking, reviewedId: reviewed),
      ),
    ).then((result) {
      if (result == true && context.mounted) {
        // Обновляем список отзывов
        context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
      }
    });
  }

  void _showReplyToReviewDialog(BuildContext context, FlightEntity flight, ReviewEntity review, bool isOwner) async {
    final profileState = context.read<ProfileBloc>().state;
    final currentUserId = profileState.maybeWhen(success: (profile) => profile.id, orElse: () => null);
    if (currentUserId == null) return;

    BookingEntity? userBooking;
    int? reviewedId;

    if (isOwner) {
      // Если пользователь - пилот, используем GetBookingsByFlightIdEvent (работает только для пилота)
      final bookingsState = context.read<BookingsBloc>().state;
      try {
        bookingsState.maybeWhen(
          success: (bookings) {
            try {
              userBooking = bookings.firstWhere((b) => b.flightId == flight.id && b.status == 'confirmed');
            } catch (e) {
              userBooking = null;
            }
          },
          orElse: () {
            userBooking = null;
          },
        );
      } catch (e) {
        userBooking = null;
      }
    } else {
      // Если пользователь - пассажир, используем GetBookingsEvent для получения всех его бронирований
      final bookingsState = context.read<BookingsBloc>().state;
      final needsLoad = bookingsState.maybeWhen(
        success: (bookings) => false, // Уже загружены
        orElse: () => true, // Нужно загрузить
      );

      if (needsLoad) {
        // Загружаем бронирования пользователя
        context.read<BookingsBloc>().add(GetBookingsEvent());
        // Ждём загрузки (небольшая задержка для обработки события)
        await Future<void>.delayed(Duration(milliseconds: 500));
      }

      // Получаем обновлённое состояние
      final updatedBookingsState = context.read<BookingsBloc>().state;
      try {
        updatedBookingsState.maybeWhen(
          success: (bookings) {
            try {
              userBooking = bookings.firstWhere(
                (b) => b.flightId == flight.id && b.passengerId == currentUserId && b.status == 'confirmed',
              );
            } catch (e) {
              userBooking = null;
            }
          },
          orElse: () {
            userBooking = null;
          },
        );
      } catch (e) {
        userBooking = null;
      }
    }

    // Отвечаем тому, кто оставил отзыв
    reviewedId = review.reviewerId;

    if (userBooking == null) {
      if (isOwner) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('На этом полёте нет подтверждённых бронирований'), backgroundColor: Colors.red),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('У вас нет подтверждённого бронирования на этот полёт'), backgroundColor: Colors.red),
        );
      }
      return;
    }

    showDialog<bool>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<ReviewsBloc>(),
        child: CreateReviewDialog(booking: userBooking!, reviewedId: reviewedId!, replyToReviewId: review.id),
      ),
    ).then((result) {
      if (result == true && context.mounted) {
        // Обновляем список отзывов
        context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
      }
    });
  }

  void _showEditReviewDialog(BuildContext context, ReviewEntity review) {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<ReviewsBloc>(),
        child: EditReviewDialog(review: review),
      ),
    ).then((result) {
      if (result == true && context.mounted) {
        // Обновляем список отзывов
        final flightDetailBloc = context.read<FlightDetailBloc>();
        flightDetailBloc.state.maybeWhen(
          success: (flight) {
            context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
          },
          orElse: () {},
        );
      }
    });
  }

  void _showDeleteReviewDialog(BuildContext context, int reviewId) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Удалить отзыв?', style: AppStyles.bold16s),
        content: Text('Вы уверены, что хотите удалить этот отзыв?', style: AppStyles.regular14s),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              context.read<ReviewsBloc>().add(DeleteReviewEvent(reviewId: reviewId));
              // Обновляем список отзывов после удаления
              // Ждем немного, чтобы удаление завершилось
              await Future<void>.delayed(Duration(milliseconds: 300));
              if (context.mounted) {
                final flightDetailBloc = context.read<FlightDetailBloc>();
                flightDetailBloc.state.maybeWhen(
                  success: (flight) {
                    context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
                  },
                  orElse: () {},
                );
              }
            },
            child: Text('Удалить', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Color(0xFF9CA5AF)),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(label, style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
        ),
        Text(value, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
      ],
    );
  }

  /// Проверяет, является ли пользователь участником полета (пилот или пассажир с подтвержденным бронированием)
  bool _isFlightParticipant(BuildContext context, FlightEntity flight, bool isOwner) {
    if (isOwner) return true; // Пилот всегда участник

    // Проверяем, есть ли у пользователя подтвержденное бронирование
    final bookingsState = context.read<BookingsBloc>().state;
    final profileState = context.read<ProfileBloc>().state;
    final currentUserId = profileState.maybeWhen(success: (profile) => profile.id, orElse: () => null);

    if (currentUserId == null) return false;

    return bookingsState.maybeWhen(
      success: (bookings) {
        return bookings.any(
          (b) => b.flightId == flight.id && b.passengerId == currentUserId && b.status == 'confirmed',
        );
      },
      orElse: () => false,
    );
  }

  /// Секция фотографий полета
  Widget _buildPhotosSection(BuildContext context, FlightEntity flight, bool isAuthenticated, bool isOwner) {
    final isParticipant = _isFlightParticipant(context, flight, isOwner);
    final hasPhotos = flight.photos != null && flight.photos!.isNotEmpty;

    // Показываем секцию только если есть фотографии или пользователь - участник полета
    if (!hasPhotos && !isParticipant) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Фото самолёта/вертолёта', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
              // Кнопка загрузки фотографий (только для участников полета)
              if (isParticipant)
                TextButton.icon(
                  onPressed: () => _showUploadPhotosDialog(context, flight),
                  icon: Icon(Icons.add_photo_alternate, size: 18, color: Color(0xFF0A6EFA)),
                  label: Text('Добавить', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          if (hasPhotos)
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1.0,
              ),
              itemCount: flight.photos!.length,
              itemBuilder: (context, index) {
                final photoUrl = flight.photos![index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Фотография
                    GestureDetector(
                      onTap: () => _showPhotoViewer(context, flight, flight.photos!, index, isOwner),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: CachedNetworkImage(
                          imageUrl: getImageUrl(photoUrl),
                          fit: BoxFit.cover,
                          cacheManager: GetIt.instance<DefaultCacheManager>(),
                          cacheKey: photoUrl,
                          placeholder: (context, url) => Container(
                            color: Color(0xFFF3F4F6),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Color(0xFFF3F4F6),
                            child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                          ),
                        ),
                      ),
                    ),
                    // Кнопка меню в правом верхнем углу
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: PopupMenuButton<String>(
                        icon: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                          child: Icon(Icons.more_vert, color: Colors.white, size: 18),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        onSelected: (value) {
                          switch (value) {
                            case 'share':
                              _sharePhoto(context, photoUrl);
                              break;
                            case 'download':
                              _downloadPhoto(context, photoUrl);
                              break;
                            case 'delete':
                              if (isOwner) {
                                _deletePhotoFromList(context, flight, photoUrl);
                              }
                              break;
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'share',
                            child: Row(
                              children: [
                                Icon(Icons.share, size: 20, color: Color(0xFF374151)),
                                SizedBox(width: 12.w),
                                Text('Поделиться', style: AppStyles.regular14s),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'download',
                            child: Row(
                              children: [
                                Icon(Icons.download, size: 20, color: Color(0xFF374151)),
                                SizedBox(width: 12.w),
                                Text('Скачать', style: AppStyles.regular14s),
                              ],
                            ),
                          ),
                          if (isOwner)
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete_outline, size: 20, color: Colors.red),
                                  SizedBox(width: 12.w),
                                  Text('Удалить', style: AppStyles.regular14s.copyWith(color: Colors.red)),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          else
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Color(0xFFE5E7EB)),
              ),
              child: Column(
                children: [
                  Icon(Icons.photo_library_outlined, size: 48, color: Color(0xFF9CA5AF)),
                  SizedBox(height: 12.h),
                  Text('Пока нет фотографий', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                ],
              ),
            ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  /// Диалог для загрузки фотографий
  void _showUploadPhotosDialog(BuildContext context, FlightEntity flight) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage(imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

    if (images == null || images.isEmpty) return;

    // Показываем индикатор загрузки
    BuildContext? dialogContext;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        dialogContext = ctx;
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text('Загрузка фотографий...', style: AppStyles.regular14s),
            ],
          ),
        );
      },
    );

    try {
      final repository = getIt<OnTheWayRepository>();
      final result = await repository.uploadFlightPhotos(flightId: flight.id, photos: images);

      // Закрываем диалог загрузки перед обработкой результата
      if (dialogContext != null && Navigator.of(dialogContext!).canPop()) {
        Navigator.of(dialogContext!).pop();
      } else if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

      result.fold(
        (Failure failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.responseMessage ?? 'Не удалось загрузить фотографии'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 4),
            ),
          );
        },
        (updatedFlight) {
          // Обновляем детали полета - загружаем обновленные данные с сервера
          context.read<FlightDetailBloc>().add(flight.id);

          // Показываем сообщение об успехе
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Фотографии успешно загружены'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        },
      );
    } catch (e) {
      // Закрываем диалог загрузки в случае ошибки
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при загрузке фотографий: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  /// Просмотр фотографии в полноэкранном режиме
  void _showPhotoViewer(
    BuildContext mainContext,
    FlightEntity flight,
    List<String> photos,
    int initialIndex,
    bool isOwner,
  ) {
    final PageController pageController = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;
    bool showControls = true;

    showDialog<void>(
      context: mainContext,
      barrierColor: Colors.black87,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogBuilderContext, setState) => GestureDetector(
          onTap: () {
            setState(() {
              showControls = !showControls;
            });
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                // Основной контент с фотографиями
                PageView.builder(
                  controller: pageController,
                  itemCount: photos.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 5.0,
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(photos[index]),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            cacheManager: GetIt.instance<DefaultCacheManager>(),
                            cacheKey: photos[index],
                            placeholder: (context, url) => Container(
                              color: Colors.black,
                              child: Center(child: CircularProgressIndicator(color: Colors.white)),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.black,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                    SizedBox(height: 16.h),
                                    Text(
                                      'Не удалось загрузить изображение',
                                      style: AppStyles.regular14s.copyWith(color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Верхняя панель с индикатором и кнопкой закрытия
                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Индикатор текущей фотографии
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                '${currentIndex + 1} / ${photos.length}',
                                style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                            ),
                            // Кнопки действий
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопка "Поделиться"
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.white, size: 24),
                                  onPressed: () => _sharePhoto(mainContext, photos[currentIndex]),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(mainContext, photos[currentIndex]),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Скачать',
                                ),
                                if (isOwner) ...[
                                  SizedBox(width: 8.w),
                                  // Кнопка "Удалить" (только для владельца)
                                  IconButton(
                                    icon: Icon(Icons.delete_outline, color: Colors.red, size: 24),
                                    onPressed: () => _deletePhoto(
                                      mainContext,
                                      dialogContext,
                                      flight,
                                      photos[currentIndex],
                                      currentIndex,
                                      photos,
                                      setState,
                                      pageController,
                                    ),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      shape: CircleBorder(),
                                    ),
                                    tooltip: 'Удалить',
                                  ),
                                ],
                                SizedBox(width: 8.w),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Нижняя панель с навигацией (только если больше 1 фото)
                if (showControls && photos.length > 1)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Кнопка "Назад"
                            if (currentIndex > 0)
                              IconButton(
                                icon: Icon(Icons.chevron_left, color: Colors.white, size: 32),
                                onPressed: () {
                                  pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  shape: CircleBorder(),
                                ),
                              )
                            else
                              SizedBox(width: 48.w),

                            // Индикатор точек
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  photos.length,
                                  (index) => Container(
                                    width: 6.w,
                                    height: 6.w,
                                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == currentIndex ? Colors.white : Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Кнопка "Вперед"
                            if (currentIndex < photos.length - 1)
                              IconButton(
                                icon: Icon(Icons.chevron_right, color: Colors.white, size: 32),
                                onPressed: () {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  shape: CircleBorder(),
                                ),
                              )
                            else
                              SizedBox(width: 48.w),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Поделиться фотографией
  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    try {
      final imageUrl = getImageUrl(photoUrl);
      await Share.shareUri(Uri.parse(imageUrl));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Не удалось поделиться фотографией: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Правый клик по изображению → "Сохранить как"'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Для мобильных платформ - скачиваем файл
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Необходимо разрешение на сохранение файлов'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(width: 16.w),
              Text('Скачивание...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );

      final imageUrl = getImageUrl(photoUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last;
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(imageUrl, filePath);

      // Для Android используем Downloads, для iOS - Photos
      final directory = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      if (directory != null) {
        final downloadPath = Platform.isAndroid
            ? '${directory.path}/Download/$fileName'
            : '${directory.path}/$fileName';

        final file = File(filePath);
        await file.copy(downloadPath);

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Фотография сохранена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Не удалось скачать фотографию: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  /// Удалить фотографию
  Future<void> _deletePhoto(
    BuildContext mainContext, // Контекст основного экрана
    BuildContext dialogContext, // Контекст диалога просмотра
    FlightEntity flight,
    String photoUrl,
    int currentIndex,
    List<String> photos,
    StateSetter setState,
    PageController pageController,
  ) async {
    // Показываем диалог подтверждения
    final confirmed = await showDialog<bool>(
      context: mainContext,
      builder: (dialogBuilderContext) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию? Это действие нельзя отменить.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogBuilderContext).pop(false), child: Text('Отмена')),
          TextButton(
            onPressed: () => Navigator.of(dialogBuilderContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final repository = getIt<OnTheWayRepository>();
      final result = await repository.deleteFlightPhoto(flightId: flight.id, photoUrl: photoUrl);

      result.fold(
        (failure) {
          // Закрываем просмотр фотографий даже при ошибке
          if (Navigator.of(dialogContext).canPop()) {
            Navigator.of(dialogContext).pop();
          }

          // Используем контекст из основного экрана
          if (mainContext.mounted) {
            ScaffoldMessenger.of(mainContext).showSnackBar(
              SnackBar(
                content: Text(
                  'Не удалось удалить фотографию: ${failure.responseMessage ?? failure.message ?? "Неизвестная ошибка"}',
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        (updatedFlight) {
          // Закрываем просмотр фотографий
          if (Navigator.of(dialogContext).canPop()) {
            Navigator.of(dialogContext).pop();
          }

          // Используем контекст из основного экрана для обновления блока
          if (mainContext.mounted) {
            // Обновляем детали полета - это обновит только секцию с фотографиями через BlocBuilder
            mainContext.read<FlightDetailBloc>().add(flight.id);

            ScaffoldMessenger.of(mainContext).showSnackBar(
              SnackBar(
                content: Text('Фотография удалена'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
      );
    } catch (e) {
      // Закрываем просмотр фотографий даже при исключении
      if (Navigator.of(dialogContext).canPop()) {
        Navigator.of(dialogContext).pop();
      }

      if (mainContext.mounted) {
        ScaffoldMessenger.of(mainContext).showSnackBar(
          SnackBar(
            content: Text('Ошибка при удалении фотографии: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Удаление фотографии из списка (без открытия просмотра)
  Future<void> _deletePhotoFromList(BuildContext context, FlightEntity flight, String photoUrl) async {
    // Показываем диалог подтверждения
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию? Это действие нельзя отменить.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('Отмена')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final repository = getIt<OnTheWayRepository>();
      final result = await repository.deleteFlightPhoto(flightId: flight.id, photoUrl: photoUrl);

      result.fold(
        (failure) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Не удалось удалить фотографию: ${failure.responseMessage ?? failure.message}'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        (updatedFlight) {
          // Обновляем детали полета - это обновит только секцию с фотографиями через BlocBuilder
          if (context.mounted) {
            context.read<FlightDetailBloc>().add(flight.id);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Фотография удалена'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при удалении фотографии: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Вспомогательный метод для отображения детальной информации об аэропорте на странице деталей
  Widget _buildAirportInfoDetail({
    required BuildContext context,
    required IconData icon,
    required String code,
    String? identRu,
    String? name,
    String? city,
    String? region,
    String? type,
    bool isInternational = false,
  }) {
    // Используем переданную иконку и определяем цвет в зависимости от неё (как на карте)
    IconData iconData = icon;
    Color iconColor;

    if (icon == Icons.flight_takeoff) {
      // Зелёный для отправления
      iconColor = Colors.green;
    } else if (icon == Icons.flight_land) {
      // Красный для прибытия
      iconColor = Colors.red;
    } else if (icon == Icons.flight) {
      // Синий для промежуточных точек
      iconColor = Colors.blue;
    } else {
      // По умолчанию синий
      iconColor = Color(0xFF0A6EFA);
    }

    // Получаем отображаемый тип
    String typeDisplay = '';
    if (type != null) {
      final typeLower = type.toLowerCase();
      switch (typeLower) {
        case 'heliport':
        case 'вертодром':
          typeDisplay = 'Вертодром';
          break;
        case 'airport':
        case 'аэродром':
          typeDisplay = 'Аэродром';
          break;
        case 'small_airport':
          typeDisplay = 'Малый аэродром';
          break;
        case 'medium_airport':
          typeDisplay = 'Средний аэродром';
          break;
        case 'large_airport':
          typeDisplay = 'Крупный аэродром';
          break;
        default:
          typeDisplay = type;
      }
    }

    return GestureDetector(
      onTap: () {
        showAirportInfoBottomSheet(context, code);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10.r)),
            child: Icon(iconData, color: iconColor, size: 20.r),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Код и русский код
                Row(
                  children: [
                    Text(code, style: AppStyles.bold20s.copyWith(color: Color(0xFF0A6EFA))),
                    if (identRu != null && identRu != code) ...[
                      SizedBox(width: 6.w),
                      Text('($identRu)', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                    ],
                    if (isInternational) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: Color(0xFF0A6EFA).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'INT',
                          style: AppStyles.medium10s.copyWith(color: Color(0xFF0A6EFA), fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ],
                ),
                // Название аэропорта
                if (name != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    name,
                    style: AppStyles.regular15s.copyWith(color: Color(0xFF374151)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                // Город, регион, тип
                if (city != null || region != null || typeDisplay.isNotEmpty) ...[
                  SizedBox(height: 4.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 4.h,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (city != null) ...[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_city, size: 12.r, color: Color(0xFF9CA5AF)),
                            SizedBox(width: 4.w),
                            Text(city, style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                          ],
                        ),
                      ],
                      if (region != null) ...[
                        if (city != null) ...[
                          Text('•', style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                        ],
                        Text(region, style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                      if (typeDisplay.isNotEmpty) ...[
                        if (city != null || region != null) ...[
                          Text('•', style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                        ],
                        Text(typeDisplay, style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Показывает диалог для создания/редактирования вопроса
  Future<void> _showQuestionDialog(
    BuildContext context,
    int flightId,
    bool isAuthenticated,
    QuestionsBloc? questionsBloc, {
    VoidCallback? onQuestionCreated,
  }) async {
    if (!isAuthenticated) {
      // Если не авторизован, перекидываем на авторизацию
      await _showAuthScreen(context);
      // После авторизации проверяем снова
      final appState = Provider.of<AppState>(context, listen: false);
      if (!appState.isAuthenticated) {
        return; // Пользователь не авторизовался
      }
    }

    // Показываем диалог создания вопроса, передавая существующий bloc из секции
    await showQuestionDialog(
      context: context,
      flightId: flightId,
      questionsBloc: questionsBloc,
      onQuestionCreated: onQuestionCreated, // Callback для обновления списка в секции
    );
  }

  /// Секция вопросов пилоту
  Widget _buildQuestionsSection(BuildContext context, FlightEntity flight, bool isAuthenticated, bool isOwner) {
    return BlocProvider(
      create: (context) {
        final bloc = QuestionsBloc(onTheWayRepository: getIt<OnTheWayRepository>());
        bloc.add(GetQuestionsByFlightIdEvent(flightId: flight.id));
        return bloc;
      },
      child: BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (context, questionsState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Вопросы пилоту', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                    // Кнопка "Задать вопрос" внутри секции, чтобы иметь доступ к QuestionsBloc
                    // Скрываем кнопку, если полёт завершен
                    if (isAuthenticated && !isOwner && flight.status != 'completed')
                      ElevatedButton.icon(
                        onPressed: () {
                          final questionsBloc = context.read<QuestionsBloc>();
                          _showQuestionDialog(
                            context,
                            flight.id,
                            isAuthenticated,
                            questionsBloc,
                            // Callback для обновления списка после создания вопроса
                            onQuestionCreated: () {
                              questionsBloc.add(GetQuestionsByFlightIdEvent(flightId: flight.id));
                            },
                          );
                        },
                        icon: Icon(Icons.help_outline, size: 16),
                        label: Text('Задать вопрос', style: AppStyles.bold14s),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF10B981),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 12.h),
                Builder(
                  builder: (context) {
                    // Игнорируем InitialQuestionsState - это начальное состояние
                    if (questionsState is LoadingQuestionsState) {
                      return Center(
                        child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                      );
                    }

                    if (questionsState is ErrorQuestionsState) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Text(
                            questionsState.errorForUser,
                            style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444)),
                          ),
                        ),
                      );
                    }

                    if (questionsState is SuccessQuestionsState) {
                      final questions = questionsState.questions;

                      if (questions.isEmpty) {
                        return Container(
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Color(0xFFE5E7EB)),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(Icons.help_outline, size: 48, color: Color(0xFF9CA5AF)),
                                SizedBox(height: 12.h),
                                Text(
                                  'Пока нет вопросов',
                                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: questions.map((question) {
                          // Проверяем права на редактирование/удаление
                          final profileState = context.read<ProfileBloc>().state;
                          final currentUserId = profileState.maybeWhen(
                            success: (profile) => profile.id,
                            orElse: () => null,
                          );

                          final canEdit =
                              isAuthenticated &&
                              ((currentUserId != null && question.authorId == currentUserId) || // Автор вопроса
                                  (isOwner &&
                                      question.answerText != null &&
                                      question.answeredById == currentUserId) // Пилот для ответа
                                  );
                          final canDelete =
                              isAuthenticated &&
                              ((currentUserId != null && question.authorId == currentUserId) || // Автор вопроса
                                  isOwner // Пилот может удалить любой вопрос
                                  );
                          final canAnswer =
                              isOwner && question.answerText == null; // Пилот может ответить, если ответа нет

                          return QuestionCard(
                            question: question,
                            canDelete: canDelete,
                            canEdit: canEdit,
                            canAnswer: canAnswer,
                            onDelete: canDelete
                                ? () => _showDeleteQuestionDialog(context, flight.id, question.id)
                                : null,
                            onEdit: canEdit
                                ? () {
                                    final questionsBloc = context.read<QuestionsBloc>();
                                    _showEditQuestionDialog(
                                      context,
                                      flight.id,
                                      question,
                                      isOwner,
                                      questionsBloc,
                                      onQuestionUpdated: () {
                                        questionsBloc.add(GetQuestionsByFlightIdEvent(flightId: flight.id));
                                      },
                                    );
                                  }
                                : null,
                            onAnswer: canAnswer
                                ? () {
                                    final questionsBloc = context.read<QuestionsBloc>();
                                    _showAnswerQuestionDialog(
                                      context,
                                      flight.id,
                                      question,
                                      questionsBloc,
                                      onQuestionUpdated: () {
                                        questionsBloc.add(GetQuestionsByFlightIdEvent(flightId: flight.id));
                                      },
                                    );
                                  }
                                : null,
                            pilotRating: flight.pilotAverageRating,
                          );
                        }).toList(),
                      );
                    }

                    // Для других состояний (questionCreated, questionUpdated, questionDeleted)
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Показывает диалог удаления вопроса
  void _showDeleteQuestionDialog(BuildContext context, int flightId, int questionId) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Удалить вопрос?', style: AppStyles.bold16s),
        content: Text('Вы уверены, что хотите удалить этот вопрос?', style: AppStyles.regular14s),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF9CA5AF))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<QuestionsBloc>().add(DeleteQuestionEvent(flightId: flightId, questionId: questionId));
            },
            child: Text('Удалить', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }

  /// Показывает диалог редактирования вопроса
  Future<void> _showEditQuestionDialog(
    BuildContext context,
    int flightId,
    FlightQuestionEntity question,
    bool isOwner,
    QuestionsBloc questionsBloc, {
    VoidCallback? onQuestionUpdated,
  }) async {
    await showQuestionDialog(
      context: context,
      flightId: flightId,
      question: question,
      isAnswer: isOwner && question.answerText != null, // Если пилот редактирует ответ
      questionsBloc: questionsBloc,
      onQuestionCreated: onQuestionUpdated, // Используем тот же callback для обновления
    );
  }

  /// Показывает диалог ответа на вопрос
  Future<void> _showAnswerQuestionDialog(
    BuildContext context,
    int flightId,
    FlightQuestionEntity question,
    QuestionsBloc questionsBloc, {
    VoidCallback? onQuestionUpdated,
  }) async {
    await showQuestionDialog(
      context: context,
      flightId: flightId,
      question: question,
      isAnswer: true,
      questionsBloc: questionsBloc,
      onQuestionCreated: onQuestionUpdated, // Используем тот же callback для обновления
    );
  }
}

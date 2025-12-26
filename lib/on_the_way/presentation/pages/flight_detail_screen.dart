import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flight_detail_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/bookings_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/booking_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/pilot_booking_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/pilot_info_widget.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/review_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/create_review_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/edit_review_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/select_passenger_dialog.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';
import 'package:collection/collection.dart';

@RoutePage()
class FlightDetailScreen extends StatelessWidget {
  final int flightId;

  const FlightDetailScreen({super.key, @PathParam('id') required this.flightId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightDetailBloc(onTheWayRepository: getIt())..add(flightId),
      child: BlocProvider.value(
        value: context.read<BookingsBloc>()..add(GetBookingsByFlightIdEvent(flightId: flightId)),
        child: BlocProvider(
          create: (context) =>
              ReviewsBloc(onTheWayRepository: getIt())..add(GetReviewsByFlightIdEvent(flightId: flightId)),
          child: MultiBlocListener(
            listeners: [
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
                    orElse: () {}, // Игнорируем другие состояния
                  );
                },
              ),
              BlocListener<FlightsBloc, FlightsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (flights, departureAirport, arrivalAirport, dateFrom, dateTo) {
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
            child: Scaffold(
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
            ),
          ),
        ),
      ),
    );
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
      padding: EdgeInsets.all(16.w),
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
                context.read<FlightDetailBloc>().add(flightId);
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
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    final priceFormat = NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0);
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    // Проверяем, является ли текущий пользователь владельцем полета
    final profileState = context.read<ProfileBloc>().state;
    final isOwner = profileState.maybeWhen(success: (profile) => profile.id == flight.pilotId, orElse: () => false);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Информация о полете
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Color(0xFFD9E6F8)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ID полета
                Row(
                  children: [
                    Icon(Icons.tag, size: 16, color: Color(0xFF9CA5AF)),
                    SizedBox(width: 6.w),
                    Text('ID полета: ${flight.id}', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                  ],
                ),
                SizedBox(height: 12.h),
                // Маршрут с детальной информацией
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Аэропорт отправления
                    _buildAirportInfoDetail(
                      context: context,
                      icon: Icons.flight_takeoff,
                      code: flight.departureAirport,
                      identRu: flight.departureAirportIdentRu,
                      name: flight.departureAirportName,
                      city: flight.departureAirportCity,
                      region: flight.departureAirportRegion,
                      type: flight.departureAirportType,
                      isInternational: false,
                    ),
                    SizedBox(height: 16.h),
                    // Стрелка
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Icon(Icons.arrow_downward, size: 24, color: Color(0xFF0A6EFA)),
                    ),
                    SizedBox(height: 16.h),
                    // Аэропорт прибытия
                    _buildAirportInfoDetail(
                      context: context,
                      icon: Icons.flight_land,
                      code: flight.arrivalAirport,
                      identRu: flight.arrivalAirportIdentRu,
                      name: flight.arrivalAirportName,
                      city: flight.arrivalAirportCity,
                      region: flight.arrivalAirportRegion,
                      type: flight.arrivalAirportType,
                      isInternational: false,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                      child: Text(
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Дата и время
                _buildInfoRow(Icons.calendar_today, 'Дата и время вылета', dateFormat.format(flight.departureDate)),
                SizedBox(height: 12.h),
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
                  Text('Описание', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                  SizedBox(height: 8.h),
                  Text(flight.description!, style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
                ],
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // Информация о пилоте
          if (flight.pilotFullName != null || flight.pilotAverageRating != null) ...[
            PilotInfoWidget(
              pilotName: flight.pilotFullName,
              rating: flight.pilotAverageRating ?? 0.0,
              reviewsCount: 0, // TODO: Добавить поле reviewsCount в FlightEntity при необходимости
              avatarUrl: flight.pilotAvatarUrl,
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
                        Text('Бронирования', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
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
                            label: Text('Редактировать', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
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
                            label: Text('Отменить полёт', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
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
              // Кнопка для пассажира (только для активных полетов)
              if (flight.status == 'active')
                ElevatedButton.icon(
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
                                  // Возвращаемся на экран списка полетов и переключаемся на вкладку "Мои бронирования"
                                  Navigator.of(context).pop();
                                  // Используем AutoRouter для возврата на FlightsListRoute с параметром
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    if (context.mounted) {
                                      // Возвращаемся на OnTheWayNavigationRoute и переключаемся на вкладку
                                      // Используем navigate для перехода на FlightsListRoute с параметром
                                      context.router.navigate(FlightsListRoute(initialTabIndex: 2));
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
            ],
          ] else ...[
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Color(0xFFFFF4E6),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Color(0xFFFFA726)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Color(0xFFFFA726)),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      'Для бронирования места необходимо войти в систему',
                      style: AppStyles.regular14s.copyWith(color: Color(0xFFE65100)),
                    ),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(height: 24.h),
          // Секция отзывов (только для завершенных полетов)
          if (flight.status == 'completed') _buildReviewsSection(context, flight, isAuthenticated, isOwner),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context, FlightEntity flight, bool isAuthenticated, bool isOwner) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, reviewsState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Отзывы', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                if (isAuthenticated)
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
              success: (reviews) {
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

                final profileState = context.read<ProfileBloc>().state;
                final currentUserId = profileState.maybeWhen(success: (profile) => profile.id, orElse: () => null);

                // Получаем данные о бронированиях для поиска информации о пассажирах
                final bookingsState = context.read<BookingsBloc>().state;
                final bookings = bookingsState.maybeWhen(
                  success: (bookings) => bookings.where((b) => b.flightId == flight.id).toList(),
                  orElse: () => <BookingEntity>[],
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Секция: Отзывы о пилоте
                    if (pilotReviews.isNotEmpty) ...[
                      Text('Отзывы о пилоте', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                      SizedBox(height: 12.h),
                      ...pilotReviews.map((review) {
                        final reviewReplies = replies.where((r) => r.replyToReviewId == review.id).toList();
                        final canDelete = currentUserId != null && review.reviewerId == currentUserId;
                        final canEdit = currentUserId != null && review.reviewerId == currentUserId;
                        final canReply = currentUserId != null && review.reviewerId != currentUserId;

                        return Column(
                          children: [
                            ReviewCard(
                              review: review,
                              canDelete: canDelete,
                              canEdit: canEdit,
                              onDelete: canDelete ? () => _showDeleteReviewDialog(context, review.id) : null,
                              onEdit: canEdit ? () => _showEditReviewDialog(context, review) : null,
                              onReply: canReply
                                  ? () => _showReplyToReviewDialog(context, flight, review, isOwner)
                                  : null,
                              reviewedName: flight.pilotFullName,
                              reviewedAvatarUrl: flight.pilotAvatarUrl,
                              reviewedRating: flight.pilotAverageRating,
                            ),
                            if (reviewReplies.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(left: 40.w),
                                child: Column(
                                  children: reviewReplies.map((reply) {
                                    final canDeleteReply = currentUserId != null && reply.reviewerId == currentUserId;
                                    final canEditReply = currentUserId != null && reply.reviewerId == currentUserId;
                                    return ReviewCard(
                                      review: reply,
                                      isReply: true,
                                      canDelete: canDeleteReply,
                                      canEdit: canEditReply,
                                      onDelete: canDeleteReply
                                          ? () => _showDeleteReviewDialog(context, reply.id)
                                          : null,
                                      onEdit: canEditReply ? () => _showEditReviewDialog(context, reply) : null,
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                      SizedBox(height: 24.h),
                    ],
                    // Секция: Отзывы о пассажирах
                    if (passengerReviews.isNotEmpty) ...[
                      Text('Отзывы о пассажирах', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                      SizedBox(height: 12.h),
                      ...passengerReviews.map((review) {
                        final reviewReplies = replies.where((r) => r.replyToReviewId == review.id).toList();
                        final canDelete = currentUserId != null && review.reviewerId == currentUserId;
                        final canEdit = currentUserId != null && review.reviewerId == currentUserId;
                        final canReply = currentUserId != null && review.reviewerId != currentUserId;

                        // Находим бронирование для этого отзыва, чтобы получить информацию о пассажире
                        BookingEntity? booking;
                        try {
                          booking = bookings.firstWhere((b) => b.id == review.bookingId);
                        } catch (e) {
                          try {
                            booking = bookings.firstWhere((b) => b.passengerId == review.reviewedId);
                          } catch (e2) {
                            booking = bookings.isNotEmpty ? bookings.first : null;
                          }
                        }

                        return Column(
                          children: [
                            ReviewCard(
                              review: review,
                              canDelete: canDelete,
                              canEdit: canEdit,
                              onDelete: canDelete ? () => _showDeleteReviewDialog(context, review.id) : null,
                              onEdit: canEdit ? () => _showEditReviewDialog(context, review) : null,
                              onReply: canReply
                                  ? () => _showReplyToReviewDialog(context, flight, review, isOwner)
                                  : null,
                              reviewedName: booking?.passengerFullName,
                              reviewedAvatarUrl: booking?.passengerAvatarUrl,
                              reviewedRating: booking?.passengerAverageRating,
                            ),
                            if (reviewReplies.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(left: 40.w),
                                child: Column(
                                  children: reviewReplies.map((reply) {
                                    final canDeleteReply = currentUserId != null && reply.reviewerId == currentUserId;
                                    final canEditReply = currentUserId != null && reply.reviewerId == currentUserId;
                                    return ReviewCard(
                                      review: reply,
                                      isReply: true,
                                      canDelete: canDeleteReply,
                                      canEdit: canEditReply,
                                      onDelete: canDeleteReply
                                          ? () => _showDeleteReviewDialog(context, reply.id)
                                          : null,
                                      onEdit: canEditReply ? () => _showEditReviewDialog(context, reply) : null,
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                    ],
                  ],
                );
              },
              reviewCreated: (review) => SizedBox.shrink(),
              reviewUpdated: (review) => SizedBox.shrink(),
              reviewDeleted: () => SizedBox.shrink(),
            ),
          ],
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

      // Если только одно бронирование, используем его сразу
      if (confirmedBookings.length == 1) {
        userBooking = confirmedBookings.first;
        reviewedId = userBooking.passengerId;
      } else {
        // Если несколько бронирований, показываем диалог выбора
        final selectedBooking = await showDialog<BookingEntity>(
          context: context,
          builder: (dialogContext) => SelectPassengerDialog(
            bookings: confirmedBookings,
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
            onPressed: () {
              context.read<ReviewsBloc>().add(DeleteReviewEvent(reviewId: reviewId));
              Navigator.of(dialogContext).pop();
              // Обновляем список отзывов после удаления
              final flightDetailBloc = context.read<FlightDetailBloc>();
              flightDetailBloc.state.maybeWhen(
                success: (flight) {
                  context.read<ReviewsBloc>().add(GetReviewsByFlightIdEvent(flightId: flight.id));
                },
                orElse: () {},
              );
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
          (b) => b.flightId == flight.id && 
                 b.passengerId == currentUserId && 
                 b.status == 'confirmed',
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Фотографии', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
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
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.more_vert, color: Colors.white, size: 18),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
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
                Text(
                  'Пока нет фотографий',
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                ),
              ],
            ),
          ),
        SizedBox(height: 24.h),
      ],
    );
  }

  /// Диалог для загрузки фотографий
  void _showUploadPhotosDialog(BuildContext context, FlightEntity flight) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage(
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1920,
    );

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
      final result = await repository.uploadFlightPhotos(
        flightId: flight.id,
        photos: images,
      );

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
  void _showPhotoViewer(BuildContext mainContext, FlightEntity flight, List<String> photos, int initialIndex, bool isOwner) {
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
                              child: Center(
                                child: CircularProgressIndicator(color: Colors.white),
                              ),
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
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
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
                                style: AppStyles.regular14s.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
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
                                    onPressed: () => _deletePhoto(mainContext, dialogContext, flight, photos[currentIndex], currentIndex, photos, setState, pageController),
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
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
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
                                      color: index == currentIndex
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
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
          TextButton(
            onPressed: () => Navigator.of(dialogBuilderContext).pop(false),
            child: Text('Отмена'),
          ),
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
      final result = await repository.deleteFlightPhoto(
        flightId: flight.id,
        photoUrl: photoUrl,
      );

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
                content: Text('Не удалось удалить фотографию: ${failure.responseMessage ?? failure.message ?? "Неизвестная ошибка"}'),
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
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Отмена'),
          ),
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
      final result = await repository.deleteFlightPhoto(
        flightId: flight.id,
        photoUrl: photoUrl,
      );

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
    // Определяем иконку и цвет в зависимости от типа
    IconData iconData = Icons.local_airport; // Иконка аэропорта (самолётик) по умолчанию
    Color iconColor = Color(0xFF0A6EFA);
    
    // Получаем отображаемый тип и определяем иконку
    String typeDisplay = '';
    if (type != null) {
      final typeLower = type.toLowerCase();
      switch (typeLower) {
        case 'heliport':
        case 'вертодром':
          iconData = Icons.airplanemode_active; // Иконка вертолёта (альтернативная иконка самолёта для визуального отличия)
          iconColor = Color(0xFF10B981);
          typeDisplay = 'Вертодром';
          break;
        case 'airport':
        case 'аэродром':
          iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
          iconColor = Color(0xFF0A6EFA);
          typeDisplay = 'Аэродром';
          break;
        case 'small_airport':
          iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
          iconColor = Color(0xFF0A6EFA);
          typeDisplay = 'Малый аэродром';
          break;
        case 'medium_airport':
          iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
          iconColor = Color(0xFF0A6EFA);
          typeDisplay = 'Средний аэродром';
          break;
        case 'large_airport':
          iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
          iconColor = Color(0xFF0A6EFA);
          typeDisplay = 'Крупный аэродром';
          break;
        default:
          // Проверяем, содержит ли тип слово "heliport" или "вертодром"
          if (typeLower.contains('heliport') || typeLower.contains('вертодром')) {
            iconData = Icons.airplanemode_active; // Иконка вертолёта (альтернативная иконка самолёта для визуального отличия)
            iconColor = Color(0xFF10B981);
          }
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
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
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
                    Text(
                      code,
                      style: AppStyles.bold20s.copyWith(color: Color(0xFF0A6EFA)),
                    ),
                    if (identRu != null && identRu != code) ...[
                      SizedBox(width: 6.w),
                      Text(
                        '($identRu)',
                        style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      ),
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
                          style: AppStyles.medium10s.copyWith(
                            color: Color(0xFF0A6EFA),
                            fontWeight: FontWeight.w600,
                          ),
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
                  Row(
                    children: [
                      if (city != null) ...[
                        Icon(Icons.location_city, size: 12.r, color: Color(0xFF9CA5AF)),
                        SizedBox(width: 4.w),
                        Text(
                          city,
                          style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF)),
                        ),
                      ],
                      if (region != null) ...[
                        if (city != null) ...[
                          SizedBox(width: 8.w),
                          Text('•', style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                          SizedBox(width: 8.w),
                        ],
                        Text(
                          region,
                          style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF)),
                        ),
                      ],
                      if (typeDisplay.isNotEmpty) ...[
                        if (city != null || region != null) ...[
                          SizedBox(width: 8.w),
                          Text('•', style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                          SizedBox(width: 8.w),
                        ],
                        Text(
                          typeDisplay,
                          style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF)),
                        ),
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
}

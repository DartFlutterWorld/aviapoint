import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/bookings_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBookingsWidget extends StatefulWidget {
  final int userId;

  const MyBookingsWidget({super.key, required this.userId});

  @override
  State<MyBookingsWidget> createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget> {
  @override
  void initState() {
    super.initState();
    // Загружаем бронирования пользователя
    context.read<BookingsBloc>().add(GetBookingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Мои бронирования', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 12),
            state.when(
              loading: () => Center(
                child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
              ),
              error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                ),
              ),
              success: (bookings) => _buildBookingsList(context, bookings),
              bookingCreated: (booking) {
                // Перезагружаем список после создания
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    context.read<BookingsBloc>().add(GetBookingsEvent());
                  }
                });
                return Center(
                  child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                );
              },
              bookingConfirmed: (booking) {
                // Перезагружаем список после подтверждения
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    context.read<BookingsBloc>().add(GetBookingsEvent());
                  }
                });
                return Center(
                  child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                );
              },
              bookingCancelled: (booking) {
                // Перезагружаем список после отмены
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    context.read<BookingsBloc>().add(GetBookingsEvent());
                  }
                });
                return Center(
                  child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBookingsList(BuildContext context, List<BookingEntity> bookings) {
    if (bookings.isEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.event_seat_outlined, size: 48, color: Color(0xFF9CA5AF)),
              SizedBox(height: 12),
              Text('У вас пока нет бронирований', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
            ],
          ),
        ),
      );
    }

    // Сортируем бронирования по дате полёта (ближайшие первыми)
    final sortedBookings = [...bookings]
      ..sort((a, b) {
        final aDate = a.flightDepartureDate ?? DateTime.fromMillisecondsSinceEpoch(0);
        final bDate = b.flightDepartureDate ?? DateTime.fromMillisecondsSinceEpoch(0);
        return aDate.compareTo(bDate);
      });

    return SizedBox(
      height: 490, // Фиксированная высота для горизонтального списка
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: sortedBookings.length,
        itemBuilder: (context, index) {
          final booking = sortedBookings[index];
          return Container(
            width: MediaQuery.of(context).size.width * 1, // Ширина карточки
            margin: EdgeInsets.only(right: 8),
            child: BookingCard(
              booking: booking,
              onTap: () {
                context.router.push(
                  BaseRoute(
                    children: [
                      OnTheWayNavigationRoute(children: [FlightDetailRoute(flightId: booking.flightId)]),
                    ],
                  ),
                );
              },
              onCancel: () => _showCancelDialog(context, booking.id),
            ),
          );
        },
      ),
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
            child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: Color(0xFF6B7280))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<BookingsBloc>().add(CancelBookingEvent(bookingId: bookingId));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text('Отменить', style: AppStyles.bold16s.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

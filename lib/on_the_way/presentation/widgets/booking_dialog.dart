import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/bookings_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flight_detail_bloc.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingDialog extends StatefulWidget {
  final FlightEntity flight;

  const BookingDialog({super.key, required this.flight});

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  int _seatsCount = 1;
  bool _shouldCheckProfileAfterBooking = false;

  @override
  void initState() {
    super.initState();
    // Устанавливаем минимальное значение (1) или доступное количество мест
    _seatsCount = widget.flight.availableSeats > 0 ? 1 : 0;
  }

  void _submitBooking(FlightEntity flight) {
    if (_seatsCount <= 0 || _seatsCount > flight.availableSeats) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Выберите корректное количество мест'), backgroundColor: Colors.red));
      return;
    }

    context.read<BookingsBloc>().add(CreateBookingEvent(flightId: flight.id, seatsCount: _seatsCount));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightDetailBloc, FlightDetailState>(
      builder: (context, flightState) {
        // Получаем актуальные данные о полете из FlightDetailBloc
        final flight = flightState.maybeWhen(
          success: (flight) => flight,
          orElse: () => widget.flight, // Fallback на переданный flight
        );

        final priceFormat = NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0);
        final totalPrice = _seatsCount * flight.pricePerSeat;

        // Генерируем список доступных мест (от 1 до availableSeats)
        final availableSeatsList = List.generate(flight.availableSeats, (index) => index + 1);

        // Обновляем _seatsCount, если он больше доступных мест
        if (_seatsCount > flight.availableSeats && flight.availableSeats > 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _seatsCount = flight.availableSeats;
              });
            }
          });
        }

        return MultiBlocListener(
          listeners: [
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, profileState) {
                // Проверяем ФИО только если был запрос на проверку после бронирования
                if (_shouldCheckProfileAfterBooking) {
                  _shouldCheckProfileAfterBooking = false; // Сбрасываем флаг
                  // Используем универсальную функцию для проверки ФИО
                  checkDataProfileAndOpenEditIfNeeded(
                    context: context,
                    message: 'Пожалуйста, заполните имя и фамилию для завершения бронирования',
                  );
                }
              },
            ),
            BlocListener<BookingsBloc, BookingsState>(
              listener: (context, state) {
                state.when(
                  loading: () {
                    // Не показываем ничего при loading
                  },
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(responseMessage ?? errorForUser),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 4),
                      ),
                    );
                    // Если ошибка связана с недостатком мест, обновляем информацию о полете
                    if (responseMessage != null &&
                        (responseMessage.contains('недостаточно') || responseMessage.contains('Not enough'))) {
                      // Обновляем информацию о полете через FlightDetailBloc
                      try {
                        final flightDetailBloc = context.read<FlightDetailBloc>();
                        flightDetailBloc.add(flight.id);
                        print('✅ [BookingDialog] Обновление информации о полете запрошено для flightId=${flight.id}');
                      } catch (e) {
                        print('❌ [BookingDialog] Не удалось обновить информацию о полете: $e');
                      }
                    }
                  },
                  success: (bookings) {
                    // Не обрабатываем success в диалоге
                  },
                  bookingCreated: (booking) async {
                    // Обновляем информацию о полете перед закрытием диалога
                    try {
                      final flightDetailBloc = context.read<FlightDetailBloc>();
                      flightDetailBloc.add(flight.id);
                      print(
                        '✅ [BookingDialog] Обновление информации о полете после успешного бронирования для flightId=${flight.id}',
                      );
                    } catch (e) {
                      print('❌ [BookingDialog] Не удалось обновить информацию о полете: $e');
                    }

                    // Закрываем диалог с результатом, указывающим на необходимость переключения вкладки
                    Navigator.of(context).pop({'success': true, 'switchToMyBookings': true});

                    // Проверяем, заполнены ли ФИО у пользователя (универсальная функция)
                    final profileCheckResult = checkDataProfileAndOpenEditIfNeeded(
                      context: context,
                      message: 'Пожалуйста, заполните имя и фамилию для завершения бронирования',
                    );

                    // Если ФИО заполнены, показываем сообщение об успехе
                    if (profileCheckResult == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Бронирование успешно создано'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (profileCheckResult == null) {
                      // Если профиль еще не загружен (null), устанавливаем флаг для проверки после загрузки
                      _shouldCheckProfileAfterBooking = true;
                      // Показываем сообщение об успехе
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Бронирование успешно создано'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  bookingConfirmed: (booking) {
                    // Не обрабатываем в диалоге
                  },
                  bookingCancelled: (booking) {
                    // Не обрабатываем в диалоге
                  },
                );
              },
            ),
          ],
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            child: BlocBuilder<BookingsBloc, BookingsState>(
              builder: (context, state) {
                // Проверяем только состояние loading, игнорируем bookingCreated
                final isLoading = state is LoadingBookingsState;

                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20.w),
                    constraints: BoxConstraints(maxWidth: 400.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Заголовок
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Забронировать место', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                            IconButton(
                              icon: Icon(Icons.close, color: Color(0xFF9CA5AF)),
                              onPressed: () => Navigator.of(context).pop(), // Всегда можно закрыть
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        // Информация о полете
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Color(0xFFD9E6F8)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    flight.departureAirport,
                                    style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA)),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(Icons.arrow_forward, size: 16, color: Color(0xFF0A6EFA)),
                                  SizedBox(width: 8.w),
                                  Text(
                                    flight.arrivalAirport,
                                    style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Свободных мест: ${flight.availableSeats}',
                                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                              ),
                              Text(
                                'Цена за место: ${priceFormat.format(flight.pricePerSeat)}',
                                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // Количество мест - выпадающий список
                        Text('Количество мест', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                        SizedBox(height: 8.h),
                        DropdownButton2<int>(
                          value: _seatsCount,
                          isExpanded: true,
                          items: availableSeatsList.map((seats) {
                            return DropdownMenuItem<int>(
                              value: seats,
                              child: Text(
                                '$seats ${seats == 1
                                    ? 'место'
                                    : seats < 5
                                    ? 'места'
                                    : 'мест'}',
                                style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                              ),
                            );
                          }).toList(),
                          onChanged: isLoading
                              ? null
                              : (value) {
                                  if (value != null) {
                                    setState(() {
                                      _seatsCount = value;
                                    });
                                  }
                                },
                          buttonStyleData: ButtonStyleData(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Color(0xFFD9E6F8)),
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Color(0xFFD9E6F8)),
                            ),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            height: 48.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                          ),
                          iconStyleData: IconStyleData(icon: Icon(Icons.arrow_drop_down, color: Color(0xFF9CA5AF))),
                        ),
                        SizedBox(height: 16.h),
                        // Итоговая стоимость
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Color(0xFFE3F1FF),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Итого:', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                              Text(
                                priceFormat.format(totalPrice),
                                style: AppStyles.bold20s.copyWith(color: Color(0xFF0A6EFA)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // Кнопки
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.of(context).pop(), // Всегда можно закрыть
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  side: BorderSide(color: Color(0xFFD9E6F8)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                ),
                                child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: isLoading ? null : () => _submitBooking(flight),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0A6EFA),
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                  disabledBackgroundColor: Color(0xFF9CA5AF),
                                ),
                                child: isLoading
                                    ? SizedBox(
                                        height: 20.h,
                                        width: 20.w,
                                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                      )
                                    : Text('Забронировать', style: AppStyles.bold14s.copyWith(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

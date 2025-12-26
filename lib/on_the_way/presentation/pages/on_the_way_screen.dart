import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OnTheWayScreen extends StatefulWidget {
  const OnTheWayScreen({super.key});

  @override
  State<OnTheWayScreen> createState() => _OnTheWayScreenState();
}

class _OnTheWayScreenState extends State<OnTheWayScreen> {
  bool _isLoading = false;
  String? _testResult;
  String? _errorMessage;

  Future<void> _testGetFlights() async {
    setState(() {
      _isLoading = true;
      _testResult = null;
      _errorMessage = null;
    });

    try {
      final repository = getIt<OnTheWayRepository>();
      final result = await repository.getFlights();

      result.fold(
        (failure) {
          final errorDetails = StringBuffer('Ошибка: ${failure.message ?? "Неизвестная ошибка"}\n');
          if (failure.statusCode != null) {
            errorDetails.write('Код: ${failure.statusCode}\n');
          }
          if (failure.responseMessage != null) {
            errorDetails.write('Ответ сервера: ${failure.responseMessage}');
          }
          setState(() {
            _errorMessage = errorDetails.toString();
            _isLoading = false;
          });
        },
        (flights) {
          final buffer = StringBuffer('✅ Успешно!\nНайдено полетов: ${flights.length}');
          if (flights.isNotEmpty) {
            buffer.write('\n\nПервый полет:\n');
            buffer.write('От: ${flights.first.departureAirport}\n');
            buffer.write('До: ${flights.first.arrivalAirport}\n');
            buffer.write('Дата: ${flights.first.departureDate}\n');
            buffer.write('Мест: ${flights.first.availableSeats}\n');
            buffer.write('Цена: ${flights.first.pricePerSeat}');
          }
          setState(() {
            _testResult = buffer.toString();
            _isLoading = false;
          });
        },
      );
    } catch (e, stackTrace) {
      final errorDetails = StringBuffer('Исключение: $e\n');
      if (e is DioException) {
        errorDetails.write('Тип: DioException\n');
        if (e.response != null) {
          errorDetails.write('Статус: ${e.response?.statusCode}\n');
          errorDetails.write('Данные ответа: ${e.response?.data}\n');
          if (e.response?.data is Map) {
            final data = e.response!.data as Map;
            if (data.containsKey('error')) {
              errorDetails.write('Ошибка сервера: ${data['error']}\n');
            }
          }
        }
        if (e.requestOptions.data != null) {
          errorDetails.write('Отправленные данные: ${e.requestOptions.data}\n');
        }
        if (e.message != null) {
          errorDetails.write('Сообщение: ${e.message}\n');
        }
        errorDetails.write('URL: ${e.requestOptions.uri}\n');
        errorDetails.write('Метод: ${e.requestOptions.method}\n');
      }
      errorDetails.write('\nStackTrace:\n$stackTrace');
      setState(() {
        _errorMessage = errorDetails.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _testCreateFlight() async {
    // Проверка авторизации
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
    if (!isAuthenticated) {
      setState(() {
        _errorMessage = '❌ Ошибка: Требуется авторизация\n\nДля создания полета необходимо войти в систему.';
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _testResult = null;
      _errorMessage = null;
    });

    try {
      final repository = getIt<OnTheWayRepository>();
      final result = await repository.createFlight(
        departureAirport: 'UUDD',
        arrivalAirport: 'UUEE',
        departureDate: DateTime.now().add(Duration(days: 7)),
        availableSeats: 2,
        pricePerSeat: 5000.0,
        aircraftType: 'Cessna 172',
        description: 'Тестовый полет',
      );

      result.fold(
        (failure) {
          final errorDetails = StringBuffer('Ошибка: ${failure.message ?? "Неизвестная ошибка"}\n');
          if (failure.statusCode != null) {
            errorDetails.write('Код: ${failure.statusCode}\n');
          }
          if (failure.responseMessage != null) {
            errorDetails.write('Ответ сервера: ${failure.responseMessage}');
          }
          setState(() {
            _errorMessage = errorDetails.toString();
            _isLoading = false;
          });
        },
        (flight) {
          final buffer = StringBuffer('✅ Полет создан!\n\nID: ${flight.id}\n');
          buffer.write('От: ${flight.departureAirport}\n');
          buffer.write('До: ${flight.arrivalAirport}\n');
          buffer.write('Дата: ${flight.departureDate}\n');
          buffer.write('Мест: ${flight.availableSeats}\n');
          buffer.write('Цена: ${flight.pricePerSeat}');
          setState(() {
            _testResult = buffer.toString();
            _isLoading = false;
          });
        },
      );
    } catch (e, stackTrace) {
      final errorDetails = StringBuffer('Исключение: $e\n');
      if (e is DioException) {
        errorDetails.write('Тип: DioException\n');
        if (e.response != null) {
          errorDetails.write('Статус: ${e.response?.statusCode}\n');
          errorDetails.write('Данные ответа: ${e.response?.data}\n');
          if (e.response?.data is Map) {
            final data = e.response!.data as Map;
            if (data.containsKey('error')) {
              errorDetails.write('Ошибка сервера: ${data['error']}\n');
            }
          }
        }
        if (e.requestOptions.data != null) {
          errorDetails.write('Отправленные данные: ${e.requestOptions.data}\n');
        }
        if (e.message != null) {
          errorDetails.write('Сообщение: ${e.message}\n');
        }
        errorDetails.write('URL: ${e.requestOptions.uri}\n');
        errorDetails.write('Метод: ${e.requestOptions.method}\n');
      }
      errorDetails.write('\nStackTrace:\n$stackTrace');
      setState(() {
        _errorMessage = errorDetails.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _testGetBookings() async {
    // Проверка авторизации
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
    if (!isAuthenticated) {
      setState(() {
        _errorMessage = '❌ Ошибка: Требуется авторизация\n\nДля получения бронирований необходимо войти в систему.';
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _testResult = null;
      _errorMessage = null;
    });

    try {
      final repository = getIt<OnTheWayRepository>();
      final result = await repository.getBookings();

      result.fold(
        (failure) {
          final errorDetails = StringBuffer('Ошибка: ${failure.message ?? "Неизвестная ошибка"}\n');
          if (failure.statusCode != null) {
            errorDetails.write('Код: ${failure.statusCode}\n');
          }
          if (failure.responseMessage != null) {
            errorDetails.write('Ответ сервера: ${failure.responseMessage}');
          }
          setState(() {
            _errorMessage = errorDetails.toString();
            _isLoading = false;
          });
        },
        (bookings) {
          final buffer = StringBuffer('✅ Успешно!\nНайдено бронирований: ${bookings.length}');
          if (bookings.isNotEmpty) {
            buffer.write('\n\nПервое бронирование:\n');
            buffer.write('ID: ${bookings.first.id}\n');
            buffer.write('Flight ID: ${bookings.first.flightId}\n');
            buffer.write('Мест: ${bookings.first.seatsCount}\n');
            buffer.write('Цена: ${bookings.first.totalPrice}\n');
            buffer.write('Статус: ${bookings.first.status}');
          }
          setState(() {
            _testResult = buffer.toString();
            _isLoading = false;
          });
        },
      );
    } catch (e, stackTrace) {
      final errorDetails = StringBuffer('Исключение: $e\n');
      if (e is DioException) {
        errorDetails.write('Тип: DioException\n');
        if (e.response != null) {
          errorDetails.write('Статус: ${e.response?.statusCode}\n');
          errorDetails.write('Данные ответа: ${e.response?.data}\n');
          if (e.response?.data is Map) {
            final data = e.response!.data as Map;
            if (data.containsKey('error')) {
              errorDetails.write('Ошибка сервера: ${data['error']}\n');
            }
          }
        }
        if (e.requestOptions.data != null) {
          errorDetails.write('Отправленные данные: ${e.requestOptions.data}\n');
        }
        if (e.message != null) {
          errorDetails.write('Сообщение: ${e.message}\n');
        }
        errorDetails.write('URL: ${e.requestOptions.uri}\n');
        errorDetails.write('Метод: ${e.requestOptions.method}\n');
      }
      errorDetails.write('\nStackTrace:\n$stackTrace');
      setState(() {
        _errorMessage = errorDetails.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'По пути', withBack: false),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.h),
            Text('Тестирование Data Layer', style: AppStyles.bold20s),
            SizedBox(height: 8.h),
            Text(
              'Проверка подключения к backend и работы endpoints',
              style: AppStyles.regular14s.copyWith(color: Color(0xFF6E7A89)),
            ),
            SizedBox(height: 24.h),
            Consumer<AppState>(
              builder: (context, appState, _) {
                return Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: appState.isAuthenticated ? Color(0xFFD1FAE5) : Color(0xFFFFF4E6),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: appState.isAuthenticated ? Color(0xFF10B981) : Color(0xFFFFA726)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        appState.isAuthenticated ? Icons.check_circle : Icons.warning,
                        color: appState.isAuthenticated ? Color(0xFF10B981) : Color(0xFFFFA726),
                        size: 20,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          appState.isAuthenticated
                              ? '✅ Вы авторизованы. Все тесты доступны.'
                              : '⚠️ Вы не авторизованы. Тесты создания полета и получения бронирований требуют авторизации.',
                          style: AppStyles.regular12s.copyWith(
                            color: appState.isAuthenticated ? Color(0xFF065F46) : Color(0xFFE65100),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            if (_isLoading)
              Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16.h),
                    Text('Загрузка...', style: AppStyles.regular14s),
                  ],
                ),
              )
            else ...[
              _buildTestButton(title: 'Тест: Получить полеты', onPressed: _testGetFlights, color: Color(0xFF0A6EFA)),
              SizedBox(height: 12.h),
              _buildTestButton(title: 'Тест: Создать полет', onPressed: _testCreateFlight, color: Color(0xFF10B981)),
              SizedBox(height: 12.h),
              _buildTestButton(
                title: 'Тест: Получить бронирования',
                onPressed: _testGetBookings,
                color: Color(0xFF8B5CF6),
              ),
            ],
            if (_testResult != null) ...[
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xFF10B981)),
                ),
                child: Text(_testResult!, style: AppStyles.regular14s.copyWith(color: Color(0xFF065F46))),
              ),
            ],
            if (_errorMessage != null) ...[
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xFFEF4444)),
                ),
                child: Text(_errorMessage!, style: AppStyles.regular14s.copyWith(color: Color(0xFF991B1B))),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTestButton({required String title, required VoidCallback onPressed, required Color color}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(title, style: AppStyles.bold16s.copyWith(color: Colors.white)),
    );
  }
}

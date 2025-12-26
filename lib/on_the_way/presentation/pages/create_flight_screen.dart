import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/search_bar_widget.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CreateFlightScreen extends StatefulWidget {
  const CreateFlightScreen({super.key});

  @override
  State<CreateFlightScreen> createState() => _CreateFlightScreenState();
}

class _CreateFlightScreenState extends State<CreateFlightScreen> {
  final _formKey = GlobalKey<FormState>();
  final _departureAirportController = TextEditingController();
  final _arrivalAirportController = TextEditingController();
  final _seatsController = TextEditingController();
  final _priceController = TextEditingController();
  final _aircraftTypeController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _departureAirport;
  String? _arrivalAirport;
  DateTime? _departureDate;
  TimeOfDay? _departureTime;
  late AirportService _airportService;

  @override
  void initState() {
    super.initState();
    final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
    _airportService = AirportService(apiDatasource.dio);
  }

  @override
  void dispose() {
    _departureAirportController.dispose();
    _arrivalAirportController.dispose();
    _seatsController.dispose();
    _priceController.dispose();
    _aircraftTypeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDateAndTime() async {
    // Сначала выбираем дату
    final dateResult = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: Color(0xFF0A6EFA),
        todayTextStyle: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA)),
        selectedDayTextStyle: AppStyles.bold14s.copyWith(color: Colors.white),
      ),
      dialogSize: Size(MediaQuery.of(context).size.width * 0.9, 400),
      value: _departureDate != null ? [_departureDate!] : [],
    );

    if (dateResult == null || dateResult.isEmpty) return;

    final selectedDate = dateResult.first;
    if (selectedDate == null) return;

    // Затем выбираем время
    final timeResult = await showTimePicker(
      context: context,
      initialTime: _departureTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: Color(0xFF0A6EFA))),
          child: child!,
        );
      },
    );

    if (timeResult != null) {
      setState(() {
        _departureDate = selectedDate;
        _departureTime = timeResult;
      });
    }
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_departureAirport == null || _departureAirport!.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Выберите аэропорт отправления'), backgroundColor: Colors.red));
      return;
    }

    if (_arrivalAirport == null || _arrivalAirport!.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Выберите аэропорт прибытия'), backgroundColor: Colors.red));
      return;
    }

    if (_departureDate == null || _departureTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Выберите дату и время вылета'), backgroundColor: Colors.red));
      return;
    }

    // Объединяем дату и время
    final departureDateTime = DateTime(
      _departureDate!.year,
      _departureDate!.month,
      _departureDate!.day,
      _departureTime!.hour,
      _departureTime!.minute,
    );

    // Проверяем, что дата в будущем
    if (departureDateTime.isBefore(DateTime.now())) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Дата вылета должна быть в будущем'), backgroundColor: Colors.red));
      return;
    }

    // Создаем полет
    context.read<FlightsBloc>().add(
      CreateFlightEvent(
        departureAirport: _departureAirport!,
        arrivalAirport: _arrivalAirport!,
        departureDate: departureDateTime,
        availableSeats: int.parse(_seatsController.text),
        pricePerSeat: double.parse(_priceController.text.replaceAll(' ', '').replaceAll(',', '.')),
        aircraftType: _aircraftTypeController.text.isNotEmpty ? _aircraftTypeController.text : null,
        description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    if (!isAuthenticated) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Создать полет', withBack: true),
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 64, color: Color(0xFF9CA5AF)),
                SizedBox(height: 16.h),
                Text('Требуется авторизация', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 8.h),
                Text(
                  'Для создания полета необходимо войти в систему',
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocListener<FlightsBloc, FlightsState>(
      listener: (context, state) {
        state.when(
          loading: () {},
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorForUser), backgroundColor: Colors.red, duration: Duration(seconds: 3)),
            );
          },
          success: (flights, departureAirport, arrivalAirport, dateFrom, dateTo) {
            // Успешное создание - возвращаемся назад
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Полет успешно создан'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'Создать полет', withBack: true),
        backgroundColor: AppColors.background,
        body: BlocBuilder<FlightsBloc, FlightsState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Аэропорт отправления
                    Text('Аэропорт отправления', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    SearchBarWidget(
                      initialValue: _departureAirport,
                      hintText: 'Введите код аэропорта (например, UUDD)',
                      airportService: _airportService,
                      onSelected: (code) {
                        setState(() => _departureAirport = code);
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Аэропорт прибытия
                    Text('Аэропорт прибытия', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    SearchBarWidget(
                      initialValue: _arrivalAirport,
                      hintText: 'Введите код аэропорта (например, UUEE)',
                      airportService: _airportService,
                      onSelected: (code) {
                        setState(() => _arrivalAirport = code);
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Дата и время вылета
                    Text('Дата и время вылета', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: _selectDateAndTime,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Color(0xFFD9E6F8)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today, color: Color(0xFF9CA5AF)),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                _departureDate != null && _departureTime != null
                                    ? '${DateFormat('dd.MM.yyyy HH:mm').format(DateTime(_departureDate!.year, _departureDate!.month, _departureDate!.day, _departureTime!.hour, _departureTime!.minute))}'
                                    : 'Выберите дату и время',
                                style: AppStyles.regular14s.copyWith(
                                  color: _departureDate != null ? Color(0xFF374151) : Color(0xFF9CA5AF),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF9CA5AF)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Количество мест
                    TextFormField(
                      controller: _seatsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Количество свободных мест *',
                        hintText: 'Например: 2',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите количество мест';
                        }
                        final seats = int.tryParse(value);
                        if (seats == null || seats <= 0) {
                          return 'Количество мест должно быть больше 0';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Цена за место
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Цена за место (₽) *',
                        hintText: 'Например: 5000',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите цену за место';
                        }
                        final price = double.tryParse(value.replaceAll(' ', '').replaceAll(',', '.'));
                        if (price == null || price <= 0) {
                          return 'Цена должна быть больше 0';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Тип самолета (опционально)
                    TextFormField(
                      controller: _aircraftTypeController,
                      decoration: InputDecoration(
                        labelText: 'Тип самолета',
                        hintText: 'Например: Cessna 172',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Описание (опционально)
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Описание',
                        hintText: 'Дополнительная информация о полете',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Кнопка создания
                    ElevatedButton(
                      onPressed: isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0A6EFA),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                        disabledBackgroundColor: Color(0xFF9CA5AF),
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : Text('Создать полет', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

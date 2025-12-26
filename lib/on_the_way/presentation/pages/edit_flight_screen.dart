import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/search_bar_widget.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

@RoutePage()
class EditFlightScreen extends StatefulWidget {
  final FlightEntity flight;

  const EditFlightScreen({super.key, required this.flight});

  @override
  State<EditFlightScreen> createState() => _EditFlightScreenState();
}

class _EditFlightScreenState extends State<EditFlightScreen> {
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
    // Предзаполняем поля данными из полета
    _departureAirport = widget.flight.departureAirport;
    _arrivalAirport = widget.flight.arrivalAirport;
    _departureDate = widget.flight.departureDate;
    _departureTime = TimeOfDay.fromDateTime(widget.flight.departureDate);
    _seatsController.text = widget.flight.totalSeats?.toString() ?? widget.flight.availableSeats.toString();
    _priceController.text = widget.flight.pricePerSeat.toStringAsFixed(0);
    _aircraftTypeController.text = widget.flight.aircraftType ?? '';
    _descriptionController.text = widget.flight.description ?? '';
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

    // Обновляем полет
    // Преобразуем цену в double (будет округлено до int в repository)
    final priceValue = double.parse(_priceController.text.replaceAll(' ', '').replaceAll(',', '.'));

    context.read<FlightsBloc>().add(
      UpdateFlightEvent(
        flightId: widget.flight.id,
        departureAirport: _departureAirport,
        arrivalAirport: _arrivalAirport,
        departureDate: departureDateTime,
        availableSeats: int.parse(_seatsController.text),
        pricePerSeat: priceValue,
        aircraftType: _aircraftTypeController.text.isNotEmpty ? _aircraftTypeController.text : null,
        description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FlightsBloc, FlightsState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(responseMessage ?? errorForUser),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 4),
              ),
            );
          },
          success: (flights, departureAirport, arrivalAirport, dateFrom, dateTo) {
            // После успешного обновления возвращаемся назад
            Navigator.of(context).pop(true);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'Редактировать полет', withBack: true),
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
                    OutlinedButton.icon(
                      onPressed: _selectDateAndTime,
                      icon: Icon(Icons.calendar_today, color: Color(0xFF0A6EFA)),
                      label: Text(
                        _departureDate != null && _departureTime != null
                            ? '${DateFormat('dd.MM.yyyy').format(_departureDate!)} ${_departureTime!.format(context)}'
                            : 'Выберите дату и время',
                        style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        side: BorderSide(color: Color(0xFFD9E6F8)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Количество мест
                    Text('Количество мест', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _seatsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Введите количество мест',
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
                    Text('Цена за место (₽)', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: 'Введите цену за место',
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
                    Text('Тип самолета (опционально)', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _aircraftTypeController,
                      decoration: InputDecoration(
                        hintText: 'Например, Cessna 172',
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Описание (опционально)
                    Text('Описание (опционально)', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Кнопка сохранения
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
                          : Text('Сохранить изменения', style: AppStyles.bold16s.copyWith(color: Colors.white)),
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

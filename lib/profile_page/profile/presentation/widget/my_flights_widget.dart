import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/flight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFlightsWidget extends StatefulWidget {
  final int userId;

  const MyFlightsWidget({super.key, required this.userId});

  @override
  State<MyFlightsWidget> createState() => _MyFlightsWidgetState();
}

class _MyFlightsWidgetState extends State<MyFlightsWidget> {
  @override
  void initState() {
    super.initState();
    // Загружаем полёты пользователя
    context.read<FlightsBloc>().add(const GetMyFlightsEvent(isRefresh: false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightsBloc, FlightsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Мои полёты', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 12),
            state.maybeWhen(
              loading: () => Center(
                child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
              ),
              error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                ),
              ),
              success: (flights, airport, departureAirport, arrivalAirport, dateFrom, dateTo) =>
                  _buildFlightsList(context, flights),
              orElse: () => SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFlightsList(BuildContext context, List<FlightEntity> flights) {
    if (flights.isEmpty) {
      return Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.flight_takeoff_outlined, size: 48, color: Color(0xFF9CA5AF)),
              SizedBox(height: 12),
              Text('У вас пока нет полётов', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
            ],
          ),
        ),
      );
    }

    // Сортируем полёты по дате отправления (ближайшие первыми)
    final sortedFlights = [...flights]..sort((a, b) => a.departureDate.compareTo(b.departureDate));

    return SizedBox(
      height: 750, // Фиксированная высота для горизонтального списка
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: sortedFlights.length,
        itemBuilder: (context, index) {
          final flight = sortedFlights[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.85, // Ширина карточки
            margin: EdgeInsets.only(right: 12),
            child: FlightCard(
              flight: flight,
              onTap: () {
                context.router.push(
                  BaseRoute(
                    children: [
                      OnTheWayNavigationRoute(children: [FlightDetailRoute(flightId: flight.id)]),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

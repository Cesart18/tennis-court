import '../domain.dart';

class DateWheater {
  final DateTime date;
  final ForecastDay forecastDay;
  final List<ForecastHour> forecastHoursOfDay;

  DateWheater(
      {required this.date,
      required this.forecastDay,
      required this.forecastHoursOfDay});
}

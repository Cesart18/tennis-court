
import '../../domain/domain.dart';

  class WheaterMapper {

  static WheaterCondition conditionToEntity( Condition condition ) => WheaterCondition(
    text: condition.text, icon: condition.icon);

  static ForecastDay dayToEntity ( Day day ) => ForecastDay(
    dailyWillItRain: day.dailyWillItRain,
     dailyChanceOfRain: day.dailyChanceOfRain,
      condition: WheaterMapper.conditionToEntity(day.condition));

  static ForecastHour hourToEntity( Hour hour ) => ForecastHour(
    hour: DateTime.parse(hour.time),
     willItRain: hour.willItRain,
      chanceOfRain: hour.chanceOfRain,
       condition: WheaterMapper.conditionToEntity(hour.condition));

  static DateWheater wheaterApiReponseToEntity( WheaterApiResponse response ) => DateWheater(
    date: response.forecast.forecastday[0].date,
    forecastDay: WheaterMapper.dayToEntity(response.forecast.forecastday[0].day),
    forecastHoursOfDay: response.forecast.forecastday[0].hour.map((e) => WheaterMapper.hourToEntity(e)).toList()
    );

  }
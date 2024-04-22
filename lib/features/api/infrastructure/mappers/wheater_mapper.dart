
import '../../domain/domain.dart';

  class WheaterMapper {

  static WheaterCondition conditionToEntity( Condition condition ) => WheaterCondition(
    text: condition.text, icon: condition.icon);

  static ForecastDay dayToEntity ( Day day ) => ForecastDay(
    dailyWillItRain: day.dailyWillItRain,
     dailyChanceOfRain: day.dailyChanceOfRain,
      condition: WheaterMapper.conditionToEntity(day.condition));



  static DateWheater wheaterApiReponseToEntity( WheaterApiResponse response ) => DateWheater(
    date: response.forecast.forecastday[0].date,
    forecastDay: WheaterMapper.dayToEntity(response.forecast.forecastday[0].day));

  }
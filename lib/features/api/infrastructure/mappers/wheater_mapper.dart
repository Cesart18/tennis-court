
import '../../domain/domain.dart';

  class WheaterMapper {

  static WheaterCondition conditionToEntity( Condition condition ) => WheaterCondition(
    text: condition.text, icon: condition.icon);

  static WheaterDay dayToEntity ( Day? day ) => WheaterDay(
    dailyWillItRain: day?.dailyWillItRain ?? -1,
     dailyChanceOfRain: day?.dailyChanceOfRain ?? -1 ,
      condition: conditionToEntity(day!.condition));

  static WheaterForecastDay forcastDayToEntity ( Forecastday forecastday ) => WheaterForecastDay(
    date: forecastday.date, day: dayToEntity(forecastday.day));

  static WheaterForecast wheaterApiReponseToEntity( WheaterApiResponse response ) => WheaterForecast(
    wheaterForcastDay: response.forecast.forecastday.map((e) => forcastDayToEntity(e)).toList()
    );

  }



  import 'package:tennis_court/features/api/domain/domain.dart';

class FutureWheaterMapper {

    static WheaterCondition conditionToEntity( FutureCondition condition ) => WheaterCondition(
    text: condition.text, icon: condition.icon);

  static WheaterDay dayToEntity ( FutureDay day ) => WheaterDay(
    
      condition: conditionToEntity(day.condition));

  static WheaterForecastDay forcastDayToEntity ( FutureForecastday forecastday ) => WheaterForecastDay(
    date: forecastday.date, day: dayToEntity(forecastday.day));

  static WheaterForecast wheaterApiReponseToEntity( FutureWheaterApiResponse response ) => WheaterForecast(
    wheaterForcastDay: response.forecast.forecastday.map((e) => forcastDayToEntity(e)).toList()
    );

  }
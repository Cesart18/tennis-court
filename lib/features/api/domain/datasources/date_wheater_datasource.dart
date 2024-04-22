  import '../domain.dart';


  abstract class DateWheaterDatasource {


    Future<WheaterForecast> getWheaterByDays({ int days = 1 });

    Future<WheaterForecast> getWheaterByDate( DateTime date );


  }
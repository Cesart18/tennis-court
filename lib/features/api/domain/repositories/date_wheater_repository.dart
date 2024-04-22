  import '../domain.dart';


  abstract class DateWheaterRepository {


    Future<WheaterForecast> getWheaterByDays({ int days = 1 });

    Future<WheaterForecast> getWheaterByDate( DateTime date );


  }
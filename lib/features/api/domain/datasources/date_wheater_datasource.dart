  import '../domain.dart';


  abstract class DateWheaterDatasource {


    Future<DateWheater> getWheaterByDate({ int days = 1 });


  }
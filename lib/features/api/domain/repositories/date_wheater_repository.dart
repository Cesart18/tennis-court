  import '../domain.dart';


  abstract class DateWheaterRepository {


    Future<DateWheater> getWheaterByDate({ int days = 1 });


  }
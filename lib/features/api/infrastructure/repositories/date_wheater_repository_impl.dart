import 'package:tennis_court/features/api/domain/domain.dart';
import 'package:tennis_court/features/api/infrastructure/datasources/date_wheater_datasource_impl.dart';

class DateWheaterRepositoryImpl extends DateWheaterRepository {
  final DateWheaterDatasource datasource;

  DateWheaterRepositoryImpl({DateWheaterDatasource? datasource})
      : datasource = datasource ?? DateWheaterDatasourceImpl();

  @override
  Future<WheaterForecast> getWheaterByDays({ int days = 1 }) {
    return datasource.getWheaterByDays(days: days);
  }
  
  @override
  Future<WheaterForecast> getWheaterByDate(DateTime date) {
    return datasource.getWheaterByDate(date);
  }
}

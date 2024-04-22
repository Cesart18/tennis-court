import 'package:tennis_court/features/api/domain/domain.dart';
import 'package:tennis_court/features/api/infrastructure/datasources/date_wheater_datasource_impl.dart';

class DateWheaterRepositoryImpl extends DateWheaterRepository {
  final DateWheaterDatasource datasource;

  DateWheaterRepositoryImpl({DateWheaterDatasource? datasource})
      : datasource = datasource ?? DateWheaterDatasourceImpl();

  @override
  Future<DateWheater> getWheaterByDate({ int days = 1 }) {
    return datasource.getWheaterByDate(days: days);
  }
}

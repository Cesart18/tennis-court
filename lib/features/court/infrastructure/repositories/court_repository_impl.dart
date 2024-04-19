

import 'package:tennis_court/features/court/domain/domain.dart';
import '../infrastructure.dart';

class CourtRepositoryImpl extends CourtRepository{

  final CourtDatasource datasource;

  CourtRepositoryImpl({CourtDatasource? datasource}):datasource = datasource ?? CourtDatasourceImpl();

  @override
  Future<void> initCourtDb() {
    return datasource.initCourtDb();
  }

  @override
  Future<bool> checkCourts() {
    return datasource.checkCourts();
  }

  @override
  Future<List<Court>> getCourts() {
    return datasource.getCourts();
  }
  
  @override
  Future<Court> getCourtById(String id) {
    return datasource.getCourtById(id);
  }
  
  

}
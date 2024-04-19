import 'package:tennis_court/features/court/domain/domain.dart';

abstract class CourtDatasource {
  Future<void> initCourtDb();

  Future<bool> checkCourts();

  Future<List<Court>> getCourts();

  Future<Court> getCourtById( String id );
}

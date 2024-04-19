import 'package:tennis_court/features/court/domain/domain.dart';

abstract class CourtDatasource {
  Future<void> initCourtDb();

  Future<List<Court>> getCourts();
}

import 'package:tennis_court/features/court/domain/domain.dart';

abstract class CourtRepository {
  Future<void> initCourtDb();

  Future<bool> checkCourts();

  Future<List<Court>> getCourts();
}

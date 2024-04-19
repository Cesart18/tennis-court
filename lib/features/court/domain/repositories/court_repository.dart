import 'package:tennis_court/features/court/domain/domain.dart';

abstract class CourtRepository {
  Future<void> initCourtDb();

  Future<List<Court>> getCourts();
}

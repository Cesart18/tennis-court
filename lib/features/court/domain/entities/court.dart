import 'package:isar/isar.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';

part 'court.g.dart';

@collection
class Court {

    final Id id;

    final String name;

    @Index(unique: true)
    final schedules = IsarLinks<Schedule>();

  Court({
    required this.id,
    required this.name
    });


  }
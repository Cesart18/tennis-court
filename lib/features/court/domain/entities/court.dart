import 'package:isar/isar.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';

part 'court.g.dart';

@collection
class Court {

    final Id id;

    final String name;

    @Backlink(to: 'courts')
    final schedule = IsarLinks<Schedule>();

  Court({
    required this.id,
    required this.name
    });


  }
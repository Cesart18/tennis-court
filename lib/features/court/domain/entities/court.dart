import 'package:isar/isar.dart';

part 'court.g.dart';

@collection
class Court {

    final Id id;

    final String name;

  Court({
    required this.id,
    required this.name
    });


  }
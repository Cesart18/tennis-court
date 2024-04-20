

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/infrastructure.dart';

final schedulesRepositoryProvider = Provider((ref) => ScheduleRepositoryImpl());
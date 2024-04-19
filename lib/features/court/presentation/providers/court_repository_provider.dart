


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/infrastructure/infrastructure.dart';

final courtRepositoryProvider = Provider((ref) => CourtRepositoryImpl());
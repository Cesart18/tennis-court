


  import 'package:go_router/go_router.dart';
import 'package:tennis_court/features/tennis_court/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      )
  ]);
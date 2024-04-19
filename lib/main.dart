import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/config/config.dart';
import 'package:tennis_court/shared/shared.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tennis Court',
      theme: AppTheme(isDarkMode: isDarkMode).getTheme(),
      routerConfig: appRouter,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court/config/config.dart';
import 'package:tennis_court/shared/shared.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  await Environment.initEnvironment();
  Intl.defaultLocale = 'es_MX';
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    initializeDateFormatting();

    final isDarkMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tennis Court',
      theme: AppTheme(isDarkMode: isDarkMode).getTheme(),
      routerConfig: appRouter,

      localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en'), // English
    Locale('es'), // Spanish
  ],

    );
  }
}


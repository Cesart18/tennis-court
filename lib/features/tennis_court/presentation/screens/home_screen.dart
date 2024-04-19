import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/shared/shared.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tennis Court'),
        actions: [
          IconButton(onPressed: (){
            ref.read(appThemeProvider.notifier).update((state) => state = !state);
          }, icon:  Icon(
            isDarkMode? CupertinoIcons.brightness : CupertinoIcons.moon
          ))
        ],
      ),
    );
  }
}
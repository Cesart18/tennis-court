import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';
import 'package:tennis_court/shared/shared.dart';
import '../presentation.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final isDarkMode = ref.watch(appThemeProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: colors.onBackground,
        elevation: 1,
        centerTitle: true,
        title: const Text('Tennis Court'),
        actions: [
          IconButton(onPressed: (){
            ref.read(appThemeProvider.notifier).update((state) => state = !state);
          }, icon:  Icon(
            isDarkMode? CupertinoIcons.brightness : CupertinoIcons.moon
          ))
        ],
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends ConsumerWidget {
  const _HomeScreenView();


  _showModal( BuildContext context, Widget widget ){
    showDialog(
      barrierDismissible: false,
      context: context,
       builder: (context) => widget);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final courts = ref.watch(courtsProvider).courts;
    final schedules = sortSchedulesByDate(ref.watch(schedulesProvider).schedules);
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...courts.map((court) => CourtCard(court: court,))
              ],
            ),
          ),
          const SizedBox(height: 10,),
           Divider(color: colors.onBackground,),
          const SizedBox(height: 5,),
          
              const Text('Lista de agendas'),
          const SizedBox(height: 10),

           Expanded(
            child: ScheduleListView(schedules: schedules)
          ),
      
      
          CustomButton(
              onPressed: () => _showModal(context, NewScheduleModal(courts: courts,)),
              text: 'Nueva agenda',
            )
           
        ],
      ),
    );
  }
}
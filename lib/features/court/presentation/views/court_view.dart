import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/presentation/providers/court_provider.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';
import 'package:tennis_court/shared/widgets/custom_button.dart';

class CourtView extends ConsumerWidget {
  final String courtId;
  const CourtView({super.key, required this.courtId});

  _showModal( BuildContext context, Widget widget ){
    showDialog(
      barrierDismissible: false,
      context: context,
       builder: (context) => widget);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final court = ref.watch(courtProvider(courtId)).court;
    final schedules = ref.watch(courtProvider(courtId)).schedules;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancha: ${court?.name ?? 'Cancha no encontrada'}'),
        shadowColor: colors.onBackground,
        elevation: 1,
      ),
      body:  SafeArea(
        child: Center(
          child: Column(
          children: [
            const SizedBox(height: 10,),
            const Text('Lista de agendas'),
            const SizedBox(height: 10,),
            Expanded(
              child: ScheduleListView(schedules: schedules)
              ),
            CustomButton(text: 'Nueva agenda', onPressed: (){
                _showModal(context, NewScheduleModal(courts: [court!]));
            })
          ],
                ),
        )),
    );
  }
}
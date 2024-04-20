import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import '../presentation.dart';

class NewScheduleModal extends ConsumerWidget {
  final List<Court> courts;
  const NewScheduleModal({super.key, required this.courts});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      elevation: 0,
      content:  NewScheduleModalView(courts: courts,),
      actions: [
        CustomActionButton(
          text: 'Cancelar',
          bgColor: Colors.red,
           onPressed: (){
              context.pop();

           }),


        const SizedBox(width: 20),


        CustomActionButton(
          text: 'Aceptar',
           onPressed: (){
           ref.watch(scheduleFormProvider.notifier).onFormSubmit();
          //  TODO: agregar la validacion
           }),
      ],
    );
  }
}
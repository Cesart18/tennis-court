import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';

class ScheduleListView extends ConsumerWidget {
  final List<Schedule>? schedules;
  const ScheduleListView({super.key, required this.schedules});

  _showModal( BuildContext context, Function() onPressed ){
    showDialog(
      barrierDismissible: false,
      context: context,
       builder: (context) {
        return AlertDialog(
          elevation: 0,
          title: const Text('Alerta'),
                content: const Text('¿Estas seguro que desea eliminar esta agenda?'),
                actions: [
                  CustomActionButton(text: 'Aceptar', onPressed: onPressed, bgColor: Colors.red,),
                  const SizedBox(width: 20,),
                  CustomActionButton(text: 'Cancelar', onPressed: (){
                      context.pop();
                  }),
                ],
              );
       },);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;


    return (schedules != null && schedules!.isNotEmpty )? ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: schedules?.length,
      itemBuilder: (context, index) {
        final schedule = schedules![index];

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            trailing: IconButton(onPressed: (){
              _showModal(context, (){
                ref.read(schedulesProvider.notifier).deleteSchedule(schedule);
                context.pop();
              });
            }, icon: const Icon(CupertinoIcons.trash_fill,)),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(2),
              side:  BorderSide(width: .5, color: colors.onBackground)
            ),
            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cancha: ${schedule.courts.first.name}'),
                Text('Usuario: ${schedule.userName}')
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fecha: ${DateFormat('dd-MM-yyyy').format(schedule.date)}'),
                Text('Hora: ${DateFormat('hh:mm a').format(schedule.date)}'),

              ],
            ),
          ),
        );
      },):const Center(
        child: Text('No hay agendas hasta la fecha'),
      );
  }
}
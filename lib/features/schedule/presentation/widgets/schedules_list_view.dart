import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court/features/schedule/domain/domain.dart';

class ScheduleListView extends StatelessWidget {
  final List<Schedule>? schedules;
  const ScheduleListView({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
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
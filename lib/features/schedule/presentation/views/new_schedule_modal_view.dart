import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import '../presentation.dart';

class NewScheduleModalView extends ConsumerWidget {
  final List<Court> courts;
  const NewScheduleModalView({super.key, required this.courts});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final scheduleForm = ref.watch(scheduleFormProvider);
    return SizedBox(
      width: 320,
      height: 400,
      child: Column(
        children: [
          Text(
            'Nuevo registro',
            style: textStyle.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
         CustomFormField(
          keyboardType: TextInputType.name,
           labelText: 'Nombre',
            length: 20,
             prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
             onChanged: ref.read(scheduleFormProvider.notifier).onUserNameChanged,
             ),
          const SizedBox(
            height: 10,
          ),
          // TODO: agregar los errortext

         CustomFormField(
          keyboardType: TextInputType.name,
           labelText: 'Fecha',
            length: 20,
             prefixIcon: const Icon(CupertinoIcons.calendar),
             readOnly: true,
             onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context, 
                initialDate: scheduleForm.date,
                firstDate: scheduleForm.date,
                 lastDate: DateTime(2025));
                 if (pickedDate != null && pickedDate != scheduleForm.date) {
                ref.read(scheduleFormProvider.notifier).onDateChanged(pickedDate);
        }

             },
             ),
             
          const SizedBox(
            height: 10,
          ),

         CustomFormField(
          keyboardType: TextInputType.name,
           labelText: 'Hora',
            length: 20,
             prefixIcon: const Icon(CupertinoIcons.clock),
             readOnly: true,
             onTap: () async {
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialEntryMode: TimePickerEntryMode.inputOnly,
               initialTime: scheduleForm.time);
               if( pickedTime != null && pickedTime != scheduleForm.time ){
                ref.read(scheduleFormProvider.notifier).onTimeChanged(pickedTime);
               }
             },
             ),


          const SizedBox(
            height: 10,
          ),



          CustomDropDownMenuButton(
            courts: courts,
          ),
          
        ],
      ),
    );
  }
}

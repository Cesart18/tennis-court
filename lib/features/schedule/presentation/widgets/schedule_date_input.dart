import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court/config/config.dart';
import 'package:tennis_court/features/api/domain/domain.dart';
import 'package:tennis_court/features/api/presentation/providers/date_wheater_provider.dart';
import '../presentation.dart';

class ScheduleDateInput extends ConsumerWidget {
  const ScheduleDateInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleForm = ref.watch(scheduleFormProvider);
    final date = scheduleForm.date;
    late WheaterForecastDay dateWheater;
    final dateWheaterState = ref.watch(dateWheaterProvider).wheateForecastDay;
    final alreadyWheater = dateWheaterState.any((element) => element.date == date.value);
    if( dateWheaterState.isNotEmpty && alreadyWheater ){
      dateWheater = dateWheaterState.firstWhere((element) => element.date == date.value);
    }
    return  Column(
      children: [
        CustomFormField(
                keyboardType: TextInputType.name,
                labelText: DateFormat('EEEE dd-MM ', Intl.getCurrentLocale())
                    .format(scheduleForm.date.value!),
                length: 20,
                prefixIcon: const Icon(CupertinoIcons.calendar),
                readOnly: true,
                onFieldSubmitted: (_) =>
                    ref.read(scheduleFormProvider.notifier).onFormSubmit(),
                errorText: scheduleForm.isFormPosted
                    ? scheduleForm.date.errorMessage
                    : null,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                      helpText: 'Seleccione una fecha',
                      errorFormatText: scheduleForm.date.errorMessage,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025));
                  if (pickedDate != null && pickedDate != DateTime.now()) {
                    ref
                        .read(scheduleFormProvider.notifier)
                        .onDateChanged(pickedDate);
                  }
                },
              ),
              if( dateWheaterState.isNotEmpty && alreadyWheater )
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dateWheater.day.condition.text,
                  style: const TextStyle(color: primaryColor),
                  ),
                  const SizedBox(width: 6,),
                  Image.network('https:${dateWheater.day.condition.icon}', width: 20,)
                ],
              )
      ],
    );
  }
}
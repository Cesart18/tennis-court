import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../presentation.dart';

class ScheduleDateInput extends ConsumerWidget {
  const ScheduleDateInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleForm = ref.watch(scheduleFormProvider);
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
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../presentation.dart';

class ScheduleTimeInput extends ConsumerWidget {
  const ScheduleTimeInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleForm = ref.watch(scheduleFormProvider);
    return Column(
      children: [
        CustomFormField(
                keyboardType: TextInputType.name,
                labelText: DateFormat('hh:mm a').format(scheduleForm.date.value!),
                length: 20,
                prefixIcon: const Icon(CupertinoIcons.clock),
                readOnly: true,
                onFieldSubmitted: (_) =>
                    ref.read(scheduleFormProvider.notifier).onFormSubmit(),
                errorText: scheduleForm.isFormPosted
                    ? scheduleForm.initialTime.errorMessage
                    : null,
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: scheduleForm.initialTime.value ?? TimeOfDay.now(),
                  );
                  if (pickedTime != null && pickedTime != TimeOfDay.now()) {
                    ref
                        .read(scheduleFormProvider.notifier)
                        .onInitialTimeChanged(pickedTime);
                  }
                },
              ),
      ],
    );
  }
}
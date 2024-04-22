import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import '../presentation.dart';

class NewScheduleModalView extends ConsumerWidget {
  final List<Court> courts;
  const NewScheduleModalView({super.key, required this.courts});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final scheduleForm = ref.watch(scheduleFormProvider);
    final scheduleState = ref.watch(schedulesProvider);

    ref.listen(schedulesProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      Future.delayed(const Duration(milliseconds: 100));
      ref.read(schedulesProvider.notifier).onGetErrorMessage(next.errorMessage);
    });

    return SizedBox(
      width: 320,
      height: 500,
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
            onChanged:
                ref.read(scheduleFormProvider.notifier).onUserNameChanged,
            errorText: scheduleForm.isFormPosted
                ? scheduleForm.userName.errorMessage
                : null,
            onFieldSubmitted: (_) =>
                ref.read(scheduleFormProvider.notifier).onFormSubmit(),
          ),
          const SizedBox(
            height: 10,
          ),
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
          const SizedBox(
            height: 10,
          ),
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
          const SizedBox(
            height: 10,
          ),
          const TimeDropDownMenuButton(),
          const SizedBox(
            height: 10,
          ),
          CourtsDropDownMenuButton(
            courts: courts,
          ),
          if (scheduleState.errorMessage.length > 2)
            const SizedBox(
              height: 30,
            ),
          Center(
            child: Text(
              scheduleState.errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

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
          const ScheduleDateInput(),

          const SizedBox(height: 10),

          const ScheduleTimeInput(),

          const SizedBox(height: 10),

          const TimeDropDownMenuButton(),

          const SizedBox(height: 20),

          CourtsDropDownMenuButton(courts: courts,)
          ,
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

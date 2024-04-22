import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/config/config.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';


class TimeDropDownMenuButton extends ConsumerWidget {
  const TimeDropDownMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final scheduleForm = ref.watch(scheduleFormProvider);

    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.onBackground));
    return DropdownMenu<int>(
      leadingIcon: const Icon(Icons.sports_tennis, size: 20,),
      width: 264,
      initialSelection: scheduleForm.endTime.value,
      inputDecorationTheme: InputDecorationTheme(
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        isDense: true
      ),
      onSelected: (value) {
        ref.read(scheduleFormProvider.notifier).onEndTimeChanged(value!);
      },

      dropdownMenuEntries: scheduleEndTimeEntries.map((time) {
        return DropdownMenuEntry(value: time, label: '$time hora${time > 1 ? 's' : ''}');
      }).toList()
      );
  }
}

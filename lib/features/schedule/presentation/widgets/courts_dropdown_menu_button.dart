import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';

class CourtsDropDownMenuButton extends ConsumerWidget {
  final List<Court> courts;
  const CourtsDropDownMenuButton({super.key, required this.courts});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCourt = ref.watch(scheduleFormProvider).court;
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.onBackground));
    return DropdownMenu<Court>(
      leadingIcon: const Icon(Icons.sports_tennis, size: 20,),
      width: 264,
      initialSelection: selectedCourt,
      inputDecorationTheme: InputDecorationTheme(
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        isDense: true
      ),
      onSelected: (value) {
        ref.read(scheduleFormProvider.notifier).onCourtSelectChange(value!);
      },

      dropdownMenuEntries: courts.map((court) {
        return DropdownMenuEntry(value: court, label: 'Cancha ${court.name}');
      }).toList()
      );
  }
}

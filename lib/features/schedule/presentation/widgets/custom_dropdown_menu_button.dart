import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/domain/domain.dart';
import 'package:tennis_court/features/schedule/presentation/presentation.dart';

class CustomDropDownMenuButton extends ConsumerWidget {
  final List<Court> courts;
  const CustomDropDownMenuButton({super.key, required this.courts});

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



/* 

DropdownButtonFormField<Court>(
      
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.sports_tennis_sharp,
            size: 20,
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border),
      borderRadius: BorderRadius.circular(4),
      isDense: true,
      value: selectedIndex,
      items: courts.map((court) {
        return DropdownMenuItem<Court>(
            value: court, child: Text('Cancha: ${court.name}'));
      }).toList(),
      onChanged: (value) {
        selectedIndex = value!;
      },
    );
 */
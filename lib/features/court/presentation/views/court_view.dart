import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tennis_court/features/court/presentation/providers/court_provider.dart';
import 'package:tennis_court/shared/widgets/custom_button.dart';

class CourtView extends ConsumerWidget {
  final String courtId;
  const CourtView({super.key, required this.courtId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final court = ref.watch(courtProvider(courtId)).court;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancha: ${court?.name ?? 'Cancha no encontrada'}')
      ),
      body:  SafeArea(
        child: Center(
          child: Column(
          children: [
            const Text('Agenda de la cancha'),

            Expanded(child: Container(
                // TODO: listview de las agendas de la cancha

            )),
            CustomButton(text: 'Nueva agenda', onPressed: (){})
          ],
                ),
        )),
    );
  }
}
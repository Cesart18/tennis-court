import 'package:flutter/material.dart';

class CourtCard extends StatefulWidget {
  final String courtName;
  const CourtCard({super.key, required this.courtName});

  @override
  State<CourtCard> createState() => _CourtCardState();
}

class _CourtCardState extends State<CourtCard> {

  double xd = 2;
  double yd = 2;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTapUp: (value) {
        setState(() {
          xd = 2;
          yd = 2;
        });
      },
      onTapDown: (details) {
        setState(() {
          xd = 0;
          yd = 0;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colors.onBackground
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow:  [
             BoxShadow(
              color: colors.onBackground,
              offset: Offset(xd, yd)
             )
          ],
          color: colors.background
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             Text('Cancha:',
            style: TextStyle(
              color: colors.onBackground
            ),),
            const SizedBox(height: 10,),
            Text(widget.courtName,
            style: TextStyle(
              color: colors.onBackground
            ),)
          ],
        ),
      ),
    );
  }
}
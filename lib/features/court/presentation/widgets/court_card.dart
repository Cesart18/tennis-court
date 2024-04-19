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
    return InkWell(
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
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          boxShadow:  [
             BoxShadow(
              color: Colors.black,
              offset: Offset(xd, yd)
             )
          ],
          color: Colors.white
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Cancha:'),
            const SizedBox(height: 10,),
            Text(widget.courtName)
          ],
        ),
      ),
    );
  }
}
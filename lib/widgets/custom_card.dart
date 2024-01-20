import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openion/data/data.dart';

class CustomCard extends StatefulWidget {
  final int index;
  final VoidCallback onPressed;
  const CustomCard({super.key, required this.index , required this.onPressed});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Card(
        elevation: 10,
        surfaceTintColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.pending_actions_rounded,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NotesClass.data[widget.index][0],
                    style: GoogleFonts.varelaRound(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  ),
                  Text(
                    NotesClass.data[widget.index][1],
                    style: GoogleFonts.varelaRound(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 40,
              height: 50,
              child: IconButton(
                icon:const Icon(Icons.delete),
                color: Colors.red.shade400,
                onPressed: widget.onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

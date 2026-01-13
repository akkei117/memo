import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memo/pages/memocard.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Background
        backgroundColor: Colors.grey[900],

        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          centerTitle: true,
          title: Text(
            "Memo",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: .w600,
              color: Colors.white,
            ),
          ),

          leading: Icon(Icons.record_voice_over, size: 30, color: Colors.white),


        ),

        body: ListView(
          children: [
            Memocard(),
          ],
        ),
      ),
    );
  }
}

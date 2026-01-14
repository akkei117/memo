import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memo/components/model.dart';

class Memopage extends StatefulWidget {
  Model modelObject;
  Memopage({super.key, required this.modelObject});

  @override
  State<Memopage> createState() => _MemopageState();
}

class _MemopageState extends State<Memopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.modelObject.title,
              style: GoogleFonts.baloo2(
                fontSize: 50,
                fontWeight: .w500,
                color: Colors.grey[100],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Divider(color: Colors.white),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Text(
              widget.modelObject.body ?? "",
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: .w500,
                color: Colors.grey[200],
              ), 
            ),
          ),
        ],
      ),
    );
  }
}

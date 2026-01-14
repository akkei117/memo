import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memo/components/model.dart';
import 'package:memo/pages/memocard.dart';
import 'package:memo/pages/memopage.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  List<Model> memolist = [
    Model(body: "body1", title: "title1"),
    Model(body: "body2", title: "title2"),
    Model(body: "body3", title: "title3"),
    Model(body: "body4", title: "title4"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Background
        backgroundColor: Colors.grey[900],

        //App bar
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

        body: ListView.builder(
          itemCount: memolist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Memopage(modelObject: memolist[index]),
                  ),
                );
              },
              child: Memocard(modelobject: memolist[index]),
            );
          },
        ),

        floatingActionButton: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[600],
            ),
            height: 70,
            width: 70,
            child: Icon(Icons.add, color: Colors.grey[200], size: 40),
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memo/components/model.dart';
import 'package:memo/pages/memopage.dart';

class Memocard extends StatelessWidget {

  Model modelobject;
  Memocard({super.key , required this.modelobject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Memopage(modelObject: modelobject)));
                },
              
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        modelobject.title,
                        // "controller data",
                        style: GoogleFonts.baloo2(
                          fontSize: 30,
                          fontWeight: .w500,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                    //Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: const Color.fromRGBO(255, 255, 255, 0.8),
                        endIndent: 10,
                      ),
                    ),
                
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Text(
                        modelobject.body ?? " ",
                        // "Content controller data",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: .w500,
                          color: Colors.white,
                        ),
                        overflow: .ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.delete, color: Colors.redAccent, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

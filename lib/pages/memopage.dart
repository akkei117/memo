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
  //the main to control wether the page is in editing mode
  bool isEditing = false;

  //controllers
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = .new(text: widget.modelObject.title);
    contentController = .new(text: widget.modelObject.body);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          widget.modelObject.title = titleController.text;
          widget.modelObject.body = contentController.text;
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[600],
          ),
          height: 70,
          width: 70,
          child: Icon(Icons.save, color: Colors.grey[200], size: 40),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      backgroundColor: Colors.grey[900],

      appBar: AppBar(
        backgroundColor: Colors.grey[850],

        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.grey[200],),
          onPressed: () {
            widget.modelObject.title = titleController.text;
            widget.modelObject.body = contentController.text;

            Navigator.pop(context, true);
            print("Back pressed");
          },
        ),

        actions: [
          Padding(
            padding: EdgeInsetsGeometry.all(1),
            child: Text(
              "View",
              style: TextStyle(color: Colors.grey[300], fontSize: 20),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Switch(
              value: isEditing,
              onChanged: (value) {
                setState(() {
                  isEditing = value;
                  widget.modelObject.title = titleController.text;
                  widget.modelObject.body = contentController.text;
                });
              },
              activeThumbColor: Colors.grey[200],
              inactiveThumbColor: Colors.grey[600],
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(left: 1, right: 10),
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.grey[300], fontSize: 20),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: isEditing
                ? TextField(
                    controller: titleController,
                    style: GoogleFonts.baloo2(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[100],
                    ),
                    maxLines: null, // important for notes
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  )
                : Text(
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
            child: isEditing
                ? TextField(
                    controller: contentController,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[200],
                    ),
                    maxLines: null, // important for notes
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  )
                : Text(
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

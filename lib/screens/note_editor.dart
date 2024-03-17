import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_notes/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteEditorScreen extends StatelessWidget {
  NoteEditorScreen(
      {super.key,
      required this.contentControler,
      required this.titleController});

  TextEditingController titleController = TextEditingController();
  TextEditingController contentControler = TextEditingController();
  String date = DateFormat('dd.MM.yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloors.cardColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Coloors.cardColor,
        elevation: 0,
        title: Text(
          "Add a new note",
          style: TextStyle(color: Coloors.accentColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note title here",
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              style: Coloors.mainTitle,
              controller: titleController,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: Coloors.dateTitle,
            ),
            const SizedBox(
              height: 28,
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note here!",
                  hintStyle: TextStyle(color: Colors.grey[700])),
              style: Coloors.mainContent,
              controller: contentControler,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Coloors.accentColor,
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        onPressed: () async {
          if (titleController.text.isNotEmpty &&
              contentControler.text.isNotEmpty) {
            await FirebaseFirestore.instance.collection("notes").add(
              {
                "main_content": contentControler.text,
                "note_title": titleController.text,
                "creation_date": date
              },
            ).then(
              (value) {
                print(value.id);
                Navigator.pop(context);
              },
            ).catchError(
              (error) => print("Failed to add new note due to $error"),
            );
          } else {
            return showAboutDialog(
              context: context,
              children: [
                Text("Hata"),
              ],
            );
          }
        },
      ),
    );
  }
}

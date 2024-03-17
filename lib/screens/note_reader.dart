import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_notes/constants/color.dart';
import 'package:flutter/material.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {super.key}) {
    super.key;
  }
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Coloors.cardColor,
        appBar: AppBar(
          backgroundColor: Coloors.cardColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc["note_title"],
                style: Coloors.mainTitle,
              ),
              const SizedBox(height: 10),
              Text(
                widget.doc["creation_date"],
                style: Coloors.dateTitle,
              ),
              const SizedBox(height: 10),
              Text(
                widget.doc["main_content"],
                style: Coloors.mainContent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

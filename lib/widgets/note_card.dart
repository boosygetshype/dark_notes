import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_notes/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Coloors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(doc["note_title"],
              style: Coloors.mainTitle, overflow: TextOverflow.ellipsis),
        ],
      ),
    ),
  );
}

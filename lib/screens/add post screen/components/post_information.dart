// lib/screens/add_post_screen/components/caption_input_row.dart

import 'dart:io';

import 'package:flutter/material.dart';

class CaptionInputRow extends StatelessWidget {
  final File file;
  final TextEditingController captionController;

  const CaptionInputRow({
    super.key,
    required this.file,
    required this.captionController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(file),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          width: 200,
          height: 60,
          child: TextField(
            controller: captionController,
            decoration: const InputDecoration(
              hintText: 'Write a caption',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

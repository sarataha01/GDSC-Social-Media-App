import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    super.key,
    required File? file,
  }) : _file = file;

  final File? _file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      width: double.infinity,
      child: Image.file(
        _file!,
        fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SelectImagePrompt extends StatelessWidget {
  const SelectImagePrompt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      color: Colors.grey[200],
      child: const Center(child: Text('Select an image')),
    );
  }
}

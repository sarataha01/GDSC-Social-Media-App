import 'dart:io';

import 'package:flutter/material.dart';

class MediaGridView extends StatelessWidget {
  final List<Widget> mediaList;
  final List<File> path;
  final ValueChanged<File> onMediaSelected;

  const MediaGridView({
    super.key,
    required this.mediaList,
    required this.path,
    required this.onMediaSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: mediaList.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 2,
              ),
              itemCount: mediaList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onMediaSelected(path[index]);
                  },
                  child: mediaList[index],
                );
              },
            )
          : const Center(child: Text('No media available')),
    );
  }
}

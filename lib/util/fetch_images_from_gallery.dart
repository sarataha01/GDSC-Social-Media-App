import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

Future<void> fetchNewMedia({
  required BuildContext context,
  required int currentPage,
  required List<Widget> mediaList,
  required List<File> pathList,
  required void Function(File) onFileSelected,
}) async {
  final PermissionState ps = await PhotoManager.requestPermissionExtend();
  if (ps.isAuth) {
    List<AssetPathEntity> album = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );
    if (album.isNotEmpty) {
      List<AssetEntity> media = await album[0].getAssetListPaged(
        page: currentPage,
        size: 60,
      );

      List<Widget> temp = [];
      for (var asset in media) {
        if (asset.type == AssetType.image) {
          final file = await asset.file;
          if (file != null) {
            pathList.add(File(file.path));
            onFileSelected(File(file.path));
          }

          temp.add(
            FutureBuilder(
              future:
                  asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          );
        }
      }
      mediaList.addAll(temp);
    }
  } else {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Permission needed'),
          content:
              const Text('This app needs photo access to function properly.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

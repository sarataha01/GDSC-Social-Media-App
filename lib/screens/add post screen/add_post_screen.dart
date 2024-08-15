import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/components/back_button.dart';
import '../../core/utils/fetch_images_from_gallery.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../add text to post screen/add_text_to_post.dart';
import 'components/new_post_section.dart';
import 'components/recents_section.dart';
import 'components/select_image_prompt.dart';
import 'widgets/display_image.dart';
import 'widgets/media_grid_view.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final List<Widget> _mediaList = [];
  final List<File> path = [];
  File? _file;
  int currentPage = 0;
  int? lastPage;

  @override
  void initState() {
    super.initState();
    fetchNewMedia(
      context: context,
      currentPage: currentPage,
      mediaList: _mediaList,
      pathList: path,
      onFileSelected: (file) {
        setState(() {
          _file = file;
          currentPage++;
        });
      },
    );
  }

  int indx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              leading: const CustomBackButton(),
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: NewPostSection(
                  onPressed: () {
                    if (_file != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddTextToPost(_file!),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Error: no media selected')),
                      );
                    }
                  },
                  text: 'Next',
                ),
              ),
            ),
            _file != null
                ? DisplayImage(file: _file)
                : const SelectImagePrompt(),
            const RecentSection(),
            MediaGridView(
              mediaList: _mediaList,
              path: path,
              onMediaSelected: (file) {
                setState(() {
                  _file = file;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

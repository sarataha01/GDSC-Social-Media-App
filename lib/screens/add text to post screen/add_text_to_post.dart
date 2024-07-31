import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/screens/add%20post%20screen/components/back_button.dart';
import 'package:gdsc_social_media_app/screens/add%20post%20screen/components/new_post_section.dart';
import 'package:gdsc_social_media_app/screens/shared%20widgets/custom_app_bar.dart';
import 'package:gdsc_social_media_app/services/post_services.dart';

import '../add post screen/components/post_information.dart';

class AddTextToPost extends StatefulWidget {
  final File file;

  const AddTextToPost(this.file, {super.key});

  @override
  State<AddTextToPost> createState() => _AddTextToPostState();
}

class _AddTextToPostState extends State<AddTextToPost> {
  final TextEditingController _captionController = TextEditingController();
  bool _isLoading = false;

  void _handleCreatePost() async {
    setState(() {
      _isLoading = true;
    });

    await PostServices.createPost(
        context, widget.file, _captionController.text);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  MyAppBar(
                    leading: const CustomBackButton(),
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27.0),
                      child: NewPostSection(
                        onPressed: _handleCreatePost,
                        text: 'Share',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CaptionInputRow(
                      file: widget.file,
                      captionController: _captionController,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor '
            'incididunt ut labore et dolore magna aliqua. Ut enim ad'
            ' minim veniam, quis nostrud exercitation @Lorem laboris '
            'nisi ut aliquip ex ea commodo magna aliqua. Exercitation '
            'ullamco eiusmod tempor. lorem.com link  #Lorem #Ipsum'),
        //SvgPicture.asset(AssetData.logo2Path)
      ],
    );
  }
}

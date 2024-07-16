import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CircularButton extends StatelessWidget {
  final Icon icon;
  const CircularButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: ColorApp.secondMainApp,
      child: ClipOval(
        child: Container(
          width: 40.0,
          height: 40.0,
          color: ColorApp.buttonColor,
          child: IconButton(
              onPressed: () {}, padding: EdgeInsets.zero, icon: icon),
        ),
      ),
    );
  }
}

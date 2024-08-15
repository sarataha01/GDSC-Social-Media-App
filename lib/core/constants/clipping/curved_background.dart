import 'package:flutter/material.dart';

import '../colors.dart';
import 'clippers.dart';

class CurvedBackground extends StatelessWidget {
  final Widget child;
  const CurvedBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppBarClipper(),
      child: Container(
        color: ColorApp.mainApp,
        width: double.infinity,
        child: child,
      ),
    );
  }
}

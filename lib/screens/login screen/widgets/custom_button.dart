import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final SvgPicture? svgIcon;
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    this.icon,
    this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgIcon != null
                ? svgIcon!
                : (icon != null
                    ? Icon(icon, color: textColor)
                    : const SizedBox.shrink()),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}

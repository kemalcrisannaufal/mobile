import 'package:flutter/material.dart';
import 'package:maenbal/app/common/theme/font.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ButtonStyle buttonStyle;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Center(
        child: Text(
          text,
          style: semiBoldText16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

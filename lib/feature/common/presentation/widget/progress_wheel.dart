import 'package:flutter/material.dart';

class ProgressWheel extends StatelessWidget {
  final double size;
  final Color color;
  final Color backgroundColor;
  final double? height;

  const ProgressWheel({super.key, this.size = 50, this.color = Colors
      .red, this.backgroundColor = Colors.lightGreenAccent, this.height});

  @override
  Widget build(BuildContext context) =>
      SizedBox(
        height: height,
        child: Center(
          child: SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              color: color,
              backgroundColor: backgroundColor,
              strokeWidth: 0.15 * size,
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';

class EmptyBox extends StatelessWidget {
  final String message;

  const EmptyBox({super.key, required this.message});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.orange),
        ),
      );
}

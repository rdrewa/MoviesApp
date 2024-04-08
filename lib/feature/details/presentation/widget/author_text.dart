import 'package:flutter/material.dart';

class AuthorText extends StatelessWidget {
  final String author;

  const AuthorText({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: Text('[~ $author]'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/di.dart';
import 'app/movie_app.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  initDependencies();
  runApp(const MovieApp());
}

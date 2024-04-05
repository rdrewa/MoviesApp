import 'package:hive_flutter/hive_flutter.dart';

import '../domain/model/movie.dart';

class HiveDatabase {
  HiveDatabase._();

  static void initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieAdapter());
    Hive.openBox<Movie>(Movie.table);
  }
}
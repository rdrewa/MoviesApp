import 'package:hive/hive.dart';

import '../../../domain/model/movie.dart';

class WatchService {

  late final Box _box;

  WatchService(String table) : _box = Hive.box<Movie>(table);

  Future<List<Movie>> getList() async => _box.values.toList() as List<Movie>;

  Future<void> addItem(Movie item) async => await _box.put(item.key, item);

  Future<void> removeItem(Movie item) async => await _box.delete(item.key);

  Future<Movie?> getItem(int id) async => await _box.get(id);

  Future<void> clear() async => await _box.clear();
}
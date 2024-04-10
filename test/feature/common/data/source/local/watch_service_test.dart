import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'dart:io';

import 'package:movies_app/feature/common/data/source/local/watch_service.dart';
import 'package:movies_app/feature/common/domain/model/movie.dart';

import '../../../../../util/data.dart';

void main() {
  late WatchService watchService;

  setUpAll(() async {
    Hive.init(Directory.systemTemp.createTempSync().path);
    Hive.registerAdapter(MovieAdapter());
    await Hive.openBox<Movie>('test');
  });

  setUp(() {
    watchService = WatchService('test');
  });

  test('Should add and get item', () async {
    // arrange
    await watchService.addItem(testMovie1);

    // act
    final results = await watchService.getList();

    // assert
    expect(results.first, testMovie1);
  });

  test('Should remove item', () async {
    // arrange
    await watchService.addItem(testMovie1);

    // act
    await watchService.removeItem(testMovie1);
    final results = await watchService.getList();

    // assert
    expect(results.isEmpty, true);
  });

  tearDown(() async {
    await watchService.clear();
  });
}

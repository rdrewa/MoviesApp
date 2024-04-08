import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../core/util/language_util.dart';
import '../feature/common/data/hive_database.dart';
import 'app/di.dart';
import 'app/movie_app.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  HiveDatabase.initHive();
  initDependencies();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: LanguageUtil.supportedLocales,
      path: 'assets/i18n',
      fallbackLocale: LanguageUtil.locale,
      startLocale: LanguageUtil.locale,
      useOnlyLangCode: true,
      child: const MovieApp()));
}

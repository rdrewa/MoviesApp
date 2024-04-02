import 'package:movies_app/app/config.dart';

extension StringImageExtension on String {
  String get imageW1280 => '${Config.imageW1280}$this';

  String get imageW500 => '${Config.imageW500}$this';

  String get imageW300 => '${Config.imageW300}$this';

  String get imageW185 => '${Config.imageW185}$this';
}

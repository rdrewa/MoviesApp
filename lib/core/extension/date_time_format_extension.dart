import 'package:easy_localization/easy_localization.dart';

extension DateTimeFormatExtenions on DateTime {

  String get dotDate => DateFormat('yyyy.MM.dd').format(this);

  String get dashDate => DateFormat('yyyy-MM-dd').format(this);

}
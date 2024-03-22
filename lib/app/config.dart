import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final apiUrl = dotenv.env['API_URL']!;
  static final apiToken = dotenv.env['API_TOKEN']!;
}

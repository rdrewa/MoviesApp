import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final apiUrl = dotenv.env['API_URL']!;
  static final apiToken = dotenv.env['API_TOKEN']!;

  static const imageW1280 = 'https://image.tmdb.org/t/p/w1280'; // backdrop
  static const imageW500 = 'https://image.tmdb.org/t/p/w500';  // poster, still
  static const imageW300 = 'https://image.tmdb.org/t/p/w300';  // profile
  static const imageW185 = 'https://image.tmdb.org/t/p/w185';  // avatar
}

class MovieUtil {
  static Object readOriginalTitle(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['original_name'] ?? '');

  static Object readReleaseDate(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['first_air_date'] ?? '');

  static Object readTitle(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['name'] ?? '');

  static DateTime? parseReleasedDate(String releaseDate) =>
      releaseDate.isNotEmpty ? DateTime.parse(releaseDate) : null;
}
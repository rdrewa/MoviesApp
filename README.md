# MoviesApp

A simple app to demonstrate Clean Architecture with REST and [Bloc](https://bloclibrary.dev/) state management.\
A codename for this project is **MBA** and it is used as a prefix for tasks, commits & branches. Tasks are Git issues.

## Implementation Details:

- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependencies**: [get_it](https://pub.dev/packages/get_it)
- **Network**: [retrofit](https://pub.dev/packages/retrofit), [dio](https://pub.dev/packages/dio)
- **Navigation**: [go_router](https://pub.dev/packages/go_router)
- **Environment variables**: [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) (loaded)
- **Error handling**: [dartz](https://pub.dev/packages/dartz), [FP](https://medium.com/nerd-for-tech/better-error-handling-with-either-type-in-dart-b91bef20d716)
- **Serialization**: [json_serialization](https://pub.dev/packages/json_serialization)
- **Persistence**: [hive](https://pub.dev/packages/hive), [hive_flutter](https://pub.dev/packages/hive_flutter)
- **Unions/pattern-matching etc.**: [freezed](https://pub.dev/packages/freezed)
- **Comparing**: [equatable](https://pub.dev/packages/equatable)
- **Localization**: [easy_localization](https://pub.dev/packages/easy_localization)
- **Mocking**: [mocktail](https://pub.dev/packages/mocktail)
- **Testing**: [flutter_test](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html), [bloc_test](https://pub.dev/packages/bloc_test)
- **File generator**: [build_runner](https://pub.dev/packages/build_runner)
- **Image caching**: [cached_network_image](https://pub.dev/packages/cached_network_image)
- **Fonts**: [google_fonts](https://pub.dev/packages/google_fonts)
- **Theme**: light & dark (**system** choice)
- **Color Scheme**: Randomly generated by [Material Theme Builder](https://m3.material.io/theme-builder#/custom)

## Screenshots
### iOS screenshots
| Home #1 | Home #2 | Now #3  | Watch #4 | Watch #5 | Details #6 | Details #7 |
|---------|---------|---------|----------|----------|------------|------------|
| ![][31] | ![][32] | ![][33] | ![][34]  | ![][35]  | ![][36]    | ![][37]    |
| ![][41] | ![][42] | ![][43] | ![][44]  | ![][45]  | ![][46]    | ![][47]    |

### Android Screenshots
| Home #1 | Home #2 | Now #3  | Watch #4 | Watch #5 | Details #6 | Details #7 |
|---------|---------|---------|----------|----------|------------|------------|
| ![][11] | ![][12] | ![][13] | ![][14]  | ![][15]  | ![][16]    | ![][17]    |
| ![][21] | ![][22] | ![][23] | ![][24]  | ![][25]  | ![][26]    | ![][27]    |


## Installation

- Clone the repo
  ```sh
  git clone https://github.com/rdrewa/MoviesApp.git
  ```
- In root project directory crearte `.env` file. Put content below.
  ![][00]
 ```sh
  API_TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMmYxMDgwOTBiOGU4OGZlN2NmODU2OTQ4YTM1OWNiOCIsInN1YiI6IjVmYmQwMTFhMTc1MDUxMDA0MTBmNDZkZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8TLSXNXuLQb2hRtoQfF438Y-5KnuPNqk4lJbghfeWWg
  ```
- And then we can use the normal build and run procedure
  ```sh
  flutter pub get
  flutter run
  ```
- Some files like `*.freezed.dart`, `*.g.dart`, `*.gr.dart` are auto generated. Usally those files should be added to `.gitignore`. Just run this command to regenerate them.
  ```sh
  dart pub run build_runner watch --delete-conflicting-outputs
  ```
  

# Folder (package) structure
```bash
├── lib
│   ├── app
│   │   ├── app_router.dart
│   │   ├── app_routes.dart
│   │   ├── config.dart
│   │   ├── di.dart
│   │   └── movie_app.dart
│   ├── core
│   │   ├── error
│   │   │   └── failure.dart
│   │   ├── extension
│   │   │   ├── build_context_theme_extension.dart
│   │   │   ├── date_time_format_extension.dart
│   │   ├── interceptor
│   │   │   └── token_interceptor.dart
│   │   ├── util
│   │   │   └── language_util.dart
│   ├── feature
│   │   ├── common
│   │   ├── details
│   │   ├── home
│   │   │   ├── data
│   │   │   │   ├── model/
│   │   │   │   ├── repository/
│   │   │   │   └── source/
│   │   │   │       ├── local/
│   │   │   │       └── remote/
│   │   │   ├── domain/
│   │   │   │   ├── model/
│   │   │   │   ├── repository/
│   │   │   │   └── usecase/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── screen/
│   │   │       └── widget/
│   │   ├── now/
│   │   └── watch/
│   ├── theme/
│   │   ├── app_app_bar_theme.dart
│   │   ├── app_bottom_bar_theme.dart
│   │   ├── app_color_theme.dart
│   │   ├── app_tab_bar_theme.dart
│   │   ├── app_text_theme.dart
│   │   └── app_theme.dart
├── test
│   ├── feature/
│   │   ├── [feature-name]/
│   │   │   ├── data/
│   │   │   │   ├── model/
│   │   │   │   ├── repository/
│   │   │   │   └── source/
│   │   │   │       ├── local/
│   │   │   │       └── remote/
│   │   │   ├── domain
│   │   │   │   ├── model/
│   │   │   │   ├── repository/
│   │   │   │   └── usecase/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       └── screen/
│   ├── fixture/
│   └── util/
├── ...
└── .
```
It is not exact folders hierarchy. In feature some folder can be omitted, because some classes are shared and placed in common.


[00]: screenshots/env.png
[11]: screenshots/android/light/android-light-01_home.png
[12]: screenshots/android/light/android-light-02_home.png
[13]: screenshots/android/light/android-light-03_now.png
[14]: screenshots/android/light/android-light-04_watch.png
[15]: screenshots/android/light/android-light-05_watch.png
[16]: screenshots/android/light/android-light-06_details.png
[17]: screenshots/android/light/android-light-07_details.png

[21]: screenshots/android/dark/android-dark-01_home.png
[22]: screenshots/android/dark/android-dark-02_home.png
[23]: screenshots/android/dark/android-dark-03_now.png
[24]: screenshots/android/dark/android-dark-04_watch.png
[25]: screenshots/android/dark/android-dark-05_watch.png
[26]: screenshots/android/dark/android-dark-06_details.png
[27]: screenshots/android/dark/android-dark-07_details.png

[31]: screenshots/ios/light/ios-light-01_home.png
[32]: screenshots/ios/light/ios-light-02_home.png
[33]: screenshots/ios/light/ios-light-03_now.png
[34]: screenshots/ios/light/ios-light-04_watch.png
[35]: screenshots/ios/light/ios-light-05_watch.png
[36]: screenshots/ios/light/ios-light-06_details.png
[37]: screenshots/ios/light/ios-light-07_details.png

[41]: screenshots/ios/dark/ios-dark-01_home.png
[42]: screenshots/ios/dark/ios-dark-02_home.png
[43]: screenshots/ios/dark/ios-dark-03_now.png
[44]: screenshots/ios/dark/ios-dark-04_watch.png
[45]: screenshots/ios/dark/ios-dark-05_watch.png
[46]: screenshots/ios/dark/ios-dark-06_details.png
[47]: screenshots/ios/dark/ios-dark-07_details.png
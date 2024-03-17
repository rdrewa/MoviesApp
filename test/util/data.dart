import 'package:movies_app/feature/common/domain/model/movie.dart';

final testMovie1 = Movie(
    adult: false,
    backdropPath: '/8uVKfOJUhmybNsVh089EqLHUYEG.jpg',
    genreIds: const [878, 12],
    id: 693134,
    originalLanguage: 'en',
    originalTitle: 'Dune: Part Two',
    overview:
        'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.',
    popularity: 1054.137,
    posterPath: '/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg',
    releaseDate: DateTime.parse('2024-02-27'),
    title: 'Dune: Part Two',
    video: false,
    voteAverage: 8.398,
    voteCount: 1725);

final testMovie2 = Movie(
    adult: false,
    backdropPath: '/imlTCObfzISogbvcwB1dokoXAIc.jpg',
    genreIds: const [10765, 10759, 18],
    id: 82452,
    originalLanguage: 'en',
    originalTitle: 'Avatar: The Last Airbender',
    overview:
        'A young boy known as the Avatar must master the four elemental powers to save a world at war — and fight a ruthless enemy bent on stopping him.',
    popularity: 878.119,
    posterPath: '/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg',
    releaseDate: DateTime.parse('2024-02-27'),
    title: 'Avatar: The Last Airbender',
    video: false,
    voteAverage: 8.101,
    voteCount: 503);

final testMovies = [testMovie1, testMovie2];

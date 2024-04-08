import 'package:movies_app/feature/common/data/model/movie_response.dart';
import 'package:movies_app/feature/common/domain/model/movie.dart';
import 'package:movies_app/feature/details/data/model/review_response.dart';
import 'package:movies_app/feature/details/domain/model/author_details.dart';
import 'package:movies_app/feature/details/domain/model/cast.dart';
import 'package:movies_app/feature/details/domain/model/credits.dart';
import 'package:movies_app/feature/details/domain/model/genre.dart';
import 'package:movies_app/feature/details/domain/model/movie_details.dart';
import 'package:movies_app/feature/details/domain/model/review.dart';
import 'package:movies_app/feature/now/domain/model/movie_now.dart';
import 'package:movies_app/feature/now/domain/model/picture.dart';
import 'package:movies_app/feature/now/domain/model/pictures.dart';

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
    posterPath: '/lzZpWEaqzP0qVA5nkCc5ASbNcSy.jpg',
    releaseDate: DateTime.parse('2024-02-22'),
    title: 'Avatar: The Last Airbender',
    video: false,
    voteAverage: 8.101,
    voteCount: 504);

final testMovies = [testMovie1, testMovie2];

const testGenre1 = Genre(id: 12, name: 'Adventure');
const testGenre2 = Genre(id: 878, name: 'Science Fiction');

const testCast1 = Cast(
    adult: false,
    gender: 2,
    id: 10297,
    knownForDepartment: 'Acting',
    name: 'Matthew McConaughey',
    originalName: 'Matthew McConaughey',
    popularity: 1.4,
    profilePath: '/e9ZHRY5toiBZCIPEEyvOG9A8ers.jpg',
    castId: 9,
    character: 'Joseph "Coop" Cooper',
    creditId: '52fe4bbf9251416c910e47cb',
    order: 0);

const testCast2 = Cast(
    adult: false,
    gender: 1,
    id: 1813,
    knownForDepartment: 'Acting',
    name: 'Anne Hathaway',
    originalName: 'Anne Hathaway',
    popularity: 1.4,
    profilePath: '/yxonUjheNliiwkXKsy6BTONtyCx.jpg',
    castId: 169,
    character: 'Dr. Amelia Brand',
    creditId: '57fe146fc3a368504a00261e',
    order: 1);

const testCast3 = Cast(
    adult: false,
    gender: 2,
    id: 525,
    knownForDepartment: 'Directing',
    name: 'Christopher Nolan',
    originalName: 'Christopher Nolan',
    popularity: 1.4,
    profilePath: '/xuAIuYSmsUzKlUMBFGVZaWsY3DZ.jpg',
    creditId: "5e83abfad236e60017fd99ed",
    department: 'Directing',
    job: 'Director');

const testCredits = Credits(cast: [testCast1, testCast2], crew: [testCast3]);

const testAuthorDetails1 = AuthorDetails(
    name: 'Reno',
    username: 'Rangan',
    avatarPath: '/6ZpVUJzqXMzH35VprEtnX0sNI3.jpg',
    rating: 9);

final testReview1 = Review(
    author: 'Reno',
    authorDetails: testAuthorDetails1,
    content:
        'Well, one off from two of this year\'s most expected movies alongside \'The Battle of Five Armies\'. Like all the Chris Nolan fans, I was equally excited to see the movie on the opening day opening show. But I slightly disappointed that it was not a digital 3D film. I agree, this science-fiction was more dramatized than usual space travel stories does with an adventure-thriller. Almost a 3 hour long stretch movie did not waste much time to take us to the core of the story.',
    createdAt: DateTime.parse('2014-11-12T16:06:04.927Z'),
    id: '5463856c0e0a267815002598',
    updatedAt: DateTime.parse('2021-06-23T15:57:30.674Z'),
    url: 'https://www.themoviedb.org/review/5463856c0e0a267815002598');

final testSimilar1 = Movie(
    adult: false,
    backdropPath: '/sODk4VuMTt8S56zYFOr1Kx8BFqu.jpg',
    genreIds: const [28, 53, 878, 12],
    id: 95,
    originalLanguage: 'en',
    originalTitle: 'Armageddon',
    overview:
        'When an asteroid threatens to collide with Earth, NASA honcho Dan Truman determines the only way to stop it is to drill into its surface and detonate a nuclear bomb. This leads him to renowned driller Harry Stamper, who agrees to helm the dangerous space mission provided he can bring along his own hotshot crew. Among them is the cocksure A.J. who Harry thinks isn\'t good enough for his daughter, until the mission proves otherwise.',
    popularity: 61.064,
    posterPath: '/eTM3qtGhDU8cvjpoa6KEt5E2auU.jpg',
    releaseDate: DateTime.parse('1998-07-01'),
    title: 'Armageddon',
    video: false,
    voteAverage: 6.836,
    voteCount: 7585);

final testMovieDetails = MovieDetails(
    adult: false,
    backdropPath: '/xJHokMbljvjADYdit5fK5VQsXEG.jpg',
    id: 157336,
    originalLanguage: 'en',
    originalTitle: 'Interstellar',
    overview:
        'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.',
    popularity: 167.232,
    posterPath: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    releaseDate: DateTime.parse('2014-11-05'),
    title: 'Interstellar',
    video: false,
    voteAverage: 8.431,
    voteCount: 33934,
    genres: const [testGenre1, testGenre2],
    credits: testCredits,
    reviewsData: ReviewResponse(
        page: 1, results: [testReview1], totalPages: 1, totalResults: 1),
    similarData: MovieResponse(
        page: 1, results: [testSimilar1], totalPages: 1, totalResults: 1),
    recommendationsData: MovieResponse(
        page: 1, results: [testSimilar1], totalPages: 1, totalResults: 1));

const testPicture1backdrop = Picture(
    aspectRatio: 1.778,
    height: 2160,
    iso: 'en',
    filePath: '/bmlkLCjrIWnnZzdAQ4uNPG9JFdj.jpg',
    voteAverage: 5.384,
    voteCount: 2,
    width: 3840);

const testPicture2logo = Picture(
    aspectRatio: 1.672,
    height: 1298,
    iso: 'en',
    filePath: '/4MdzluUXHjgVRwRRNh5vSPq0TB5.png',
    voteAverage: 5.312,
    voteCount: 1,
    width: 2170);

const testPicture3poster = Picture(
    aspectRatio: 0.667,
    height: 3000,
    iso: 'en',
    filePath: '/qhb1qOilapbapxWQn9jtRCMwXJF.jpg',
    voteAverage: 5.372,
    voteCount: 37,
    width: 2000);

const testPicture4poster = Picture(
    aspectRatio: 0.667,
    height: 2100,
    iso: 'zh',
    filePath: '/iBh9D95rKBj3cbUM2gYIL0NLW57.jpg',
    voteAverage: 5.586,
    voteCount: 7,
    width: 1400);

const testPictures = Pictures(
    backdrops: [testPicture1backdrop],
    logos: [testPicture2logo],
    posters: [testPicture3poster, testPicture4poster]);

final testMovie3 = Movie(
    adult: false,
    backdropPath: '/yyFc8Iclt2jxPmLztbP617xXllT.jpg',
    id: 787699,
    originalLanguage: 'en',
    originalTitle: 'Wonka',
    overview:
        'Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.',
    popularity: 603.503,
    posterPath: '/qhb1qOilapbapxWQn9jtRCMwXJF.jpg',
    releaseDate: DateTime.parse('2023-12-06'),
    title: 'Wonka',
    video: false,
    voteAverage: 7.215,
    voteCount: 2657);

final testMovieNow = MovieNow(
    adult: false,
    backdropPath: '/yyFc8Iclt2jxPmLztbP617xXllT.jpg',
    id: 787699,
    originalLanguage: 'en',
    originalTitle: 'Wonka',
    overview:
        'Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.',
    popularity: 603.503,
    posterPath: '/qhb1qOilapbapxWQn9jtRCMwXJF.jpg',
    releaseDate: DateTime.parse('2023-12-06'),
    title: 'Wonka',
    video: false,
    voteAverage: 7.215,
    voteCount: 2657,
    pictures: testPictures);

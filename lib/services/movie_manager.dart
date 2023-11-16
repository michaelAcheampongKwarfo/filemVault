// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MovieManager {
//   static const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
//   static const apiKey =
//       '48333897027df5085bac0a144d95eceb'; // Replace with your TMDb API key.

//   Future<List<dynamic>> getTrendingMovies() async {
//     List<dynamic> listResponse = [];
//     final trendingUrl =
//         'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';

//     try {
//       final response = await http.get(Uri.parse(trendingUrl));

//       if (response.statusCode == 200) {
//         final mapResponse = json.decode(response.body);
//         listResponse = mapResponse['results'];
//       } else {
//         // Handle error cases here, e.g., log the error or throw an exception.
//         throw Exception('Failed to load trending movies');
//       }
//     } catch (e) {
//       // Handle any exceptions that might occur during the request.
//       print('Error: $e');
//       throw Exception('Failed to load trending movies');
//     }

//     return listResponse;
//   }
// }

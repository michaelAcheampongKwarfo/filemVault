// ignore_for_file: prefer_const_declarations, prefer_interpolation_to_compose_strings

import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_vault/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  List listResponse = [];

  Future fetchTrendingMovies() async {
    final apiKey = '48333897027df5085bac0a144d95eceb';
    final trendingUrl =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';

    final response = await http.get(Uri.parse(trendingUrl));

    if (response.statusCode == 200) {
      final mapResponse = json.decode(response.body);
      listResponse = mapResponse['results'];
    }
  }

  @override
  void initState() {
    fetchTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchTrendingMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: listResponse.length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: AppColors.primaryColor,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500' +
                          listResponse[index]['poster_path'],
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: double.maxFinite,
                autoPlay: true,
                viewportFraction: 0.55,
                pageSnapping: true,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator(); // Show a loading indicator while fetching data.
        }
      },
    );
  }
}

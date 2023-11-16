// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_declarations

import 'package:film_vault/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({
    super.key,
  });

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  List listResponse = [];

  Future fetchTopRatedMoive() async {
    final apiKey = '48333897027df5085bac0a144d95eceb';
    final topRatedUrl =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';

    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final mapResponse = json.decode(response.body);
      listResponse = mapResponse['results'];
    }
  }

  @override
  void initState() {
    fetchTopRatedMoive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: fetchTopRatedMoive(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: double.maxFinite,
                      margin: const EdgeInsets.only(left: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.primaryColor,
                      ),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' +
                            listResponse[index]['poster_path'],
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              });
        },
        itemCount: listResponse.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

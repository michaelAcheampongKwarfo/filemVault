import 'package:film_vault/widgets/app_colors.dart';
import 'package:film_vault/widgets/app_text.dart';
import 'package:film_vault/widgets/top_rated.dart';
import 'package:film_vault/widgets/trending.dart';
import 'package:film_vault/widgets/upcoming.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Film Vault',
          fontSize: 20.0,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: const AppText(
                text: 'Trending Movies',
                fontSize: 18.0,
              ),
            ),
            const TrendingMovies(),
            Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.06,
              child: const AppText(
                text: 'Top Rated Movies',
                fontSize: 18.0,
              ),
            ),
            const TopRatedMovies(),
            Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.06,
              child: const AppText(
                text: 'Upcomming Movies',
                fontSize: 18.0,
              ),
            ),
            const UpcomingMovies(),
          ],
        ),
      ),
    );
  }
}

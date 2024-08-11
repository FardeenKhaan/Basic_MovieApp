import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Screen01 extends StatefulWidget {
  const Screen01({super.key});

  @override
  State<Screen01> createState() => _Screen01State();
}

class _Screen01State extends State<Screen01> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final apikey = '76b355fdbb48067ac6761d96827ff7e9';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NmIzNTVmZGJiNDgwNjdhYzY3NjFkOTY4MjdmZjdlOSIsIm5iZiI6MTcyMzI4OTEzNy4zODExNDMsInN1YiI6IjY2Yjc0ZDZlMGZiNDE0MmYwNjAzNmYwMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hzvEw2M_N5CvCzi6QmnVohHhzQ-YQW_onEZ9C54IcM0';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();
    print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresults['results'];
      tv = tvresults['results'];
    });
    print(tv);
  }

  @override
  void initState() {
    // TODO: implement initState
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie\'s App',
          style: GoogleFonts.aboreto(),
        ),
        foregroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          TrendingMovies(
            trending: trendingmovies,
          ),
          TopRatedMovies(toprated: topratedmovies),
          TV(tV: tv),
        ],
      ),
    );
  }
}

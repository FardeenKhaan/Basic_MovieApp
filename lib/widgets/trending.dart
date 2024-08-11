import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular TV Shows',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: trending[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launch_on: trending[index]
                                          ['release_date'],
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        // color: Colors.green,
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path']),
                                    fit: BoxFit.cover),
                              ),
                              height: 140,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Column(children: [
                                modified_text(
                                    size: 15,
                                    text: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : 'Loading'),
                                modified_text(
                                    text:
                                        trending[index]['release_date'] != null
                                            ? trending[index]['release_date']
                                            : 'loading'),
                              ]),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );

    // Container(
    //   padding: EdgeInsets.all(10),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       modified_text(
    //         text: 'Trending Movies',
    //       ),
    //       SizedBox(height: 10),
    //       Container(
    //           height: MediaQuery.of(context).size.height * 0.40,
    //           child: ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: trending.length,
    //               itemBuilder: (context, index) {
    //                 return InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => Description(
    //                                   name: trending[index]['title'],
    //                                   bannerurl:
    //                                       'https://image.tmdb.org/t/p/w500' +
    //                                           trending[index]['backdrop_path'],
    //                                   posterurl:
    //                                       'https://image.tmdb.org/t/p/w500' +
    //                                           trending[index]['poster_path'],
    //                                   description: trending[index]['overview'],
    //                                   vote: trending[index]['vote_average']
    //                                       .toString(),
    //                                   launch_on: trending[index]
    //                                       ['release_date'],
    //                                 )));
    //                   },
    //                   child: Container(
    //                     width: 140,
    //                     child: Column(
    //                       children: [
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             image: DecorationImage(
    //                               image: NetworkImage(
    //                                   'https://image.tmdb.org/t/p/w500' +
    //                                       trending[index]['poster_path']),
    //                             ),
    //                           ),
    //                           // width: MediaQuery.of(context).size.width * 0.30,
    //                           height: MediaQuery.of(context).size.height * 0.30,
    //                         ),
    //                         SizedBox(height: 3),
    //                         Container(
    //                           child: modified_text(
    //                               size: 15,
    //                               text: trending[index]['title'] != null
    //                                   ? trending[index]['title']
    //                                   : 'Loading'),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               }))
    //     ],
    //   ),
    // );
  }
}

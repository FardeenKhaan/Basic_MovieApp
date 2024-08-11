import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tV;
  TV({super.key, required this.tV});

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
                  itemCount: tV.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: tV[index]['original_name'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tV[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tV[index]['poster_path'],
                                      description: tV[index]['overview'],
                                      vote: tV[index]['vote_count'].toString(),
                                      launch_on: tV[index]['first_air_date'],
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
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
                                            tV[index]['backdrop_path']),
                                    fit: BoxFit.cover),
                              ),
                              height: 140,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Column(children: [
                                modified_text(
                                    size: 15,
                                    text: tV[index]['original_name'] != null
                                        ? tV[index]['original_name']
                                        : 'Loading'),
                                modified_text(
                                    text: tV[index]['first_air_date'] != null
                                        ? tV[index]['first_air_date']
                                        : 'loading')
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
  }
}

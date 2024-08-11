import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(scrollDirection: Axis.vertical, children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.50,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      bannerurl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 5,
                    child: modified_text(
                      text: '⭐ Average Rating - ' + vote,
                      size: MediaQuery.of(context).size.height * 0.025,
                    )),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 24)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
                  modified_text(text: 'Releasing On - ' + launch_on, size: 14)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

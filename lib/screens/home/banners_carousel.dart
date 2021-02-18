import 'package:flutter/material.dart';
import '../../models/models.dart' as Models;
import 'package:carousel_slider/carousel_slider.dart';
import '../screens.dart';

class BannersCarousel extends StatelessWidget {
  final List<Models.Banner> banners;

  const BannersCarousel(
    this.banners, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners
          .map((b) => InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    b.photo,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    query: b.query ?? Models.SearchQuery(),
                    fixedTitle: b.title ?? "",
                  ),
                )),
              ))
          .toList(),
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true, //Duration(seconds: 10),
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

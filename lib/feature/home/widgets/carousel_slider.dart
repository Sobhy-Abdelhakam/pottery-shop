import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class CustumCarouselSlider extends StatelessWidget {
  const CustumCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
      ),
      items: [
        'assets/home/1.jpg',
        'assets/home/2.jpg',
        'assets/home/3.jpg',
        'assets/home/4.jpg',
        'assets/home/5.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(i, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}

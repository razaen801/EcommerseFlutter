import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderDemo extends StatefulWidget {
  CarouselSliderDemo() : super();
  @override
  CarouselSliderDemoState createState() => CarouselSliderDemoState();
}

class CarouselSliderDemoState extends State<CarouselSliderDemo> {
  final List<String> _imgList = [
    "assets/art_grass.jpg",
    "assets/carpets.jpg",
    "assets/Laminate.jpg",
    "assets/chairs.jpg",
    "assets/Flooring.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: true,
                  scrollDirection: Axis.horizontal),
              items: _imgList.map((imgName) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.teal,
                      ),
                      child: Image.asset(imgName, fit: BoxFit.fill),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderDemo extends StatefulWidget {
  CarouselSliderDemo() : super();
  final String title = "Carousel Slider";
  @override
  CarouselSliderDemoState createState() => CarouselSliderDemoState();
}

class CarouselSliderDemoState extends State<CarouselSliderDemo> {
  int _current = 0;
  final List<String> imgList = [
    "assets/art_grass.jpg",
    "assets/carpets.jpg",
    "assets/Laminate.jpg",
    "assets/chairs.jpg",
    "assets/Flooring.jpg",
  ];

  // List<T> map<T>(List list, Function handler){
  //   List<T> result = [];
  //   for(var i=0;1<list.length;i++){
  //     result.add(handler(i, list[i]));
  //   }
  //   return result;
  // }
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
              //   carouselController:(index) {
              //     setState(() {
              //       _current=index;
              //     });
              // },
              items: imgList.map((imgList) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.teal,
                      ),
                      child: Image.asset(imgList, fit: BoxFit.fill),
                    );
                  },
                );
              }).toList(),
            ),

            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: map<Widget>(imgList, (index){
            //     return Container(
            //       width: 10,
            //       height: 10,
            //       margin: EdgeInsets.symmetric(vertical:10, horizontal: 2.0 ),
            //       decoration: BoxDecoration(shape: BoxShape.circle,
            //       color: _current== index? Colors.redAccent: Colors.green),
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}

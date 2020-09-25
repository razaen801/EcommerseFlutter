import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(77, 93, 92, 1),
          title: Text("About Us"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Image.asset(
                  "assets/logoRohi.jpg",
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Established in the year 2009,Rohi International is a private company "
                    "which provides the quality imported furniture's from the world's "
                    "top furniture manufactures: India and China. Rohi international "
                    "has never compromised with the quality to the  "
                    "customers. Rohi international has always provided customers the latest "
                    "furniture's in the global market having no complaints in design and comfort."
                    " We have our 1300 sq.ft showroom at Kuleshwor, Kathmandu, Nepal.\n \n"
                    "Nevertheless, Rohi International is a one among major market player "
                    "in the furniture. Moreover, we are among one of the leading wholesalers in the country.\n \n"
                    "We have associate with the supreme industries Limited since 2013.\n \n "
                    "If you are simply looking for furniture that fulfill their function, "
                    "look good and meet your budget, you have come to the right place.",
                    style: TextStyle(
                      color: Color.fromRGBO(77, 93, 92, 1),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

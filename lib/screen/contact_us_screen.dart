import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/infoCard.dart';
import 'package:rohi_furniture_app/widgets/contact_slider.dart';
import 'package:url_launcher/url_launcher.dart' as Luncher;

const address = 'Our Address\n'
    'Kuleshwor,near Ganeshthan mandir';
const openingHours = 'Opening Hours\n'
    '09:00 AM to 06:00 PM';
const phone = '01 4271760';
const website = 'http://rohiint.com/';
const email = 'info@rohitint.com';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Contact(),
    );
  }
}

class Contact extends StatelessWidget {
  void openMap() async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=	27.6889697,	85.2979805';
    if (await Luncher.canLaunch(googleUrl)) {
      await Luncher.launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: CarouselSliderDemo(),
              ),
              SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: Divider(
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    InfoCard(
                      text: "Phone\n$phone",
                      icon: Icons.phone,
                      onPressed: () async {
                        String removeSpacePhone =
                            phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                        final phoneNumber = 'tel:$removeSpacePhone';
                        if (await Luncher.canLaunch(phoneNumber)) {
                          await Luncher.launch(phoneNumber);
                        } else {
                          print(phoneNumber);
                        }
                      },
                    ),
                    InfoCard(
                      text: address,
                      icon: Icons.location_on,
                      onPressed: () {
                        openMap();
                      },
                    ),
                    InfoCard(
                      text: openingHours,
                      icon: Icons.schedule,
                      onPressed: () {
                        print('Opening Hours');
                      },
                    ),
                    InfoCard(
                      text: "Website\n$website",
                      icon: Icons.web,
                      onPressed: () async {
                        if (await Luncher.canLaunch(website)) {
                          await Luncher.launch(website);
                        } else {
                          throw 'Could not launch $website';
                        }
                      },
                    ),
                    InfoCard(
                      text: "Email\n$email",
                      icon: Icons.mail,
                      onPressed: () async {
                        final emailAddress = 'mailto:$email';
                        if (await Luncher.canLaunch(emailAddress)) {
                          await Luncher.launch(emailAddress);
                        } else {
                          throw 'Could not launch $emailAddress';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

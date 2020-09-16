import 'package:flutter/material.dart';

class UserDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 2.0, left: 20, right: 1, bottom: 20),
                height: MediaQuery.of(context).size.height * .4,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Close Button
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 20,
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Row(
                      children: [
                        //Circle Image
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(
                                color: Colors.lightBlue,
                                width: 5.0,
                              )),
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70.0,
                            child: Text(
                              "N",
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                        //UserName
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.55,
                          padding: EdgeInsets.only(right: 20.0, bottom: 50.0),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Asish Lo Tamang",
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    //Icon List
                    Container(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.list,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //User Detail
              Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+9779823456123",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "abc@gmail.com",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Kathmandu,Nepal",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

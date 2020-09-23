import 'package:flutter/material.dart';

class CareerViewScreen extends StatefulWidget {
  @override
  _CareerViewScreenState createState() => _CareerViewScreenState();
}

class _CareerViewScreenState extends State<CareerViewScreen> {
  String _name;
  String _email;
  String _address;
  String _phoneNumber;
  String _post;
  String _experience;
  String _message;

  Widget getBullet() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Color.fromRGBO(77, 93, 92, 1),
        shape: BoxShape.circle,
      ),
    );
  }

  int selectedRadio;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
  }

  void setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(77, 93, 92, 1);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset("assets/career.png"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Available Job Positions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: _color),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Sales",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Deliver Boy",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Driver",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        getBullet(),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Accountant",
                          style: TextStyle(fontSize: 18, color: _color),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  child: Center(
                    child: Container(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Your good name",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Email address",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Address",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Contact No.",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(fontSize: 17, color: _color),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: _color,
                                          value: 1,
                                          groupValue: selectedRadio,
                                          onChanged: (val) {
                                            setSelectedRadio(val);
                                          }),
                                      Text(
                                        "Male",
                                        style: TextStyle(color: _color),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: _color,
                                          value: 2,
                                          groupValue: selectedRadio,
                                          onChanged: (val) {
                                            setSelectedRadio(val);
                                          }),
                                      Text(
                                        "Female",
                                        style: TextStyle(color: _color),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: _color,
                                          value: 3,
                                          groupValue: selectedRadio,
                                          onChanged: (val) {
                                            setSelectedRadio(val);
                                          }),
                                      Text(
                                        "Others",
                                        style: TextStyle(color: _color),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Position You want to apply",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Experience",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Message If any",
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: _color,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(77, 93, 92, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Submit",
                                style: TextStyle(fontSize: 24, color: _color),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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

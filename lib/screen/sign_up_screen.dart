import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rohi_furniture_app/server%20handler/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  bool _obsureValue1 = true;
  bool _obsureValue2 = true;
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _emailFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  FocusNode _rePasswordFocusNode = new FocusNode();

  final itemUsernameController = new TextEditingController();
  final itemEmailController = new TextEditingController();
  final itemPasswordController = new TextEditingController();
  final itemRePasswordController = new TextEditingController();

  void submitData() {
    String userName = itemUsernameController.text.trim();
    String email = itemEmailController.text.trim();
    String password = itemPasswordController.text.trim();
    String rePassword = itemRePasswordController.text.trim();
    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      print("Please fill up the space!");
    } else {
      if (password != rePassword) {
        print("Password and re-password doesnot matched!");
      } else {
        submitSignUpRequest(userName, email, password);
        print("Submitted");
      }
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/logoRohi.jpg",
                  height: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemUsernameController,
                    focusNode: _userNameFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Full Name",
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemEmailController,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemPasswordController,
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_rePasswordFocusNode);
                    },
                    obscureText: _obsureValue1,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            if (_obsureValue1 == true)
                              _obsureValue1 = false;
                            else
                              _obsureValue1 = true;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(77, 93, 92, 1),
                    ),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: itemRePasswordController,
                    focusNode: _rePasswordFocusNode,
                    obscureText: _obsureValue2,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Re-password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            if (_obsureValue2 == true)
                              _obsureValue2 = false;
                            else
                              _obsureValue2 = true;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    onPressed: () {
                      submitData();
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromRGBO(77, 93, 92, 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "  Back  ",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromRGBO(77, 93, 92, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitSignUpRequest(String name, String email, String password) async{
    List<String> response= await Services.userSignUpNew(name, email, password);
    showToastMessage(response.toString());
  }

  showToastMessage(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.blue,
        backgroundColor: Colors.white);
  }
  }



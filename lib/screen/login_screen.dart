import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsureValue = true;
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  final itemUsernameController = new TextEditingController();
  final itemPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 50, left: 24, right: 24),
            child: Column(
              children: [
                Image.asset("assets/logoRohi.jpg"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(77, 93, 92, 1)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            hintText: "UserName or Email",
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(77, 93, 92, 1),
                          ),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextField(
                          controller: itemPasswordController,
                          focusNode: _passwordFocusNode,
                          obscureText: _obsureValue,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Password",
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  if (_obsureValue == true)
                                    _obsureValue = false;
                                  else
                                    _obsureValue = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 28, vertical: 13),
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Color.fromRGBO(77, 93, 92, 1),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an Account ?",
                            style: TextStyle(
                              color: Color.fromRGBO(77, 93, 92, 1),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(77, 93, 92, 1),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

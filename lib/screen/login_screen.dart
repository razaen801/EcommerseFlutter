import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rohi_furniture_app/provider/user.dart';
import 'package:rohi_furniture_app/screen/sign_up_screen.dart';
import 'package:rohi_furniture_app/screen/user_detail_screen.dart';
import 'package:rohi_furniture_app/server%20handler/services.dart';


typedef void boolCallBack(bool val);

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final boolCallBack callBack;
  _LoginScreenState({this.callBack});

  bool _obsureValue = true;
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  final itemUsernameController = new TextEditingController();
  final itemPasswordController = new TextEditingController();
  bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: loginToApp(),
    //   builder: (context,snapshot){
    //     return snapshot.connectionState==ConnectionState.waiting
    //         ? MaterialApp(
    //         home: Scaffold(
    //           backgroundColor: Colors.white,
    //           body: Center(
    //             child: Padding(
    //               padding: const EdgeInsets.only(top: 250, bottom: 20),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Image.asset(
    //                     "assets/logo.jpg",
    //                     height: 300,
    //                     width: 350,
    //                     alignment: Alignment.center,
    //                   ),
    //                   Column(
    //                     children: [
    //                       CircularProgressIndicator(),
    //                       SizedBox(
    //                         height: 25,
    //                       ),
    //                       Text(
    //                         "Loading...",
    //                         style: TextStyle(fontSize: 18),
    //                       )
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         )) :
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
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
                              hintText: "Username or Email",
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
                            onPressed: () {
                              showToastMessage("Logging in");
                              Services.newLoginRequest(itemUsernameController.text.trim(), itemPasswordController.text.trim(), context).then((value) => {
                                if(value){
                                  showToastMessage("Successful"),
                                  Navigator.pushNamed(context, '/second')
                                  // replaceLoginScreen(context)
                                }
                                else showToastMessage("Failed")
                              });
                              // loginToApp();
                            },
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an Account ?",
                                style: TextStyle(
                                  color: Color.fromRGBO(77, 93, 92, 1),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //   },
    // );
  }

  void showToastMessage(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.blue,
        backgroundColor: Colors.white);
  }
}

replaceLoginScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => UserDetailScreen()),
  );
}

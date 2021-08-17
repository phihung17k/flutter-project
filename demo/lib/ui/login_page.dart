import 'package:demo/blocs/LoginBloc.dart';
import 'package:demo/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = new LoginBloc();

  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  bool _isVisible = true;
  bool _isValidUser = true;
  bool _isValidPass = true;
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent[100],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 115,
              ),
              Image.asset(
                "images/anh.jpg",
                scale: 3,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                child: Column(
                  children: [
                    StreamBuilder(
                        stream: loginBloc.stream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: userController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.email_outlined),
                              labelText: "Username",
                              errorText: (!_isValidUser || "email".endsWith(snapshot.hasData?snapshot.data:""))? "Invalid email" : null,
                              hintText: "abc@gmail.com",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              _isValidUser = loginBloc.checkValidUser(userController.text);
                              print("User $_isValidUser ; ${"pass".endsWith(snapshot.hasData?snapshot.data:"")}");
                              },
                          );
                        }),
                    StreamBuilder(
                        stream: loginBloc.stream,
                        builder: (context, snapshot) {
                          return TextField(
                            obscureText: !_isVisible,
                            controller: passController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: "Password",
                              errorText: (!_isValidPass || "pass".endsWith(snapshot.hasData?snapshot.data:""))? "Invalid password" : null,

                              suffixIcon: IconButton(
                                icon: Icon(_isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    setState(() => _isVisible = !_isVisible),
                              ),
                            ),
                            onChanged: (value) {
                              _isValidPass = loginBloc.checkValidPass(passController.text);
                              print("Pass $_isValidPass ; ${"pass".endsWith(snapshot.hasData?snapshot.data:"")}");
                            }
                          );
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                        stream: loginBloc.stream,
                        builder: (context, snapshot) {
                          return Text(snapshot.hasError ? snapshot.error : "",
                              style: TextStyle(color: Colors.red));
                        }),
                  ],
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    print("Login ${userController.text} and ${passController.text}");
                    if (loginBloc.checkLogin(userController.text, passController.text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage.data(
                                userController.text, passController.text)),
                      );
                    } else {
                      setState(() {
                        _result = "login failed";
                        _isValidPass = true;
                        _isValidUser = true;
                      });
                    }
                  },
                  child: new Text("Login"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //
                    ),
                    side: BorderSide(style: BorderStyle.solid),
                  ),
                ),
                width: 280,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

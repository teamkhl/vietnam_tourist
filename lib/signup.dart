import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_tourist/login.dart';

import 'widget/button_builder.dart';
import 'widget/text_form_field_builder.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    Widget title = Text("Đăng kí Tài Khoản");

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Center(
              child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 100,
                          height: 50,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            "SIGNUP",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                      TextFormBuilder(
                        hintText: "Email",
                        prefixIcon: Icons.email,
                      ),
                      TextFormBuilder(
                        hintText: "Phone",
                        prefixIcon: Icons.phone,
                      ),
                      TextFormBuilder(
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        suffixIcon: Icons.hide_source,
                      ),
                      TextFormBuilder(
                        hintText: "Confirm Password",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        suffixIcon: Icons.hide_source,
                      ),
                      SizedBox(height: 10.0),
                      ButtonBuilder(width: 100, text: "SIGN UP"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account  ',
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login())),
                              child: Text('Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )))),
    );
  }
}

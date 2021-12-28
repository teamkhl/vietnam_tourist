import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vietnam_tourist/signup.dart';
import 'forget_password.dart';
import 'widget/button_builder.dart';
import 'widget/text_form_field_builder.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Widget title = Text("Đăng Nhập ");

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
                      Image.asset(
                        "assets/images/logo.png",
                        width: 70,
                        height: 70,
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Log into your account and get started!',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      TextFormBuilder(
                        hintText: "Email",
                        prefixIcon: Icons.email,
                      ),
                      TextFormBuilder(
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        suffixIcon: Icons.hide_source,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: InkWell(
                            onTap:
                                () {}, //=> viewModel.forgotPassword(context),
                            child: Container(
                              width: 130,
                              height: 40,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: TextButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPassword())),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ButtonBuilder(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/main_screen'),
                        width: 100,
                        text: "LOG IN",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?  ",
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )))),
    );
  }
}

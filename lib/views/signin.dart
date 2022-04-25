// ignore_for_file: unused_import, deprecated_member_use, prefer_const_constructors, unused_field, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quizmaker/views/signup.dart';
import 'package:quizmaker/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  late String email , password ;

  SignIn(){
    if(_formkey.currentState!.validate()){
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Form(
          key: _formkey,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Spacer(),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? "Enter Email ID" : null;
                    },
                    decoration: InputDecoration(hintText: "Email"),
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? "Enter Password" : null;
                    },
                    decoration: InputDecoration(hintText: "Password"),
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: (() {
                      SignIn();
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 48,
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 15.5),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 15.5,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ))),
    );
  }
}

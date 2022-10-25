import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/signin_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id="splash_page";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  _initTimer(){
    Timer(const Duration(seconds: 2), (){
      _callSignInPage();
    });
  }


  // Opens the Sign In Page --> function
  _callSignInPage(){
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTimer();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(193,53, 132, 1),
              Color.fromRGBO(131,58, 180, 1),
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  "Instagram",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: "Billabong",
                  ),
                ),
              ),
            ),

            Text(
                "All rights reserved",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

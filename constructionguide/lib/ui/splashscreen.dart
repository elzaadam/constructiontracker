import 'dart:async';

import 'package:constructionguide/homepage.dart';
import 'package:constructionguide/loginpage.dart';
import 'package:constructionguide/prefmanager/Prefmanager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Splashcsreen extends StatefulWidget {
  const Splashcsreen({super.key});

  @override
  State<Splashcsreen> createState() => _SplashcsreenState();
}

class _SplashcsreenState extends State<Splashcsreen> {
  @override
  void initState() {
    fetcher();
    super.initState();
  }

  void fetcher() async {
    var token = await PrefManager.getToken();
    if (token != null) {
      Timer(
          const Duration(seconds: 6),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Homepage())));
    } else {
      Timer(
          const Duration(seconds: 6),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Loginpage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      color: Colors.white,
                      child: Lottie.asset('assets/lotties/splash.json')),
                  const Text(
                    "Construction Tracker",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


//                 color: Colors.white,
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: MediaQuery.of(context).size.width / 2,


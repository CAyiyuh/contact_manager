// ignore_for_file: implementation_imports, unnecessary_import, non_constant_identifier_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:contact_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // @override
  // void initState() {
  //   super.initState();
  //   _NavigateToHome();
  // }

  // _NavigateToHome() async {
  //   await Future.delayed(const Duration(milliseconds: 3000), () {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Welcome()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.blue,
        splash: const Icon(Icons.home,color: Colors.white,size: 40,),
        nextScreen: const HomeScreen(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        ),
    );
  }
}

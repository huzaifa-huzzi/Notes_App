import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dart_notes_app/Routing/routes_name.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Timer(const Duration(seconds: 2), () {
     Navigator.pushNamed(context, RoutesName.homeScreen);
  });
    
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.orange,
      body:  Padding(
        padding:const EdgeInsets.only(left: 20),
        child: Center(
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 50.0,
                fontFamily: 'Bobbers',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                 TyperAnimatedText('<Notes/>')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

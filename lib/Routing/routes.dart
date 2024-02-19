import 'package:dart_notes_app/Routing/routes_name.dart';
import 'package:dart_notes_app/uis/Home_Screen.dart';
import 'package:dart_notes_app/uis/Notes%20Screen.dart';
import 'package:dart_notes_app/uis/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
       switch(settings.name){
         case RoutesName.homeScreen:
           return MaterialPageRoute(builder: (context) => const HomeScreen());

         case RoutesName.splashScreen:
           return MaterialPageRoute(builder: (context) => const SplashScreen());

         case RoutesName.Notes:
           return MaterialPageRoute(builder: (context) => const NotesScreen());

         default :
           return MaterialPageRoute(builder:(_){
             return const Scaffold(
               body: Center(
                 child: Text('No Route find'),
               ),
             );

           });

       }

  }


}
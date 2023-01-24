import 'package:flutter/material.dart';
import 'package:recipe_app/screens/auth/login_screen.dart';
import 'package:recipe_app/screens/auth/signup.dart';
import 'package:recipe_app/screens/homepage/home.dart';

void main() {
  runApp(MaterialApp(
  title: 'Recipe Application',
   initialRoute: '/',
     routes: {
                  "/" : (BuildContext context)=>LoginScreen(),
                  "/signUP" : (BuildContext context)=>RegisterScreen(),
                  "/home" : (BuildContext context)=>Homepage(),

                  // "/login": (BuildContext context)=>LoginScreen(),
                  // "/splash": (BuildContext context)=>SplashScreen(),
                  // "/register": (BuildContext context)=>RegisterScreen(),
                  // "/dashboard": (BuildContext context)=>DashboardScreen(),
                 
                },
   

  ));
}


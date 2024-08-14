import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/View/Splash.dart';
import 'package:news_app/View/newsDetail.dart';
import 'package:news_app/View/newsHome.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page:()=> SplashScreen(),transition:Transition.rightToLeft),
        GetPage(name: '/home', page:()=> HomeScreen(),transition: Transition.rightToLeft),
        GetPage(name: '/detail', page:()=> DetailScreen(),transition: Transition.rightToLeft),

      ],
    );
  }
}


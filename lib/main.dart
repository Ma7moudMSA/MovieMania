import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviemania/screen/Home.dart';
import 'package:moviemania/screen/login.dart';
import 'package:moviemania/screen/profile.dart';
import 'package:moviemania/screen/splash_screen.dart';
import 'Widgets/footer.dart';
import 'Widgets/MovieSlider.dart';
import 'Widgets/TrendingMovies.dart';
import 'screen/favouriteList.dart';
import 'screen/search.dart';



void main() {
 /* WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();*/
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      /*routes: {
        "home": (context)=> Home(),
        "search": (context)=>SearchPage(),
        "favourite":(context)=>favouriteList(),
        "profile":(context)=>profile(),

      },*/
    );
  }
}




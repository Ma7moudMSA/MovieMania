import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviemania/main.dart';
import 'package:moviemania/screen/Home.dart';
import 'package:moviemania/screen/login.dart';
import 'package:moviemania/screen/signUp.dart';

import '../Widgets/welcomButton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>login()));
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff420516), Color(0xff191919)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  flex: 8,
                  child: Center(
                    child: Image.asset(
                      'asset/MovieMania.png',
                    ),
                  )),
             /* Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(child: WelcomeButton(
                        ButtonText: "SignUp",
                        onTap:signup() ,
                        color: Colors.transparent,
                        TextColor: Color(0xffC7B7A3),
                      )),
                      Expanded(child: WelcomeButton(
                        ButtonText: "LogIn",
                        onTap: login(),
                        color: Color(0xff191919),
                        TextColor:Color(0xff561C24) ,
                      )),
                    ],
                  ))*/
            ],
          )),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/screen/Home.dart';
import 'package:moviemania/screen/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/firebase_aut_services.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff191919),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff420516), Color(0xff191919)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SignUp",
                      style: TextStyle(color: Colors.white, fontSize: 40),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60)
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 5, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),

                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                    color: Color(0xff420516))),
                              ),
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none

                                ),
                              ),

                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                    color: Color(0xff420516))),
                              ),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none

                                ),
                              ),

                            ),

                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                    color: Color(0xff420516))),
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none

                                ),
                              ),

                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff420516)
                        ),
                          onPressed: ()async{
                            FocusScope.of(context).unfocus();
                            final prefs=await SharedPreferences.getInstance();
                            await prefs.setString('Name', nameController.text);
                            await prefs.setString('Email', emailController.text);
                            await prefs.setString('password', passwordController.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));

                          },
                          child: Text("SignUp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                      SizedBox(height: 50,),


                    ],
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
/*  void _signUp()async{
    String username=nameController.text;
    String email=emailController.text;
    String password=passwordController.text;
    User? user=await _auth.signUpwithEmailAndPassword(email, password);

    if(user!=null){
      print("user is successfully created");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    }
    else {
      print("some error happend");
    }
  }*/
}

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
  final FireBaseService _auth=FireBaseService();
  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0XFFE65100),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0XFFE65100),
                Color(0xffEF6C00),
                Color(0xffffA726),

              ],
            )
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
                                color: Color.fromRGBO(225, 95, 27, .3),
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
                                    color: Color(0xffEEEEEE))),
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
                                    color: Color(0xffEEEEEE))),
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
                                    color: Color(0xffEEEEEE))),
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
                     GestureDetector(
                       onTap: _signUp,
                       child: Container(
                         width: double.infinity,
                         height: 45,
                         decoration: BoxDecoration(
                           color: Colors.deepOrange,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Text(
                           "SignUp",
                           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                         ),
                       ),
                     ),
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
  void _signUp()async{
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
  }
}

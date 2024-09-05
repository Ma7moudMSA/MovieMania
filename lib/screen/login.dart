import 'package:flutter/material.dart';
import 'package:moviemania/screen/Home.dart';
import 'package:moviemania/screen/signUp.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topCenter ,
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
                      Text("Login",style: TextStyle(color: Colors.white,fontSize: 40),)
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
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(225,95, 27, .3),
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
                                  border: Border(bottom: BorderSide(color: Color(0xffEEEEEE))),
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none

                                  ),
                                  validator: (String?val){
                                    if(val!.isEmpty){
                                      return "enter email";
                                    }
                                    return null;
                                  },
                                ),

                              ),

                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffEEEEEE))),
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  validator: (String?val){
                                    if(val!.length<8){
                                      return "password must be at least 8 char";
                                    }
                                    return null;
                                  },

                                ),

                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:40 ,),
                        Container(
                          height: 50,
                          margin:EdgeInsets.symmetric(horizontal: 50) ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0XFFE65100),
                          ),
                          child: Center(
                            child: MaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                              },
                                child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Row(

                          children: [
                            Text("have account?",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                            MaterialButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));

                            },
                              child: Text("SignUp"),)
                          ],
                        )


                      ],
                    ),
                  ),

                )
                    
                    
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/Widgets/footer.dart';
import 'package:moviemania/screen/splash_screen.dart';
import 'package:moviemania/services/firebase_aut_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {


  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            leading: Container(),
            leadingWidth: 0,
          ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40,),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('asset/person.jpg'),
            ),
            SizedBox(height: 10,),
            Text("Info"),
            SizedBox(height: 20,),
            itemProfile("Name", FirebaseAuth.instance.currentUser!.displayName.toString(), CupertinoIcons.person),
            SizedBox(height: 20,),
            itemProfile("email", FirebaseAuth.instance.currentUser!.email.toString(), CupertinoIcons.mail),
            SizedBox(height:20),

           ElevatedButton(
               style: ElevatedButton.styleFrom(
                   backgroundColor: Color(0xff420516)
               ),
               onPressed: (){
                 FirebaseAuth.instance.signOut();
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
               },
               child: Text("logout",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))

          ],
        ),
      ),
      bottomNavigationBar: Footer(),

    );
  }

  itemProfile(String title,String subtitle,IconData iconData){
    return Container(
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
      child: ListTile(
        title: Text(title,style: TextStyle(color: Colors.black),),
        subtitle: Text(subtitle,style: TextStyle(color: Colors.black)),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward,color: Colors.grey,),
        tileColor:Colors.white ,
      ),
    );
  }

}

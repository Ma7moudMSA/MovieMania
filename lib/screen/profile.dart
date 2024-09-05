import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/Widgets/footer.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40,),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('asset/person.jpg'),
            ),
            SizedBox(height: 20,),
            itemProfile("Name", "Mariem", CupertinoIcons.person),
            SizedBox(height: 20,),
            itemProfile("phone", "01069105250", CupertinoIcons.phone),
            SizedBox(height: 20,),
            itemProfile("email", "mariem2004.mn@gmail.com", CupertinoIcons.mail),
            SizedBox(height: 50,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text("Edit ",style: TextStyle(color: Colors.white),
                  ),
              ),
            ),
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
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 5,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward,color: Colors.grey,),
        tileColor:Colors.white ,
      ),
    );
  }
}

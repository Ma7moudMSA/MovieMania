import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/Widgets/Constants.dart';
import 'package:moviemania/Widgets/api.dart';


import '../Widgets/footer.dart';
import 'login.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          leadingWidth: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoSearchTextField(
                controller: searchController,
                  padding: EdgeInsets.all(10),
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                suffixIcon: Icon(Icons.cancel,color: Colors.grey,),
                style: TextStyle(color: Colors.white),
                backgroundColor: Colors.grey.withOpacity(0.3),
                onChanged: (val){
                  if(val.isEmpty){

                  }
                  else{
                   // search(searchController.text);
                  }

                },
              ),
              GridView.builder(
                shrinkWrap: true,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 15,crossAxisSpacing: 5,childAspectRatio: 1.2/2),
                  itemBuilder: (context,index){
                    return Column(
                      children: [


                      ],
                    );
                  }
              )
            ],
          ),
        ),

        bottomNavigationBar:  Footer(),
      ),
    );
  }
}
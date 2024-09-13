import 'package:flutter/material.dart';
import 'package:moviemania/Models/Movie.dart';

import '../Widgets/footer.dart';
import 'login.dart';

class favouriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favourite list'),
          leading: Container(),
          leadingWidth: 0,

        ),


      bottomNavigationBar:  Footer(),
    );
  }
}

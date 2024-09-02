import 'package:flutter/material.dart';

import '../footer.dart';

class WatchListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Watch List'),
          leading: Container(),
          leadingWidth: 0,
        ),
        body:
    Center(
    child: Text('Your watch list is currently empty.'),
    ),
      bottomNavigationBar:  Footer(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:moviemania/screen/search.dart';

import 'main.dart';

class Footer extends StatefulWidget {
   Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;
 // Track the currently selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding page based on the selected index
    switch (index) {
    case
    0:
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp()), // Replace with your HomePage widget
    );
    break;
    case 1:
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => search()), // Replace with your SearchPage widget
    );
    break;
    /*case 2:
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WatchListPage()), // Replace with your WatchListPage widget
    );
    break;*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Watch List',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent, // Adjust color as desired
        onTap: _onItemTapped,
      ),
    );
  }
}
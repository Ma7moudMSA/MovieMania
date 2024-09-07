import 'package:flutter/material.dart';
import 'package:moviemania/main.dart';
import 'package:moviemania/screen/Home.dart';

import 'package:moviemania/screen/favouriteList.dart';
import 'package:moviemania/screen/profile.dart';

import 'package:moviemania/screen/search.dart';



class Footer extends StatefulWidget {
  Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });


    switch (index) {
      case
      0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => favouriteList()), // Replace with your WatchListPage widget
        );
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>profile()),

        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BottomNavigationBar(
        //showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF5f0004),
        selectedLabelStyle: TextStyle(color: Color(0xFF5f0004)),// Adjust color as desired
        onTap: _onItemTapped,
        unselectedItemColor: Color(0xFFb22226),
        unselectedLabelStyle: TextStyle(color: Color(0xFFb22226)),

      ),
    );
  }
}
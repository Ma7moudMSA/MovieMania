import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/Models/Search_Movies.dart';
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
  TextEditingController searchController = TextEditingController();
  late Future<List<Movie>> searchmovies;
  Api api = Api();
  SearchMovie? searchModel;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
                padding: EdgeInsets.all(8),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                style: TextStyle(color: Colors.white),
                backgroundColor: Colors.grey.withOpacity(0.3),
                onChanged: (val) {
                  if (val.isEmpty) {
                  }
                },
              ),

            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}


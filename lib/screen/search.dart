import 'package:flutter/material.dart';

import '../footer.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = ''; // Store the search query

  void _onSearch(String text) {
    setState(() {
      _searchText = text;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
        leading: Container(),
        leadingWidth: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter movie title...',
                border: OutlineInputBorder(),
              ),
              onChanged: _onSearch,
            ),
            const SizedBox(height: 20.0),
            // Display search results here (replace with your logic)
            Text(_searchText.isEmpty ? 'Search for a movie...' : 'Searching...'),
          ],
        ),
      ),
      bottomNavigationBar:  Footer(),
    );
  }
}
import 'package:flutter/material.dart';

import '../Widgets/footer.dart';
import 'login.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = '';
  List<String> _filteredImages = [];// Store the search query
  final List<String> images = [
    'asset/action.jpeg',
    'asset/animated.jpeg',
    'asset/carton.jpeg',
    'asset/horror.jpeg',
    'asset/marvel.jpeg',
    'asset/romance.jpeg',
    'asset/sci-fi.jpeg',
    'asset/thrillier.jpeg'

  ];
  List<String> getFilteredImages(String searchText) {
    if (searchText.isEmpty) {
      return images; // Return all images if no search text
    }
    return images.where((image) => image.toLowerCase().contains(searchText.toLowerCase())).toList();
  }
  @override
  Widget build(BuildContext context) {
    _filteredImages = getFilteredImages(_searchText);
    return Scaffold(
      appBar: AppBar(

        leading: Container(),
        leadingWidth: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
          }, icon: Icon(Icons.output)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Search for Movie",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[400],
                hintText: 'Enter movie title...',
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8),
                  borderSide: BorderSide.none

                ),
                prefixIcon: Icon(Icons.search)
                ),


            ),
            const SizedBox(height: 10.0),
            // Display search results here (replace with your logic)
        /*Expanded(
          child: ListView.builder(
            shrinkWrap: true, // Prevent excessive scrolling
            itemCount: _filteredImages.length,
            itemBuilder: (context, index) {
              final image = _filteredImages[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 100, // Adjust image height as needed
                  ),
                ),
              );
            },
          ),
        ),*/
        ],
        ),
      ),
      bottomNavigationBar:  Footer(),
    );
  }
}
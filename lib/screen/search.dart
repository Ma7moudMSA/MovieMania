import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/Models/Search_Movies.dart';
import 'package:moviemania/Widgets/Constants.dart';
import 'package:moviemania/Widgets/api.dart';
import 'package:moviemania/screen/DetailsScreen.dart';

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

  @override
  void initState() {
    searchmovies = Api().getNowPlayingMovies();
    super.initState();
  }

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
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
          child: FutureBuilder<List<Movie>>(
              future: searchmovies,
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: data!.length,
                    itemBuilder:(context,index){
                        return Card(
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(movie: snapshot.data![index])));
                          },
                          child: ListTile(
                            title: Row(

                              children: [
                              Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                //color: Color(0xff420516),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${Constants.imagePath}${snapshot.data?[index].posterPath}',
                                ),
                              ),
                            ),
                                SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${snapshot.data![index].originalTitle}",
                                      textAlign: TextAlign.justify ,
                                  overflow: TextOverflow.ellipsis,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text('${snapshot.data![index].voteAverage.toStringAsFixed(1)}/10'),
                                    ],
                                  )
                                ],
                              )

                            ],
                          ),
                          ),
                        ));
                    }
                );

              }),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  late  Future<List<Movie>> searchmovies;

 // late Future<List<Movie>> filter;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
      return Center(child: Text("msh 3arf"),);
    /*Container(
        child: FutureBuilder<List<Movie>>(
            future: searchmovies,
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder:(context,index){
                    return Card(
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  //color: Color(0xff420516),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${Constants.imagePath}${snapshot.data?[index].posterPath}',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${snapshot.data![index].originalTitle}",),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text('${snapshot.data![index].voteAverage.toStringAsFixed(1)}/10'),
                                    ],
                                  )
                                ],
                              )

                            ],
                          ),
                        ));
                  }
              );

            }),
      );*/


  }
}

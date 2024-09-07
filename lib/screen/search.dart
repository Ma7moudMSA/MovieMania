import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/Models/searchModel.dart';
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
  Api api = Api();
  SearchModel? searchModel;

  void search(String query) {
    api.getSearchedMovie(query).then((res) {
      setState(() {
        searchModel = res;
      });
    });
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
                  } else {
                    search(searchController.text);
                  }
                },
              ),
              searchModel == null
                  ? SizedBox.shrink()
                  : GridView.builder(
                      itemCount: searchModel?.results.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.2 / 2),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            searchModel!.results[index].posterPath == null
                                ? Image.asset("asset/MovieMania.png",height: 170,)
                                : Image.network(
                                    '${Constants.imagePath}${searchModel!.results[index].posterPath}',
                                    height: 170,
                                  ),
                            SizedBox(
                              child: Text(
                                "${searchModel!.results[index].originalTitle}",
                                style: TextStyle(fontSize: 14),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              width: 100,
                            )
                          ],
                        );
                      })
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

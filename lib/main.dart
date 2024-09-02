import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'footer.dart';

bool backgroundColor = true; // 1 for dark theme, 0 for light theme
bool isitdark = false;

class Tab1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    // Fetch and display data for Tab 1 here
    return ListView(
      children: [
        // List items or other content
      ],
    );
  }
}

class Tab2Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch and display data for Tab 2 here
    return ListView(
      children: [
        // List items or other content
      ],
    );
  }
}

class Tab3Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch and display data for Tab 3 here
    return Center(
      child: Text('Tab 3 Content'),
    );
  }
}
Widget buildIcon() {
  return backgroundColor == isitdark
      ? Icon(Icons.dark_mode, color: Colors.white)
      : Icon(Icons.dark_mode, color: Colors.black45);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MovieMania",
      themeMode: backgroundColor == isitdark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black38, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(child: Text("Moviemania")),
          leading: GestureDetector(
            onTap: () {
              setState(() {
                isitdark = !isitdark;
              });
              print('Icon tapped!');
            },
            child: buildIcon(),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Trending"),
              ),
              SizedBox(height: 3,),
              SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 10,
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 300,
                        width: 200,
                        color: Colors.yellow,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    //aspectRatio: 16/9
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.55,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                ),
              ),
              Divider(
                color: Colors.black12,
                height: 20,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              DefaultTabController(
                length: 3, // Number of tabs
                child: TabBar(
                  tabs: [
                    Tab(text: "Tab 1"),
                    Tab(text: "Tab 2"),
                    Tab(text: "Tab 3"),
                  ],
                ),

              ),


            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
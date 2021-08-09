import 'dart:ui';

import 'package:carousel_demo/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => PageIndex()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Carousel(),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, PageIndex state, Widget? child) {
          return Stack(
            children: [
              Container(
                width: s.width,
                height: s.height,
                child: Image.asset(
                  items[state.index].img,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25,
                  sigmaY: 25,
                ),
                child: PageView.builder(
                  onPageChanged: (val) {
                    state.changeIndex(val);
                  },
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return Center(
                      child: Container(
                        width: s.width * 0.75,
                        height: (s.width * 0.75) * (4 / 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: AssetImage(items[index].img),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 10),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 36),
                  child: Text(
                    items[state.index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, 6),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ItemModel {
  final int idx;
  final String img;
  final String title;

  ItemModel(this.idx, this.img, this.title);
}

List<ItemModel> items = [
  ItemModel(0, "assets/images/1.jpg", "TOKYO"),
  ItemModel(1, "assets/images/2.jpg", "LONDON"),
  ItemModel(2, "assets/images/3.jpg", "BERLIN"),
  ItemModel(3, "assets/images/4.jpg", "PARIS"),
];

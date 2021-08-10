import 'package:carousel_demo/Carousel/back_layout.dart';
import 'package:carousel_demo/Carousel/data.dart';
import 'package:carousel_demo/Carousel/front_layout.dart';
import 'package:carousel_demo/Carousel/title.dart';
import 'package:carousel_demo/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, PageIndex state, Widget? child) {
          return Stack(
            children: [
              BackLayout(
                s: s,
                valueKey: items[state.index].img,
              ),
              FrontLayout(
                s: s,
                state: state,
                items: items,
              ),
              TitleLayout(title: items[state.index].title),
            ],
          );
        },
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class BackLayout extends StatelessWidget {
  final Size s;
  final String valueKey;

  const BackLayout({Key? key, required this.s, required this.valueKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600),
      child: Container(
        width: s.width,
        height: s.height,
        key: ValueKey<String>(valueKey),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 25,
            sigmaY: 25,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(valueKey),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

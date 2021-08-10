import 'package:flutter/material.dart';

class TitleLayout extends StatelessWidget {
  final String title;
  const TitleLayout({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        child: Container(
          key: ValueKey<String>(title),
          padding: EdgeInsets.only(bottom: 36),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 36,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 6),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

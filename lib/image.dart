import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DemoImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            ShadImage(
              'assets/banner.png',
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            ShadImage.square(
            'https://avatars.githubusercontent.com/u/124599?v=4',
            size: 50,
          ),
        ]
        )
      ),
    );
  }
}

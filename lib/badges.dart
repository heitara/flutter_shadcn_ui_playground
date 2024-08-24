import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Badges extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            ShadBadge(
              child: Text('Primary'),
            ),
            ShadBadge.secondary(
              child: Text('Secondary'),
            ),
            ShadBadge.destructive(
              child: Text('Destructive'),
            ),
            ShadBadge.outline(
              child: Text('Outline'),
            )
          ],
        ),
      ),
    );
  }
}

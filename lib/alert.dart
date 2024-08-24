import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Alert extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ShadAlert(
          iconSrc: LucideIcons.terminal,
          title: Text('Heads up!'),
          description:
          Text('You can add components to your app using the cli.'),
        ),
      ),
    );
  }
}

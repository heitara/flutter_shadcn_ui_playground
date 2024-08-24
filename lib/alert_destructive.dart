import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AlertDestructive extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ShadAlert.destructive(
          iconSrc: LucideIcons.circleAlert,
          title: Text('Error'),
          description:
          Text('Your session has expired. Please log in again.'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
class RadioGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShadRadioGroup<String>(
                items: [
                  ShadRadio(
                    label: Text('Default'),
                    value: 'default',
                  ),
                  ShadRadio(
                    label: Text('Comfortable'),
                    value: 'comfortable',
                  ),
                  ShadRadio(
                    label: Text('Nothing'),
                    value: 'nothing',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
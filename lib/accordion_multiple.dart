import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccordionMultiple extends StatelessWidget {
  final details = [
    (
    title: 'Is it acceptable?',
    content: 'Yes. It adheres to the WAI-ARIA design pattern.',
    ),
    (
    title: 'Is it styled?',
    content:
    "Yes. It comes with default styles that matches the other components' aesthetic.",
    ),
    (
    title: 'Is it animated?',
    content:
    "Yes. It's animated by default, but you can disable it if you prefer.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ShadAccordion<({String content, String title})>.multiple(
          children: details.map(
                (detail) => ShadAccordionItem(
              value: detail,
              title: Text(detail.title),
              child: Text(detail.content),
            ),
          ),
        ),
      ),
    );
  }
}

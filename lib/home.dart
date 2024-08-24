import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shadcn_ui_playground/accordion.dart';
import 'package:flutter_shadcn_ui_playground/generic_widget.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.toggleTheme});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final VoidCallback toggleTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> widgets = [
    'Accordion',
    'AccordionMultiple',
    'Alert',
    'AlertDestructive',
    'Avatar',
    'Badge',
    'Button',
    'Card',
    'Checkbox',
    'Dialog',
    'Form',
    'Image',
    'Input',
    'Popover',
    'Progress',
    'RadioGroup',
    'Resizable',
    'Select',
    'Sheet',
    'Slider',
    'Switch',
    'Table',
    'TableBuilder',
    'Tabs',
    'Toast',
    'Tooltip',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme, // Call the function to toggle theme
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          String widgetName = widgets.elementAt(index);
          return ListTile(
            title: Text(widgetName),
            onTap: () {
              // Navigate to the selected widget's screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScaffoldWrapper(widgetName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
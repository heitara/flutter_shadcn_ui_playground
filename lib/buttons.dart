import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Buttons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            ShadButton(
              child: const Text('Primary'),
              onPressed: () {
                // nothing
              },
            ),
            ShadButton.secondary(
              child: const Text('Secondary'),
              onPressed: () {
                // nothing
              },
            ),
            ShadButton.destructive(
              child: const Text('Destructive'),
              onPressed: () {
                // nothing
              },
            ),
            ShadButton.outline(
              child: const Text('Outline'),
              onPressed: () {
                // nothing
              },
            ),
            ShadButton.ghost(
              child: const Text('Ghost'),
              onPressed: () {
                // nothing
              },
            ),
            ShadButton.link(
              child: const Text('Link'),
              onPressed: () {
                // nothing
              },
            ),
            ShadButton.outline(
              icon: const Icon(
                Icons.chevron_right,
                size: 16,
              ),
              onPressed: () {},
            ),
            ShadButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mail_outlined,
                size: 16,
              ),
              child: const Text('Login with Email'),
            ),
            ShadButton(
              onPressed: () {},
              icon: const SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              child: const Text('Please wait'),
            ),
            ShadButton(
              onPressed: () {},
              gradient: const LinearGradient(colors: [
                Colors.cyan,
                Colors.indigo,
              ]),
              shadows: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.4),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              child: const Text('Gradient with Shadow'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';




class Dialogs extends StatelessWidget {
  final profile = [
    (title: 'Name', value: 'Alexandru'),
    (title: 'Username', value: 'nank1ro'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [ShadButton.outline(
              child: const Text('Edit Profile'),
              onPressed: () {
                showShadDialog(
                  context: context,
                  builder: (context) => ShadDialog(
                    title: const Text('Edit Profile'),
                    description: const Text(
                        "Make changes to your profile here. Click save when you're done"),
                    child: Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: profile
                            .map(
                              (p) => Row(
                            children: [
                              Expanded(
                                child: Text(
                                  p.title,
                                  textAlign: TextAlign.end,
                                  // style: theme,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: ShadInput(initialValue: p.value),
                              ),
                            ],
                          ),
                        )
                            .toList(),

                      ),
                    ),
                    actions: const [ShadButton(child: Text('Save changes'))],
                  ),
                );
              },
            ),
              ShadButton.outline(
                child: const Text('Show Dialog'),
                onPressed: () {
                  showShadDialog(
                    context: context,
                    builder: (context) => ShadDialog.alert(
                      title: const Text('Are you absolutely sure?'),
                      description: const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
                        ),
                      ),
                      actions: [
                        ShadButton.outline(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        ShadButton(
                          child: const Text('Continue'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  );
                },
              ),
        ]
          ),
        ),
      ),
    );
  }
}

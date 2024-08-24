import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
class SheetPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShadButton.outline(
                child: const Text('Open'),
                onPressed: () => showShadSheet(
                  side: ShadSheetSide.right,
                  context: context,
                  builder: (context) => const EditProfileSheet(side: ShadSheetSide.right),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShadButton.outline(
                        width: 100,
                        child: const Text('Top'),
                        onPressed: () => showShadSheet(
                          side: ShadSheetSide.top,
                          context: context,
                          builder: (context) =>
                          const EditProfileSheet(side: ShadSheetSide.top),
                        ),
                      ),
                      ShadButton.outline(
                        width: 100,
                        child: const Text('Bottom'),
                        onPressed: () => showShadSheet(
                          side: ShadSheetSide.bottom,
                          context: context,
                          builder: (context) => const EditProfileSheet(
                              side: ShadSheetSide.bottom),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShadButton.outline(
                        width: 100,
                        child: const Text('Right'),
                        onPressed: () => showShadSheet(
                          side: ShadSheetSide.right,
                          context: context,
                          builder: (context) => const EditProfileSheet(
                              side: ShadSheetSide.right),
                        ),
                      ),
                      ShadButton.outline(
                        width: 100,
                        child: const Text('Left'),
                        onPressed: () => showShadSheet(
                          side: ShadSheetSide.left,
                          context: context,
                          builder: (context) => const EditProfileSheet(
                              side: ShadSheetSide.left),
                        ),
                      ),
                    ],
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
class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key, required this.side});

  final ShadSheetSide side;

  final profile = const [
    (title: 'Name', value: 'Alexandru'),
    (title: 'Username', value: 'nank1ro'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSheet(
      constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: const Text('Edit Profile'),
      description: const Text(
          "Make changes to your profile here. Click save when you're done"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: profile
              .map(
                (p) => Row(
              children: [
                Expanded(
                  child: Text(
                    p.title,
                    textAlign: TextAlign.end,
                    style: theme.textTheme.small,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 5,
                  child: ShadInput(initialValue: p.value),
                ),
              ],
            ),
          )
              .toList(),
        ),
      ),
      actions: const [
        ShadButton(child: Text('Save changes')),
      ],
    );
  }
}
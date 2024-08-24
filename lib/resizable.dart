import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
class BasicResizable extends StatelessWidget {
  const BasicResizable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: ShadDecorator(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: theme.colorScheme.border,
            radius: theme.radius,
          ),
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: ShadResizablePanelGroup(
            children: [
              ShadResizablePanel(
                defaultSize: .5,
                minSize: .2,
                maxSize: .8,
                child: Center(
                  child: Text('One', style: theme.textTheme.large),
                ),
              ),
              ShadResizablePanel(
                defaultSize: .5,
                child: ShadResizablePanelGroup(
                  axis: Axis.vertical,
                  children: [
                    ShadResizablePanel(
                      defaultSize: .3,
                      child: Center(
                          child: Text('Two', style: theme.textTheme.large)),
                    ),
                    ShadResizablePanel(
                      defaultSize: .7,
                      child: Align(
                          child: Text('Three', style: theme.textTheme.large)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
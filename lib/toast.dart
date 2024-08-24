import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
class ToastPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShadButton.outline(
                child: const Text('Add to calendar'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    ShadToast(
                      title: const Text('Scheduled: Catch up'),
                      description:
                      const Text('Friday, February 10, 2023 at 5:57 PM'),
                      action: ShadButton.outline(
                        child: const Text('Undo'),
                        onPressed: () => ShadToaster.of(context).hide(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 50),
              ShadButton.outline(
                child: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    const ShadToast(
                      description: Text('Your message has been sent.'),
                    ),
                  );
                },
              ),
              SizedBox(height: 50),
              ShadButton.outline(
                child: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    const ShadToast(
                      title: Text('Uh oh! Something went wrong'),
                      description:
                      Text('There was a problem with your request'),
                    ),
                  );
                },
              ),
              SizedBox(height: 50),

              ShadButton.outline(
                child: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    ShadToast(
                      title: const Text('Uh oh! Something went wrong'),
                      description:
                      const Text('There was a problem with your request'),
                      action: ShadButton.outline(
                        child: const Text('Try again'),
                        onPressed: () => ShadToaster.of(context).hide(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 50),
              ShadButton.outline(
                child: const Text('Show Toast'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    ShadToast.destructive(
                      title: const Text('Uh oh! Something went wrong'),
                      description:
                      const Text('There was a problem with your request'),
                      action: ShadButton.destructive(
                        child: const Text('Try again'),
                        decoration: ShadDecoration(
                          border: ShadBorder(
                            // color: ShadTheme.of(context).colorScheme.destructiveForeground,
                          ),
                        ),
                        onPressed: () => ShadToaster.of(context).hide(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

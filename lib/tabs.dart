import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShadTabs<String>(
                value: 'account',
                tabBarConstraints: const BoxConstraints(maxWidth: 400),
                contentConstraints: const BoxConstraints(maxWidth: 400),
                tabs: [
                  ShadTab(
                    value: 'account',
                    child: const Text('Account'),
                    content: ShadCard(
                      title: const Text('Account'),
                      description: const Text(
                          "Make changes to your account here. Click save when you're done."),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16),
                          ShadInputFormField(
                            label: const Text('Name'),
                            initialValue: 'Ale',
                          ),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('Username'),
                            initialValue: 'nank1ro',
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      footer: const ShadButton(child: Text('Save changes')),
                    ),
                  ),
                  ShadTab(
                    value: 'password',
                    child: const Text('Password'),
                    content: ShadCard(
                      title: const Text('Password'),
                      description: const Text(
                          "Change your password here. After saving, you'll be logged out."),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          ShadInputFormField(
                            label: const Text('Current password'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('New password'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      footer: const ShadButton(child: Text('Save password')),
                    ),
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
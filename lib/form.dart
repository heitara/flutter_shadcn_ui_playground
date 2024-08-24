import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

class DemoForm extends StatefulWidget {
  const DemoForm({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<DemoForm> {
  final formKey = GlobalKey<ShadFormState>();
  final verifiedEmails = [
    'm@example.com',
    'm@google.com',
    'm@support.com',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ShadForm(
            key: formKey,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShadInputFormField(
                    id: 'username',
                    label: const Text('Username'),
                    placeholder: const Text('Enter your username'),
                    description: const Text('This is your public display name.'),
                    validator: (v) {
                      if (v.length < 2) {
                        return 'Username must be at least 2 characters.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadCheckboxFormField(
                    id: 'terms',
                    initialValue: false,
                    inputLabel:
                    const Text('I accept the terms and conditions'),
                    onChanged: (v) {},
                    inputSublabel:
                    const Text('You agree to our Terms and Conditions'),
                    validator: (v) {
                      if (!v) {
                        return 'You must accept the terms and conditions';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadSwitchFormField(
                    id: 'terms',
                    initialValue: false,
                    inputLabel:
                    const Text('I accept the terms and conditions'),
                    onChanged: (v) {},
                    inputSublabel:
                    const Text('You agree to our Terms and Conditions'),
                    validator: (v) {
                      if (!v) {
                        return 'You must accept the terms and conditions';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadInputFormField(
                    id: 'username',
                    label: const Text('Username'),
                    placeholder: const Text('Enter your username'),
                    description:
                    const Text('This is your public display name.'),
                    validator: (v) {
                      if (v.length < 2) {
                        return 'Username must be at least 2 characters.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadSelectFormField<String>(
                    id: 'email',
                    minWidth: 350,
                    initialValue: null,
                    onChanged: (v) {},
                    options: verifiedEmails
                        .map((email) =>
                        ShadOption(value: email, child: Text(email)))
                        .toList(),
                    selectedOptionBuilder: (context, value) => value ==
                        'none'
                        ? const Text('Select a verified email to display')
                        : Text(value),
                    placeholder:
                    const Text('Select a verified email to display'),
                    validator: (v) {
                      if (v == null) {
                        return 'Please select an email to display';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadRadioGroupFormField<NotifyAbout>(
                    label: const Text('Notify me about'),
                    items: NotifyAbout.values.map(
                          (e) => ShadRadio(
                        value: e,
                        label: Text(e.message),
                      ),
                    ),
                    validator: (v) {
                      if (v == null) {
                        return 'You need to select a notification type.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      if (formKey.currentState!.saveAndValidate()) {
                        print(
                            'validation succeeded with ${formKey.currentState!.value}');
                      } else {
                        print('validation failed');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Checkboxes extends StatefulWidget {
  const Checkboxes({Key? key}) : super(key: key);

  @override
  _CheckboxesState createState() => _CheckboxesState();
}

class _CheckboxesState extends State<Checkboxes> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ShadCheckbox(
                value: value,
                onChanged: (v) => setState(() => value = v),
                label: const Text('Accept terms and conditions'),
                sublabel: const Text(
                  'You agree to our Terms of Service and Privacy Policy.',
                ),
              ),
              const SizedBox(height: 50),
              const Text('Checkbox Form'),
              const SizedBox(height: 50),
              CheckboxFormPage()
            ],
          )
        ),
      ),
    );

  }
}

class CheckboxFormPage extends StatefulWidget {
  const CheckboxFormPage({
    super.key,
  });

  @override
  State<CheckboxFormPage> createState() => _CheckboxFormPageState();
}

class _CheckboxFormPageState extends State<CheckboxFormPage> {
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
        );
  }
}

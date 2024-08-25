// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_shadcn_ui_playground/common/base_scaffold.dart';
import 'package:flutter_shadcn_ui_playground/common/properties/bool_property.dart';
import 'package:flutter_shadcn_ui_playground/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CheckboxFormFieldPage extends StatefulWidget {
  const CheckboxFormFieldPage({super.key});

  @override
  State<CheckboxFormFieldPage> createState() => _CheckboxFormFieldPageState();
}

class _CheckboxFormFieldPageState extends State<CheckboxFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  bool initialValue = false;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {'terms': initialValue},
      child: BaseScaffold(
        appBarTitle: 'CheckboxFormField',
        editable: [
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
          MyEnumProperty(
            label: 'autovalidateMode',
            value: autovalidateMode,
            values: ShadAutovalidateMode.values,
            onChanged: (value) => setState(() => autovalidateMode = value),
          ),
          MyBoolProperty(
            label: 'Form Initial Value',
            value: initialValue,
            onChanged: (value) {
              setState(() {
                initialValue = value;
              });
              // Reset the form
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                formKey.currentState!.reset();
              });
            },
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadCheckboxFormField(
                  id: 'terms',
                  initialValue: initialValue,
                  inputLabel: const Text('I accept the terms and conditions'),
                  onChanged: print,
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
                    print('submitted');
                    if (formKey.currentState!.saveAndValidate()) {
                      setState(() {
                        formValue = formKey.currentState!.value;
                      });
                    } else {
                      print('validation failed');
                    }
                  },
                ),
                if (formValue.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('FormValue', style: theme.textTheme.p),
                        const SizedBox(height: 4),
                        SelectableText(
                          const JsonEncoder.withIndent('    ')
                              .convert(formValue),
                          style: theme.textTheme.small,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
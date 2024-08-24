import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final fruits = {
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
};
final timezones = {
  'North America': {
    'est': 'Eastern Standard Time (EST)',
    'cst': 'Central Standard Time (CST)',
    'mst': 'Mountain Standard Time (MST)',
    'pst': 'Pacific Standard Time (PST)',
    'akst': 'Alaska Standard Time (AKST)',
    'hst': 'Hawaii Standard Time (HST)',
  },
  'Europe & Africa': {
    'gmt': 'Greenwich Mean Time (GMT)',
    'cet': 'Central European Time (CET)',
    'eet': 'Eastern European Time (EET)',
    'west': 'Western European Summer Time (WEST)',
    'cat': 'Central Africa Time (CAT)',
    'eat': 'Eastern Africa Time (EAT)',
  },
  'Asia': {
    'msk': 'Moscow Time (MSK)',
    'ist': 'India Standard Time (IST)',
    'cst_china': 'China Standard Time (CST)',
    'jst': 'Japan Standard Time (JST)',
    'kst': 'Korea Standard Time (KST)',
    'ist_indonasia': 'Indonesia Standard Time (IST)',
  },
  'Australia & Pacific': {
    'awst': 'Australian Western Standard Time (AWST)',
    'acst': 'Australian Central Standard Time (ACST)',
    'aest': 'Australian Eastern Standard Time (AEST)',
    'nzst': 'New Zealand Standard Time (NZST)',
    'fjt': 'Fiji Time (FJT)',
  },
  'South America': {
    'art': 'Argentina Time (ART)',
    'bot': 'Bolivia Time (BOT)',
    'brt': 'Brasilia Time (BRT)',
    'clt': 'Chile Standard Time (CLT)',
  },
};


class SelectPage extends StatelessWidget {

  List<Widget> getTimezonesWidgets(ShadThemeData theme) {
    final widgets = <Widget>[];
    for (final zone in timezones.entries) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
          child: Text(
            zone.key,
            style: theme.textTheme.muted.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.popoverForeground,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      );
      widgets.addAll(zone.value.entries
          .map((e) => ShadOption(value: e.key, child: Text(e.value))));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShadSelect<String>(
                placeholder: const Text('Select a fruit'),
                options: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                    child: Text(
                      'Fruits',
                      // style: theme.textTheme.muted.copyWith(
                      //   fontWeight: FontWeight.w600,
                      //   color: theme.colorScheme.popoverForeground,
                      // ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ...fruits.entries
                      .map((e) =>
                      ShadOption(value: e.key, child: Text(e.value)))
                      .toList(),
                ],
                selectedOptionBuilder: (context, value) =>
                    Text(fruits[value]!),
              ),
              SizedBox(height: 50),
              ShadSelect<String>(
                placeholder: const Text('Select a timezone'),
                options: getTimezonesWidgets(ShadTheme.of(context)),
                selectedOptionBuilder: (context, value) {
                  final timezone = timezones.entries
                      .firstWhere(
                          (element) => element.value.containsKey(value))
                      .value[value];
                  return Text(timezone!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

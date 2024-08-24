import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shadcn_ui_playground/Buttons.dart';
import 'package:flutter_shadcn_ui_playground/accordion.dart';
import 'package:flutter_shadcn_ui_playground/accordion_multiple.dart';
import 'package:flutter_shadcn_ui_playground/alert.dart';
import 'package:flutter_shadcn_ui_playground/alert_destructive.dart';
import 'package:flutter_shadcn_ui_playground/avatar.dart';
import 'package:flutter_shadcn_ui_playground/badges.dart';
import 'package:flutter_shadcn_ui_playground/cards.dart';
import 'package:flutter_shadcn_ui_playground/checkboxes.dart';
import 'package:flutter_shadcn_ui_playground/dialogs.dart';
import 'package:flutter_shadcn_ui_playground/form.dart';
import 'package:flutter_shadcn_ui_playground/image.dart';
import 'package:flutter_shadcn_ui_playground/inputs.dart';
import 'package:flutter_shadcn_ui_playground/popover.dart';
import 'package:flutter_shadcn_ui_playground/progress.dart';
import 'package:flutter_shadcn_ui_playground/radio_group.dart';
import 'package:flutter_shadcn_ui_playground/resizable.dart';
import 'package:flutter_shadcn_ui_playground/select.dart';
import 'package:flutter_shadcn_ui_playground/sheet.dart';
import 'package:flutter_shadcn_ui_playground/slider.dart';
import 'package:flutter_shadcn_ui_playground/switch.dart';
import 'package:flutter_shadcn_ui_playground/table.dart';
import 'package:flutter_shadcn_ui_playground/table_builder.dart';
import 'package:flutter_shadcn_ui_playground/tabs.dart';
import 'package:flutter_shadcn_ui_playground/toast.dart';
import 'package:flutter_shadcn_ui_playground/tooltip.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ScaffoldWrapper extends StatelessWidget {
  ScaffoldWrapper(this.widgetId);
  String widgetId;

  Widget widgetBy(String widgetId) {
    switch (widgetId) {
      case 'Accordion':
        return Accordion();
      case 'AccordionMultiple':
        return AccordionMultiple();
      case 'Alert':
        return Alert();
      case 'AlertDestructive':
        return AlertDestructive();
      case 'Avatar':
        return Avatar();
      case 'Badge':
        return Badges();
      case 'Button':
        return Buttons();
      case 'Card':
        return Cards();
      case 'Checkbox':
        return Checkboxes();
      case 'Dialog':
        return Dialogs();
      case 'Form':
        return DemoForm();
      case 'Image':
        return DemoImage();
      case 'Input':
        return Inputs();
      case 'Popover':
        return PopoverPage();
      case 'Progress':
        return ProgressPage();
      case 'RadioGroup':
        return RadioGroupPage();
      case 'Resizable':
        return BasicResizable();
      case 'Select':
        return SelectPage();
      case 'Sheet':
        return SheetPage();
      case 'Slider':
        return SliderPage();
      case 'Switch':
        return SwitchPage();
      case 'Table':
        return TablePage();
      case 'TableBuilder':
        return TableBuilderPage();
      case 'Tabs':
        return TabsPage();
      case 'Toast':
        return ToastPage();
      case 'Tooltip':
        return TooltipPage();
    }
    return Accordion();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetId),
      ),
      body: widgetBy(widgetId),
    );
  }
}

import 'package:flutter_shadcn_ui_playground/common/app_bar.dart';
import 'package:flutter_shadcn_ui_playground/pages/accordion.dart';
import 'package:flutter_shadcn_ui_playground/pages/alert.dart';
import 'package:flutter_shadcn_ui_playground/pages/avatar.dart';
import 'package:flutter_shadcn_ui_playground/pages/badge.dart';
import 'package:flutter_shadcn_ui_playground/pages/button.dart';
import 'package:flutter_shadcn_ui_playground/pages/card.dart';
import 'package:flutter_shadcn_ui_playground/pages/checkbox.dart';
import 'package:flutter_shadcn_ui_playground/pages/checkbox_form_field.dart';
import 'package:flutter_shadcn_ui_playground/pages/dialog.dart';
import 'package:flutter_shadcn_ui_playground/pages/image.dart';
import 'package:flutter_shadcn_ui_playground/pages/input.dart';
import 'package:flutter_shadcn_ui_playground/pages/input_form_field.dart';
import 'package:flutter_shadcn_ui_playground/pages/popover.dart';
import 'package:flutter_shadcn_ui_playground/pages/progress.dart';
import 'package:flutter_shadcn_ui_playground/pages/radio_group.dart';
import 'package:flutter_shadcn_ui_playground/pages/radio_group_form_field.dart';
import 'package:flutter_shadcn_ui_playground/pages/resizable.dart';
import 'package:flutter_shadcn_ui_playground/pages/select.dart';
import 'package:flutter_shadcn_ui_playground/pages/select_form_field.dart';
import 'package:flutter_shadcn_ui_playground/pages/sheet.dart';
import 'package:flutter_shadcn_ui_playground/pages/slider.dart';
import 'package:flutter_shadcn_ui_playground/pages/switch.dart';
import 'package:flutter_shadcn_ui_playground/pages/switch_form_field.dart';
import 'package:flutter_shadcn_ui_playground/pages/tabs.dart';
import 'package:flutter_shadcn_ui_playground/pages/table.dart';
import 'package:flutter_shadcn_ui_playground/pages/toast.dart';
import 'package:flutter_shadcn_ui_playground/pages/tooltip.dart';
import 'package:flutter_shadcn_ui_playground/pages/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  SolidartConfig.devToolsEnabled = true;
  runApp(const App());
}

// Maps the routes to the specific widget page.
final routes = <String, WidgetBuilder>{
  '/accordion': (_) => const AccordionPage(),
  '/alert': (_) => const AlertPage(),
  '/avatar': (_) => const AvatarPage(),
  '/badge': (_) => const BadgePage(),
  '/button': (_) => const ButtonPage(),
  '/card': (_) => const CardPage(),
  '/checkbox': (_) => const CheckboxPage(),
  '/checkbox-form-field': (_) => const CheckboxFormFieldPage(),
  '/dialog': (_) => const DialogPage(),
  '/image': (_) => const ImagePage(),
  '/input': (_) => const InputPage(),
  '/input-form-field': (_) => const InputFormFieldPage(),
  '/popover': (_) => const PopoverPage(),
  '/progress': (_) => const ProgressPage(),
  '/radio-group': (_) => const RadioPage(),
  '/radio-group-form-field': (_) => const RadioGroupFormFieldPage(),
  '/resizable': (_) => const ResizablePage(),
  '/select': (_) => const SelectPage(),
  '/select-form-field': (_) => const SelectFormFieldPage(),
  '/sheet': (_) => const SheetPage(),
  '/slider': (_) => const SliderPage(),
  '/switch': (_) => const SwitchPage(),
  '/switch-form-field': (_) => const SwitchFormFieldPage(),
  '/tabs': (_) => const TabsPage(),
  '/table': (_) => const TablePage(),
  '/toast': (_) => const ToastPage(),
  '/tooltip': (_) => const TooltipPage(),
  '/typography': (_) => const TypographyPage(),
};
final routeToNameRegex = RegExp('(?:^/|-)([a-z])');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        Provider<Signal<ThemeMode>>(create: () => Signal(ThemeMode.light)),
      ],
      builder: (context) {
        final themeMode = context.observe<ThemeMode>();
        return ShadApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          routes: routes,
          theme: ShadThemeData(
            brightness: Brightness.light,
            colorScheme: const ShadZincColorScheme.light(),
            // flutter_shadcn_ui_playground with google fonts
            // textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),

            // flutter_shadcn_ui_playground of custom font family
            // textTheme: ShadTextTheme(family: 'UbuntuMono'),

            // flutter_shadcn_ui_playground to disable the secondary border
            // disableSecondaryBorder: true,
          ),
          darkTheme: ShadThemeData(
            brightness: Brightness.dark,
            colorScheme: const ShadZincColorScheme.dark(),
            // flutter_shadcn_ui_playground of custom font family
            // textTheme: ShadTextTheme(family: 'UbuntuMono'),
          ),
          home: const MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final search = Signal('');

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleWidget: ShadInput(
          placeholder: const Text('Search ShadcnUI component'),
          onChanged: search.set,
        ),
      ),
      body: SignalBuilder(
        signal: search,
        builder: (context, searchString, child) {
          final filteredRoutes = {
            for (final k in routes.keys.where(
                (k) => k.toLowerCase().contains(searchString.toLowerCase())))
              k: routes[k]!
          };

          return ListView.builder(
            itemCount: filteredRoutes.length,
            itemBuilder: (BuildContext context, int index) {
              final route = filteredRoutes.keys.elementAt(index);

              final name = route.replaceAllMapped(
                routeToNameRegex,
                (match) => match.group(0)!.substring(1).toUpperCase(),
              );

              return Material(
                child: ListTile(
                  title: Text(name),
                  onTap: () {
                    Navigator.of(context).pushNamed(route);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

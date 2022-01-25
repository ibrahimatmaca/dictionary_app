import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/extension/string_extension.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/lang/locale_keys.g.dart';
import 'feature/view/home/view/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: const CoreApp(),
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: 'assets/languages',
    ),
  );
}

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      title: LocaleKeys.main_appTitle.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const HomeView(),
    );
  }
}

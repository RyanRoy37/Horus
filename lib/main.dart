import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:onnxruntime/onnxruntime.dart';
import 'package:provider/provider.dart';  // <-- Import provider package

import 'entities/localization_mixin.dart';
import 'entities/predict_result.dart';
import 'entities/app_dir.dart';
import 'tools/ai_tools.dart';
import 'tools/distribution_tool.dart';
import 'tools/shared_pref_tool.dart';
import 'widgets/main_screen.dart';
import 'theme_provider.dart';  // <-- Import your ThemeProvider class

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OrtEnv.instance.init();

  await Future.wait([
    FlutterLocalization.instance.ensureInitialized(),
    PredictResult.loadSpeciesInfo(),
    SharedPrefTool.loadSettings(),
    AppDir.setDir(),
  ]);

  AiTools.initFuture();
  Distribution.initFuture();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),  // <-- Provide ThemeProvider here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('kn', AppLocale.KN), // changed 'zh' to 'kn' for Kannada
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    _localization.translate(SharedPrefTool.uiLanguage);
    super.initState();
  }

  @override
  void dispose() {
    OrtEnv.instance.release();
    Distribution.closeDB();
    super.dispose();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Read themeProvider from context
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: AppLocale.title.getString(context),
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true).copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
      home: const MainScreen(),
    );
  }
}

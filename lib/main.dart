import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multilanguage_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:multilanguage_app/providers/locale_provider.dart';
import 'package:provider/provider.dart';

//dummy multilanguage app

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiLanguage App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.intro,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            Text(
                'The current Language selected is ${AppLocalizations.of(context)!.language}'),
            SizedBox(
              height: 16,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    provider.setLocale(Locale('pa'));
                  },
                  child: const Text('Punjabi'),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.setLocale(Locale('hi'));
                  },
                  child: const Text('Hindi'),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.setLocale(Locale('ar'));
                  },
                  child: const Text('Arabic'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

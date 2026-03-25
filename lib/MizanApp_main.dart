// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:mizanappmaterial/MizanApp_Home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MizanApp_main());
}

class MizanApp_main extends StatelessWidget {
  const MizanApp_main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar', 'EG'),

      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      debugShowCheckedModeBanner: false,
      home: MizanApp_Login(),
    );
  }
}

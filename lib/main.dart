import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swifteye/src/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Swifteye',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF140B0F),
        textTheme: GoogleFonts.comfortaaTextTheme(),
      ),
      routerConfig: router,
    );
  }
}

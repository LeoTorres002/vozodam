import 'package:flutter/material.dart';
import 'package:vozodam/pages/splashscreen.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: 'VOZ O\'DAM',
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFF0A1D37),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.orange,
          secondary: Colors.orange,
          surface: const Color(0xFF102A47),
        ),
      ),
    );
  }
}
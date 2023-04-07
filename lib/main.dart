import 'package:flutter/material.dart';
import 'package:listpagedua/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // void initState() {
  //   super.initState();
  //   SystemChrome.setSystemUIOverlayStyle(
  //       SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(27, 44, 42, 0.408),
          secondary: const Color.fromARGB(255, 13, 214, 214),
          // whtee: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}

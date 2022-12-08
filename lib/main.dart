import 'package:flutter/material.dart';
import 'package:flutter_lesson_twenty_one/PageOne.dart';

void main() {
  runApp(const MainFile());
}

class MainFile extends StatelessWidget {
  const MainFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pageone(),
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.red),
    );
  }
}

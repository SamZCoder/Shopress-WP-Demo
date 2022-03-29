import 'package:flutter/material.dart';
import 'package:shopress/views/pages/home/index.dart';

void main() {
  runApp(Shopress());
}

class Shopress extends StatelessWidget {
  const Shopress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.route: (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: "Shopress",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}

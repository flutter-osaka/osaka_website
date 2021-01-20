import 'package:flutter/material.dart';
import 'package:osaka_website/router/index.dart';

void main() {
  runApp(FlutterOsakaWebsite());
}

class FlutterOsakaWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Osaka',
      theme: ThemeData(fontFamily: 'Montserrat'),
      onGenerateRoute: buildRouters,
      initialRoute: '/',
    );
  }
}
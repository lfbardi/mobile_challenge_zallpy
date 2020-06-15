import 'package:flutter/material.dart';
import 'package:mobile/bussiness/entities/global_model.dart';
import 'package:mobile/pages/welcome_page/welcome_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<GlobalStateModel>(
      model: globalStateModel,
      child: _buildApp(),
    );
  }

  Widget _buildApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

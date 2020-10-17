import 'package:flutter/material.dart';
import 'package:voting_app/view/MyScaffold.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Voting App',
      home: MyScaffold(),
    );
  }
}

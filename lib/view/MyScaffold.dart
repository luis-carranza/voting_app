import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/view/Home.dart';

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Voting APP',
              style: GoogleFonts.pacifico(fontSize: 25.0,),
          ),
          centerTitle: true,
        ),
      body: Home(),
    );
  }
}

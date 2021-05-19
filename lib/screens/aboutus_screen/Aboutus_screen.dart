import 'package:flutter/material.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'About us',
          color: black,
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Text(
          'This is an about us screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

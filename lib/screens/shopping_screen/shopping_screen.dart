import 'package:flutter/material.dart';
import 'package:petcare/widgets/custom_text.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(
              text: "Shopping screen",
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:petcare/widgets/block/block_provider.dart';
import 'package:petcare/widgets/block/home_block.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBlock _homeBlock;
  @override
  void initState() {
    _homeBlock = BlockProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomText(
        text: 'Home',
        color: black,
      ),
    );
  }
}

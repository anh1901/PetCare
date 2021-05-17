import 'package:flutter/material.dart';
import 'package:petcare/widgets/block/block_provider.dart';
import 'package:petcare/widgets/block/shopping_block.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key key}) : super(key: key);

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  ShoppingBlock _shoppingBlock;
  @override
  void initState() {
    _shoppingBlock = BlockProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Shop');
  }
}

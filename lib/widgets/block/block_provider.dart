import 'package:flutter/material.dart';

import 'block.dart';

class BlockProvider<T extends Block> extends StatefulWidget {
  final Widget child;
  final T block;

  const BlockProvider({Key key, @required this.block, @required this.child})
      : super(key: key);

  static T of<T extends Block>(BuildContext context) {
    BlockProvider<T> provider = context.findAncestorWidgetOfExactType();
    return provider.block;
  }

  @override
  State<StatefulWidget> createState() => _BlockProviderState();
}

class _BlockProviderState extends State<BlockProvider<Block>> {
  @override
  Widget build(BuildContext context) {
    widget.block.init();
    return widget.child;
  }

  @override
  void dispose() {
    widget.block.dispose();
    super.dispose();
  }
}

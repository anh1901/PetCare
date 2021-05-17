import 'package:flutter/material.dart';
import 'package:petcare/widgets/block/block_provider.dart';
import 'package:petcare/widgets/block/pets_block.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({Key key}) : super(key: key);

  @override
  _PetsScreenState createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  PetsBlock _petsBlock;
  @override
  void initState() {
    _petsBlock = BlockProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Pets');
  }
}

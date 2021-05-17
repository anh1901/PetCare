import 'package:flutter/material.dart';
import 'package:petcare/widgets/block/block_provider.dart';
import 'package:petcare/widgets/block/profile_block.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBlock _profileBlock;
  @override
  void initState() {
    _profileBlock = BlockProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Profile');
  }
}

import 'package:flutter/material.dart';
import 'package:FlutterloginBoilerPlate/widgets/header.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appHeader(context, titleText: 'Settings', removeBackButton: true),
      body: Text('Hello This is Settings'),
    );
  }
}
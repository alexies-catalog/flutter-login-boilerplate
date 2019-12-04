import 'package:flutter/material.dart';
import 'package:FlutterloginBoilerPlate/widgets/header.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appHeader(context, titleText: 'Dashboard', removeBackButton: true),
      body: Text('Hello This is dashboard'),
    );
  }
}
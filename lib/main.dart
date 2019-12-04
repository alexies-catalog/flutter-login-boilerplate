import 'package:flutter/material.dart';
import 'package:FlutterloginBoilerPlate/screens/home_screen.dart';
import 'package:FlutterloginBoilerPlate/screens/registration_screen.dart';
import 'package:provider/provider.dart';
import 'package:FlutterloginBoilerPlate/states/appstate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: AppState(),)
  ],
  child: MyApp(),));
}


class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: HomeScreen.id,
      theme: ThemeData(
        primaryColor: Colors.green[800],
        accentColor: Colors.green[800],
      ),
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
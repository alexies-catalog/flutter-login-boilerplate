import 'package:flutter/material.dart';


class AppState with ChangeNotifier{


  
 
  // bool isAuth;
  final DateTime timestamp = DateTime.now();


  bool isAuth =  false;
  // bool _isAuth;
  // bool get isAuth =>_isAuth;

  // bool get isAuth =>_isAuth;

  // AppState(this.isAuth);

  void updateIsAuth(bool isAuthenticated){
    isAuth = isAuthenticated;

    notifyListeners();
  }


  // void updateIsAuth(bool isAuthenticated) async{
  //   // isAuthenticated = isAuthenticated;
  //   _isAuth = isAuthenticated;
  //   notifyListeners();
  // }


}
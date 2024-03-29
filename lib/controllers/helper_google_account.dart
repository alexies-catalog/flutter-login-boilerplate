import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:FlutterloginBoilerPlate/screens/home_screen.dart';
import 'package:FlutterloginBoilerPlate/screens/registration_screen.dart';
// import 'package:FlutterloginBoilerPlate/screens/welcome_screen.dart';
import 'package:FlutterloginBoilerPlate/states/appstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');
// final BuildContext context = BuildContext();

class GoogleAccountHelper {
  


  GoogleAccountHelper();
  logoutgoogle() {
    print('signout');
    googleSignIn.signOut();
  }

  login() async {
    print('login');
    // print('$tester');
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('with internet');
        googleSignIn.signIn();
      }
    } on SocketException catch (_) {
      print('not connected');
      // _showSnackBar();
    }
  }

  handleSignIn(GoogleSignInAccount account, context) async{
    final appState = Provider.of<AppState>(context);
    if (account != null) {
      // print('User signed in!: $account');
      await createUserInFirestore(context);
      appState.updateIsAuth(true);
    } else {
      appState.updateIsAuth(false);
      //  AppState().isAuth = false;
      //  AppState().updateIsAuth(false);
  
    }
  }

    createUserInFirestore(context) async {
    // 1) check if user exists in users collection in database (according to their id)
    final GoogleSignInAccount user = googleSignIn.currentUser;
    final DocumentSnapshot doc = await usersRef.document(user.id).get();

    // final additionalUserInfo = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => RegistrationScreen(
    //       userInfo: user,
    //     ),
    //   ),
    // );
    
    // Navigator.pushNamed(context, RegistrationScreen.id,  );

    if (!doc.exists) {
      // 2) if the user doesn't exist, then we want to take them to the create account page
      final additionalUserInfo  = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => RegistrationScreen(userInfo: user,)));

      // 3) get username from create account, use it to make new user document in users collection
      usersRef.document(user.id).setData({
        "id": user.id,
        "username": await additionalUserInfo[0],
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
        "bio": "",
        "timestamp": AppState().timestamp,
        "contactNumber": await additionalUserInfo[1],
        "address": await additionalUserInfo[2],
      });

     
     
        
       AppState().updateIsAuth(true);
       Navigator.pushNamed(context, HomeScreen.id);

    }else{
     
        print(' already logged in and authenticated');
        AppState().updateIsAuth(true) ;
        print(AppState().isAuth );
        // AppState().updateIsAuth(true);
// print('--------$WelcomeScreen().id');
        // Navigator.pushNamed(context, WelcomeScreen.id);
//         		Navigator.push(context, MaterialPageRoute(builder: (context) {
// 			return WelcomeScreen();
// }));
    }
  }
}




import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/pages/login_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Return either home or login
    final firebaseuser = context.watch<User?>();
    // ignore: unnecessary_null_comparison
    if (firebaseuser!=null) {
      
      return HomePage();
    }
    return LoginPage();
  }
}

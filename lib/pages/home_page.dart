import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/widgets/homepage_body.dart';
import 'auth/authenticate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;

  @override
  void initState() {
    setState(() {
      user = context.read<AuthenticationService>().getUser()!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Star Sea Food Center"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                final result =
                    await context.read<AuthenticationService>().signOut();
                if (result == 'Signed out') {
                  Fluttertoast.showToast(msg: 'Signed out successfully');
                }
              })
        ],
      ),
      body: HomePageBody(),
    );
  }
}

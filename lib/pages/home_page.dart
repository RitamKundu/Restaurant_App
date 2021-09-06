import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(
        title: Text("Restaurant App"),
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
      body: Center(
        child: Container(
          child: Text("Welcome to star sea food center"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}

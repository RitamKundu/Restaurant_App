import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'auth/authenticate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/login_image.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 50.0),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            labelText: 'Enter Username',
                            suffixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                          controller: emailTextController,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Enter Password',
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 8) {
                              return 'Password length should be atleast 8';
                            }
                            return null;
                          },
                          controller: passwordTextController,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                            child: Text('Login'),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                final result = await context
                                    .read<AuthenticationService>()
                                    .signIn(
                                      email: emailTextController.text.trim(),
                                      password:
                                          passwordTextController.text.trim(),
                                    );

                                if (result == 'Signed in') {
                                  Fluttertoast.showToast(
                                      msg: 'Login Successful');
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(150, 50),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                )))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

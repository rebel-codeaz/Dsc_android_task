
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_screen.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
   final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  SharedPreferences logindata;
  bool newuser;
  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogin();
  }
  void checkIfAlreadyLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.of(context).pushReplacementNamed(ListScreen.routeName);
    }
    
  }
  @override
  void dispose() {
    
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              "Login Form",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            RaisedButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                if (username != '' && password != '') {
                  print('Successfull');
                  logindata.setBool('login', false);
                  logindata.setString('username', username);
                  Navigator.of(context).pushReplacementNamed(ListScreen.routeName);
                }
              },
              child: Text("Log-In"),
            )
          ],
        ),
      ),
    );
  }
}
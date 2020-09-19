import 'package:flutter/material.dart';
import 'list_screen.dart';
class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool validUser = false;

 void _checkPass () {
    if(username.text == 'admin' && password.text == '1994'){
      setState(() {
        validUser = true;
      });
    }
    else{
      setState(() {
        validUser = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
     
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          height: mediaQuery.size.height * 0.5,
          width: mediaQuery.size.width * 0.6,
          child: Column(children: <Widget>[
            Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,),),
           SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Username', ),
              controller: username,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Password', ),
              controller: password,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Login'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                 _checkPass();
                 if(validUser) {
                   Navigator.of(context).pushReplacementNamed(ListScreen.routeName);
                 }
            })
          ],),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'router.dart' as router;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routing',
      onGenerateRoute: router.generateRoute,
      initialRoute: router.Routes.HomeViewRoute,
      // onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name)), ALREADY HANDLED IN ROUTER CLASS
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Home'),
            RaisedButton(
                child: Text('named routes navigation'),
                onPressed: () {
                  Navigator.pushNamed(context, router.Routes.LoginViewRoute, arguments: 'Data Passed 🍉🍉💙💚');
                })
          ],
        ),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  final String argument;
  const LoginView({Key key, this.argument}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, 'fromLogin');
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, 'fromLogin');
          },
        ),
        body: Center(
          child: Text('Login $argument'),
        ),
      ),
    );
  }
}

// https://medium.com/flutter-community/flutter-navigation-cheatsheet-a-guide-to-named-routing-dc642702b98c

// git init
// git add .
// git commit -m "first commit"
// git remote add origin git@github.com:amrahmed242/flutter-quick-app-actions.git
// git push -u origin master

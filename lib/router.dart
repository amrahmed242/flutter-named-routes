import 'package:flutter/material.dart';

import 'main.dart';

class Routes {
  static const String HomeViewRoute = '/';
  static const String LoginViewRoute = 'login';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case Routes.LoginViewRoute:
      var loginArgument = settings.arguments;
      return MaterialPageRoute(builder: (context) => LoginView(argument: loginArgument));
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  }
}

class UndefinedView extends StatelessWidget {
  final String name;
  const UndefinedView({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name is not defined'),
      ),
    );
  }
}

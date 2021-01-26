import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return
          MaterialPageRoute(builder: (_) => HomeScreen(title: "Home Screen",color: Colors.blueAccent ));
        break;
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen(title: "Second",color: Colors.greenAccent,));

        break;
      case '/third':
        return MaterialPageRoute(builder: (_) =>ThirdScreen(title: "Third",color: Colors.redAccent,));

        break;
      default:
        return null;
    }
  }

}

import 'package:architect_design_app/src/ui/presentation/pages/start_screen.dart';
import 'package:flutter/material.dart';

import '../ui/data/models/UserModel.dart';
import '../ui/presentation/pages/auth/auth_screen.dart';
import '../ui/presentation/pages/home/home.dart';
import '../ui/presentation/pages/profile/profile.dart';

class MyRouter {


 static Route <dynamic>onGenerateRoute (RouteSettings settings) {
      switch (settings.name) {
         case '/':
        return MaterialPageRoute(builder: (_) => StartScreen());
         case '/auth':
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case '/home':
        final user = settings.arguments;
        return MaterialPageRoute(builder: (_) => Home());
      case '/profile':
        final user = settings.arguments;
        final userModel = user as UserModel;
        return MaterialPageRoute(builder: (_) => ProfileScreen(userModel));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
      }
  }
}
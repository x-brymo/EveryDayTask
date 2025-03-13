import 'package:architect_design_app/src/config/route.dart';
import 'package:flutter/material.dart';

import 'src/ui/presentation/pages/start_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architect Design App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      onGenerateRoute: MyRouter.onGenerateRoute,
      initialRoute: '/',
    );
  }
}

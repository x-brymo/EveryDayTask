import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'Screens/CameraScreen.dart';
import 'Screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: Color(0xFF075E54), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E))),
      home: LoginScreen(),
    );
  }
}

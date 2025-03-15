import 'package:architect_design_app/src/ui/presentation/pages/auth/auth_screen.dart';
import 'package:architect_design_app/src/ui/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:architect_design_app/src/ui/presentation/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './src/config/firebase_options.dart';
import 'app.dart';
import 'src/ui/presentation/pages/home/bloc/Products_bloc.dart';
import 'src/ui/presentation/pages/home/bloc/Products_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc()..add(LoadProducts()),
          child: Home(),
        ),
        BlocProvider(create: (context) => AuthBloc(), child: AuthScreen()),
      ],
      child: MyApp(),
    ),
  );
}

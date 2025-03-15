import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  void displaySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose(); // ✅ Corrected: `super.dispose()` should be called at the end.
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              displaySnackBar(context, state.message);
            } else if (state is AuthSuccessState) {
              displaySnackBar(context, "Login Successful!");
              // Navigate to home screen here
              Navigator.pushNamed(context, '/home');
            }
          },
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                SizedBox(height: 100),
                Text('Log in', style: TextStyle(fontSize: 30)),
                SizedBox(height: 20),
                Text('Welcome, please log in', style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                Text('Stay with us, We are your Family', style: TextStyle(fontSize: 19)),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabled: true,
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                  ),
                  controller: email,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                  ),
                  controller: password,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // BlocProvider.of<AuthBloc>(context).add(
                    //   AuthSignInWithEmailEvent(email: email.text, password: password.text),
                    // );
                  },
                  child: Text('Sign In with Email'),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthSignInWithGoogleEvent());
                  },
                  child: Text('Sign In with Google'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // BlocProvider.of<AuthBloc>(context).add(
                    //   AuthSignUpEvent(email: email.text, password: password.text),
                    // );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

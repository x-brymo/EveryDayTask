import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  displaySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: _formKey,                                          
        child: Column(
          children: <Widget>[
            Text('Auth Screen'),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
                controller: email,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              controller: password,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // BlocProvider.of<AuthBloc>(context).add(AuthSignInWithGoogleEvent());
              },
              child: Text('Sign In with Email'),
            ),
            ElevatedButton(
              onPressed: () {
                // BlocProvider.of<AuthBloc>(context).add(AuthSignInWithGoogleEvent());
              },
              child: Text('Sign In with Google'),
            ),
            ElevatedButton(
              onPressed: () {
                // BlocProvider.of<AuthBloc>(context).add(AuthSignInWithGoogleEvent());
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
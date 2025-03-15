import 'package:flutter/material.dart';

import '../../../data/models/UserModel.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel userModel;

  const ProfileScreen(this.userModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // CircleAvatar(radius: 50, backgroundImage: NetworkImage(userModel.)),
            SizedBox(height: 20),
            Text('Name:${ userModel.name}', style: TextStyle(fontSize: 22)),
            Text('Email: ${userModel.email}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

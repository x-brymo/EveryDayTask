// import
import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthGoogle {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: scopes).signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        developer.log('User signed in: ${user.displayName}');
        final DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          developer.log('New user');
          // New user, prompt to complete profile
          await _firestore.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
            'image': user.photoURL,
          });
          // Navigate to complete profile screen
          // Navigator.pushNamed(context, '/completeProfile');
        } else {
          // Existing user, retrieve profile data
          developer.log('User already exists');
          // Navigate to home screen
          final userData = userDoc.data() as Map<String, dynamic>;
          final name = userData['name'];
          final email = userData['email'];
          final image = userData['image'];
          // Use the retrieved data as needed
        }
      }
      return user;
    }
    return null;
  }
}

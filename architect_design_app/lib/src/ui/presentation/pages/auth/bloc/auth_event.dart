abstract class AuthEvent {}

class AuthSignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInWithEmailEvent({required this.email, required this.password});
}

class AuthSignInWithGoogleEvent extends AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpEvent({required this.email, required this.password});
}

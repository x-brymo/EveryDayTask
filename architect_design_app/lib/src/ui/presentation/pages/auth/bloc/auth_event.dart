part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
class AuthSignedInEvent extends AuthEvent {}
class AuthSignedOutEvent extends AuthEvent {}
class AuthCompleteProfileEvent extends AuthEvent {}
class AuthLoadingEvent extends AuthEvent {}
class AuthSuccessEvent extends AuthEvent {}
class AuthFailureEvent extends AuthEvent {
  final String message;
  AuthFailureEvent(this.message);
}
class AuthSignInWithGoogleEvent extends AuthEvent {}
class AuthSignInWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignInWithEmailAndPasswordEvent(this.email, this.password);
}                   
class AuthSignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignUpWithEmailAndPasswordEvent(this.email, this.password);
}

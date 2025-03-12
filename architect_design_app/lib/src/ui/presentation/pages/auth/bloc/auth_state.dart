part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
final class AuthCompleteProfile extends AuthState {}
final class AuthSignedOut extends AuthState {}
final class AuthSignedIn extends AuthState {
  final String user;
  AuthSignedIn(this.user);
}


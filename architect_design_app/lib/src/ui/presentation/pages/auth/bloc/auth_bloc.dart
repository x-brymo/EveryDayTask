import 'package:architect_design_app/src/ui/infrastructure/repositories/repository_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInWithEmailEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        // Call Firebase authentication logic here
        await Future.delayed(Duration(seconds: 2)); // Mock delay
        emit(AuthSuccessState());
      } catch (e) {
        emit(AuthErrorState(message: e.toString()));
      }
    });

    on<AuthSignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        RepositoryAuth().signInWithGoogle();
        await Future.delayed(Duration(seconds: 2)); // Mock delay
        emit(AuthSuccessState());
        
      } catch (e) {
        emit(AuthErrorState(message: e.toString()));
      }
    });

    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        // Call Firebase Sign-Up logic here
        await Future.delayed(Duration(seconds: 2)); // Mock delay
        emit(AuthSuccessState());
      } catch (e) {
        emit(AuthErrorState(message: e.toString()));
      }
    });
  }
}

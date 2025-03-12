import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../infrastructure/export_infrastructure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is AuthSignedIn) {
        signInWithGoogle();
      }
    });
  }
  Future<void> signInWithGoogle() async {
    Future.delayed(
      Duration(seconds: 2),
      () => emit(AuthLoading()),
    );
     await RepositoryAuth().signInWithGoogle();
  }
}

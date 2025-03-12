abstract class BaseRepositoryAuth {
  // sign in by google
  Future<void> signInWithGoogle();
  // sign in by email and password
  Future<void> signInWithEmailAndPassword(String email, String password);
  // sign up by email and password
  Future<void> signUpWithEmailAndPassword(String email, String password);
  // sign out
  Future<void> signOut();
  // check if user is signed in
  Future<bool> isSignedIn();
  // get current user
  Future<String> getUser();

}
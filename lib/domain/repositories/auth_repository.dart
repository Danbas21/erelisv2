abstract class AuthRepository {
  Future<bool> isAuthenticated();
  Future<String> getCurrentUserId();
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password, String name);
  Future<void> signOut();
  Future<void> resetPassword(String email);
}

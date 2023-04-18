class AuthService {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> isAuthenticated(String email, String password) async {
    // Implement login logic here
    _isLoggedIn = true;
  }

  void logout() {
    // Implement logout logic here
    _isLoggedIn = false;
  }
}

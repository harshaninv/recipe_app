import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/services/auth_service.dart';

enum AuthStatus { loading, authenticated, unauthenticated }

class AuthProvider extends ChangeNotifier{
  final AuthService _authService = AuthService();
  AuthStatus _status = AuthStatus.loading;
  User? _user;

  AuthProvider() {
    _init();
  }

  AuthStatus get status => _status;
  User? get user => _user;

  Future<void> _init() async {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      _status = user == null ? AuthStatus.unauthenticated : AuthStatus.authenticated;
      notifyListeners();
    });
  }

  Future<void> login(String email, String password) async {
    await _authService.signIn(email: email, password: password);
    // authStateChanges will update status
  }

  Future<void> signup(String email, String password) async {
    await _authService.createAccount(email: email, password: password);
    // authStateChanges will update status
  }

  Future<void> logout() async {
    await _authService.signOut();
    // authStateChanges will update status
  }

  Future<void> resetPassword(String email) async {
    await _authService.resetPassword(email: email);
  }

  Future<void> updateUserName(String username) async {
    await _authService.updateUserName(username: username);
  }

  Future<void> deleteAccount(String email, String password) async {
    await _authService.deleteAccount(email: email, password: password);
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    await _authService.resetPasswordFromCurrentPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      email: email,
    );
  }

  // get user profile data from auth service
  Future<Map<String, dynamic>> getUserProfile() async {
    return _authService.getCurrentUserDetails();
  }
  
}
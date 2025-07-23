bool isValidEmail(String email) {
  return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+').hasMatch(email);
}

bool isValidPassword(String password) {
  return password.length >= 6;
}

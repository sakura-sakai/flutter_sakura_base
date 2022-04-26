import '../../core/exceptions/exceptions.dart';

class AuthenticationRequest {
  final String email;
  final String password;

  AuthenticationRequest(this.email, this.password) {
    if (email.isEmpty) {
      throw NotFoundException('email');
    }

    if (password.isEmpty) {
      throw NotFoundException("password");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

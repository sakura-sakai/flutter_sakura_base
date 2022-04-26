import 'package:equatable/equatable.dart';

import 'refresh_token.dart';
import 'token.dart';

class AuthenticationUser extends Equatable {
  const AuthenticationUser({
    required this.id,
    required this.email,
    required this.displayName,
    required this.avatarImageUrl,
    required this.avatarImageThumbUrl,
    required this.token,
    required this.refreshToken,
  });

  final int id;

  final String email;

  final String displayName;

  final String avatarImageUrl;

  final String avatarImageThumbUrl;

  final Token token;

  final RefreshToken refreshToken;

  @override
  List<Object> get props =>
      [
        id,
        email,
        displayName,
        avatarImageUrl,
        avatarImageThumbUrl,
        token,
        refreshToken,
      ];

  @override
  bool get stringify => true;
}

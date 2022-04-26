import '../../domain/entities/authentication_user.dart';
import '../../domain/entities/refresh_token.dart';
import '../../domain/entities/token.dart';

class AuthenticationUserModel extends AuthenticationUser {
  const AuthenticationUserModel({
    required int id,
    required String email,
    required String name,
    required String avatarImageUrl,
    required String avatarImageThumbUrl,
    required Token token,
    required RefreshToken refreshToken,
  }) : super(
          id: id,
          email: email,
          displayName: name,
          avatarImageUrl: avatarImageUrl,
          avatarImageThumbUrl: avatarImageThumbUrl,
          token: token,
          refreshToken: refreshToken,
        );

  factory AuthenticationUserModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationUserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatarImageUrl: json['avatar_image_url'],
      avatarImageThumbUrl: json['avatar_image_thumb_url'],
      token: json['token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': displayName,
      'avatar_image_url': avatarImageUrl,
      'avatar_image_thumb_url': avatarImageThumbUrl,
      'token': token,
      'refresh_token': refreshToken,
    };
  }
}

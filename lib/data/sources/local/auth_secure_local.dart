import '../../../core/services/secure_storage/secure_storage.dart';
import '../../../domain/entities/refresh_token.dart';
import '../../../domain/entities/token.dart';

/// `token` of secure storage keyword
const String _authToken = "auth_token";

/// `refresh_token` of secure storage keyword
const String _authRefreshToken = "auth_refresh_token";

class AuthSecureLocal {
  AuthSecureLocal([SecureStorageHelper? storageHelper])
      : _storageHelper = storageHelper ?? SecureStorageHelper();

  late final SecureStorageHelper _storageHelper;

  // ========================== //
  //            Token           //
  // ========================== //
  Future<Token> getToken() async {
    final value = await _storageHelper.read(_authToken);
    return Token(value ?? '');
  }

  Future<void> setToken(Token token) async {
    await _storageHelper.write(_authToken, token.value);
  }

  Future<void> deleteToken() async {
    await _storageHelper.delete(_authToken);
  }

  Future<bool> containsToken() async {
    return await _storageHelper.containsKey(_authToken);
  }

  // ========================== //
  //        Refresh Token       //
  // ========================== //
  Future<RefreshToken> getRefreshToken() async {
    final value = await _storageHelper.read(_authRefreshToken);
    return RefreshToken(value ?? '');
  }

  Future<void> setRefreshToken(RefreshToken refreshToken) async {
    await _storageHelper.write(_authRefreshToken, refreshToken.value);
  }

  Future<void> deleteRefreshToken() async {
    await _storageHelper.delete(_authRefreshToken);
  }

  Future<bool> containsRefreshToken() async {
    return await _storageHelper.containsKey(_authRefreshToken);
  }
}

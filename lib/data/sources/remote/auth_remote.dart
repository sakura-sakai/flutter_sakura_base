import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/api/api.dart';
import '../../../domain/entities/authentication_request.dart';
import '../../models/authentication_user_model.dart';

class AuthRemote {
  AuthRemote([ApiClient? client]) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<AuthenticationUserModel> login(
    AuthenticationRequest authRequest,
  ) async {
    try {
      final response = await _client.invokeAPI(
        '/api/v1/auth',
        apiMethod: ApiMethod.post,
        bodyData: authRequest.toJson(),
      );

      return AuthenticationUserModel.fromJson(response.data!);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}

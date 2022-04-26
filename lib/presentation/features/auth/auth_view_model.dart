import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/usecases/auth/login_use_case.dart';
import '../../language/locale_keys.g.dart';
import '../../route/router.dart';
import '../view_model.dart';

final authVMProvider = ChangeNotifierProvider.autoDispose<AuthViewModel>(
  (ref) => AuthViewModel(ref.read),
);

enum _AuthErrorStatus {
  failed, // Login failure
  connectionError, // off-line
}

class AuthViewModel extends ViewModel {
  AuthViewModel(this.read) : super(read);

  final Reader read;

  final LoginUseCase _loginUseCase = LoginUseCase();

  // State management
  String email = "";
  String password = "";

  // Error message
  String errorMessage = "";

  Future<void> signUp() async {
    try {} catch (e) {
      handleExceptions(e);
    }
  }

  Future<void> login() async {
    try {
      if (!await isOnline()) {
        errorMessage = _getErrorMessageLogin(_AuthErrorStatus.connectionError);
        updateState();
        return;
      }

      final params = LoginParam(email: email, password: password);

      await _loginUseCase.call(params: params);

      router.replaceAll(const [HomeRoute()]);
    } catch (e) {
      errorMessage = _getErrorMessageLogin(_AuthErrorStatus.failed);
      updateState();

      // If it is a response of forced version upgrade
      if (e is GenericException && e.code == ExceptionType.forcedUpdate) {
        handleExceptions(e);
      }
    }
  }

  Future<void> logout() async {
    try {
      // Todo: handle logout
    } catch (e) {
      handleExceptions(e);
    }
  }

  Future<void> forgotPassword() async {
    try {
      // Todo: handle forgot password
    } catch (e) {
      handleExceptions(e);
    }
  }

  ///
  /// Select an error message
  ///
  String _getErrorMessageLogin(_AuthErrorStatus errorStatus) {
    switch (errorStatus) {
      case _AuthErrorStatus.connectionError:
        return LocaleKeys.noInternet;

      case _AuthErrorStatus.failed:
        return LocaleKeys.loginInformationError;

      default:
        return "";
    }
  }
}

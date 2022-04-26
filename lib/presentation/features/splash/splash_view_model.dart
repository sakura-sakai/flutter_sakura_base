import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../route/router.dart';
import '../view_model.dart';

final splashVMProvider = Provider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(ref.read),
);

class SplashViewModel extends ViewModel {
  SplashViewModel(Reader read) : super(read);

  Future<void> init() async {
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        router.replace(const WelcomeRoute());
      });
    } catch (e) {
      handleExceptions(e);

      throw Exception('There is a fatal error');
    }
  }
}

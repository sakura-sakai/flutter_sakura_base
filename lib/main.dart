import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/services/env/env.dart';
import 'presentation/app/app.dart';
import 'presentation/app/multi_language_scope.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await EnvManager.ensureInitialized();


  runApp(
    const MultiLanguageScope(
      child: ProviderScope(
        child: App(),
      ),
    ),
  );
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const/constants.dart';
import '../../language/locale_keys.g.dart';
import '../../theme/theme.dart';
import '../../widgets/atom/button/button.dart';
import '../../widgets/atom/text_view.dart';
import '../../widgets/utils/utils.dart';
import 'splash_view_model.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: AppColors.violet,
              highlightColor: AppColors.white,
              child: TextView(
                LocaleKeys.appName.tr(),
                fontSize: FontSize.massive.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: kDefaultExThinPadding),
            FutureBuilder(
              future: ref.read(splashVMProvider).init(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return LazyFutureBuilder(
                    lazyFuture: () async {
                      await ref.read(splashVMProvider).init();
                    },
                    builder: (context, future, isFutureExecuting) {
                      if (isFutureExecuting == false) {
                        return Button(
                          LocaleKeys.retry,
                          buttonType: ButtonType.accent,
                          onPressed: future,
                        );
                      }

                      return Container();
                    },
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

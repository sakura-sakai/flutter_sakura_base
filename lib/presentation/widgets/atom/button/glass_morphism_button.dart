import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/const/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../theme/theme.dart';
import '../glass_morphism.dart';
import '../text_view.dart';

class GlassMorphismButton extends HookWidget {
  const GlassMorphismButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        splashColor: AppColors.violet,
        onTap: onTap,
        child: GlassMorphism(
          height: Responsive.isMobile ? 50 : 60,
          width: Responsive.isMobile ? 40.w : 32.w,
          padding: const EdgeInsets.all(kDefaultExThinPadding),
          child: TextView(
            text,
            fontColor: FontColor.white.withOpacity(.8),
            fontDarkColor: FontColor.white.withOpacity(.8),
            fontSize: FontSize.medium,
          ),
        ),
      ),
    );
  }
}

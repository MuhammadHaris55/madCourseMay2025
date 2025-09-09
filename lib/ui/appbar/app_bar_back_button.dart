import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mad_course_may_2025/utils/asset_utils.dart';
import 'package:mad_course_may_2025/utils/color_palette.dart';
import 'package:sizer/sizer.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.width,
    this.height,
    this.isLoading = false,
    this.isColor = false,
    this.buttonStyle,
  }) : super(key: key);

  final Widget? icon;
  final Function onPressed;
  final double? width;
  final double? height;
  final ButtonStyle? buttonStyle;
  final bool isLoading;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
      child: Container(
        width: (7.4).w,
        height: (7.4).w,
        color: ColorPalette.transparent,
        // alignment: Alignment.topCenter,
        child: icon ??
            SvgPicture.asset(
              AssetUtils.backArrow,
              fit: BoxFit.none,
              height: 1.97.h,
              width: 5.33.w,
              color: isColor ? ColorPalette.black : ColorPalette.white,
            ),
      ),
    );
  }
}

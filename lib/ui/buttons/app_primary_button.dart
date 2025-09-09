import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/utils/app_font.dart';
import 'package:mad_course_may_2025/utils/color_palette.dart';
import 'package:mad_course_may_2025/utils/helpers/app_layout_helpers.dart';

class AppButton extends StatefulWidget {
  const AppButton(
      {Key? key,
      required this.onPressed,
      this.text,
      this.child,
      this.width,
      this.height,
      this.textStyle,
      this.fontSize,
      this.fontWeight,
      this.buttonStyle,
      this.textDecoration,
      this.color,
      this.buttonColor,
      this.isButtonEnable = true,
      this.isLoadingEffect = false})
      : super(key: key);

  final String? text;
  final Widget? child;
  final TextStyle? textStyle;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BoxDecoration? buttonStyle;
  final TextDecoration? textDecoration;
  final Color? color;
  final Color? buttonColor;
  final bool isButtonEnable;
  final bool isLoadingEffect;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isLoading = false;

  Future<void> _handleTap() async {
    if (!widget.isButtonEnable || _isLoading) return;

    FocusManager.instance.primaryFocus?.unfocus();

    if (widget.isLoadingEffect) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      widget.onPressed();

      setState(() {
        _isLoading = false;
      });
    } else {
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        width: (widget.width ?? cw(327)),
        height: (widget.height ?? ch(48)),
        decoration: widget.buttonStyle ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(cw(100)),
              color: widget.isButtonEnable
                  ? widget.buttonColor ?? Theme.of(context).colorScheme.primary
                  : ColorPalette.cp1483F3,
            ),
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : (widget.child ??
                Text(
                  widget.text ?? '',
                  style: widget.textStyle ??
                      TextStyle(
                        fontSize: widget.fontSize ?? 14,
                        // fontSize: widget.fontSize ?? AppFontSize.f14,
                        color: widget.color ?? ColorPalette.lightBackground,
                        fontWeight: widget.fontWeight ?? FontWeight.w600,
                        decoration:
                            widget.textDecoration ?? TextDecoration.none,
                        fontFamily: AppFont.primaryFont,
                        letterSpacing: 1,
                      ),
                )),
      ),
    );
  }
}

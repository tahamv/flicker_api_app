import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/core/ui_kit/spacing.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, outlined, text, link }

enum ButtonFit { fitWidth, fitHeight }

class ApButton extends StatelessWidget {
  const ApButton(
      {Key? key,
      this.onTap,
      this.title,
      this.loading,
      this.enable = true,
      this.childRight,
      this.childLeft,
      this.buttonType,
      this.loadingColor,
      this.fit,
      this.widget,
      this.background,
      this.childColor,
      this.padding})
      : super(key: key);

  final VoidCallback? onTap;
  final String? title;
  final Widget? widget;
  final bool? loading;
  final bool enable;
  final Widget? childRight;
  final Widget? childLeft;
  final ButtonType? buttonType;
  final ButtonFit? fit;
  final Color? background;
  final Color? loadingColor;
  final Color? childColor;
  final EdgeInsetsGeometry? padding;

  ButtonStyle _buildButtonStyle(BuildContext context) {
    if (buttonType == null) {
      return ElevatedButton.styleFrom(
        elevation: 0,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
        backgroundColor: background ?? Theme.of(context).primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(
          width: 1.0,
          color: background ?? Theme.of(context).primary,
        ),
      );
    } else {
      if (buttonType == ButtonType.filled) {
        return ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          backgroundColor: background ?? Theme.of(context).primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            width: 1.0,
            color: background ?? Theme.of(context).primary,
          ),
        );
      } else if (buttonType == ButtonType.outlined) {
        return ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          backgroundColor: Theme.of(context).white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            width: 1.0,
            color: background ?? Theme.of(context).primary,
          ),
        );
      } else if (buttonType == ButtonType.text) {
        return ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
          backgroundColor: Theme.of(context).background,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: Theme.of(context).gray3,
        );
      } else {
        return ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
          backgroundColor: Theme.of(context).background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            width: 1.0,
            color: Theme.of(context).background,
          ),
        );
      }
    }
  }

  TextStyle? _buildTextStyle(BuildContext context) {
    if (buttonType == null) {
      return Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: childColor ?? Theme.of(context).white, fontSize: 14, fontWeight: FontWeight.w400);
    } else {
      if (buttonType == ButtonType.filled) {
        return Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: childColor ?? Theme.of(context).white, fontSize: 14, fontWeight: FontWeight.w400);
      } else if (buttonType == ButtonType.outlined) {
        return Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: childColor ?? Theme.of(context).primary, fontSize: 14, fontWeight: FontWeight.w400);
      } else if (buttonType == ButtonType.text) {
        return Theme.of(context).textTheme.labelMedium?.copyWith(
            color: enable ? childColor ?? Theme.of(context).primary : Theme.of(context).gray3,
            fontSize: 14,
            fontWeight: FontWeight.w400);
      } else {
        return Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: childColor ?? Theme.of(context).primary, fontSize: 14, fontWeight: FontWeight.w400);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onTap?.call : null,
      style: _buildButtonStyle(context),
      child: SizedBox(
        height: fit == ButtonFit.fitHeight ? double.maxFinite : 30,
        width: fit == ButtonFit.fitWidth ? double.maxFinite : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (childLeft != null) childLeft ?? const SizedBox(),
            if (childLeft != null) Space.w8,
            if (loading ?? false)
              Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: loadingColor ?? Theme.of(context).white,
                  ),
                ),
              ),
            if (loading ?? false) Space.w8,
            if (title != null)
              Text(
                title ?? '',
                style: _buildTextStyle(context),
              )
            else
              widget ?? const SizedBox(),
            if (childRight != null) Space.w8,
            if (childRight != null) childRight ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

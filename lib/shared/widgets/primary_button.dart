import 'dart:async';

import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final Color? color;
  final Color? borderColor;
  final double? maxWidth;
  final Color? titleColor;
  final double? height;
  final double? elevation;
  final VoidCallback? onPressed;
  final double? width;
  final Widget? icon;
  final Widget? child;
  final double? fontSize;
  final Gradient? gradient;

  const PrimaryButton({
    super.key,
    this.gradient,
    this.onPressed,
    required this.title,
    this.color,
    this.elevation,
    this.titleColor,
    this.width,
    this.maxWidth,
    this.height,
    this.borderColor,
    this.icon,
    this.fontSize,
    this.child,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  late final bool isDarkColor;
  late ValueNotifier<bool> _isEnabled;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _isEnabled = ValueNotifier<bool>(true);
    double luminance = (widget.color ?? AppColors.primaryColor).computeLuminance();
    isDarkColor = luminance < 0.5;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 56,
      width: widget.width,
      constraints: BoxConstraints(maxWidth: widget.maxWidth ?? double.infinity),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: widget.gradient,
      ),
      child: ValueListenableBuilder(
        builder: (context, isEnabled, child) => ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: widget.elevation ?? 2,
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            side: BorderSide(
              width: 2,
              color: widget.onPressed == null ? Colors.transparent : (widget.borderColor ?? widget.color ?? AppColors.primaryColor),
            ),
          ),
          onPressed: widget.onPressed == null ? null : (isEnabled ? _onButtonPressed : () {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                widget.icon!,
                4.space,
              ],
              widget.child ??
                  Text(
                    widget.title,
                    style: context.textTheme.titleLarge!.copyWith(
                      color: widget.titleColor ?? Colors.white,
                      fontSize: widget.fontSize,
                      height: 1,
                    ),
                  ).tr(),
            ],
          ),
        ),
        valueListenable: _isEnabled,
      ),
    );
  }

  void _onButtonPressed() {
    _isEnabled.value = false;
    try {
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
    } finally {
      _timer = Timer(const Duration(milliseconds: 500), () => _isEnabled.value = true);
    }
  }
}

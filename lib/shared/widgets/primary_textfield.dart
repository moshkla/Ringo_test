import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PrimaryTexfield extends StatelessWidget {
  final String name;
  final TextInputType? keyboardType;
  final bool isFilled;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final TextEditingController? controller;
  final double? height;
  final int? maxLines;
  final TextStyle? style;
  final String? title;
  final bool? readOnly;
  final List<String? Function(String?)>? valiators;
  final VoidCallback? onTap;
  final Function(String?)? onChange;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? formatters;
  final Function(String?)? valueTransformers;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final bool obscureText;

  const PrimaryTexfield({
    super.key,
    this.textAlign,
    required this.name,
    this.keyboardType,
    this.isFilled = true,
    this.obscureText = false,
    this.hintText,
    this.formatters,
    this.suffixIcon,
    this.prefixIcon,
    this.valueTransformers,
    this.valiators,
    this.title,
    this.initialValue,
    this.readOnly,
    this.onTap,
    this.onChange,
    this.onEditingComplete,
    this.maxLines = 1,
    this.height,
    this.style,
    this.textDirection,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(title!, style: context.textTheme.titleLarge).tr(),
          ),
        Directionality(
          textDirection: textDirection ??
              (context.locale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr),
          child: SizedBox(
            height: height ?? 56,
            child: FormBuilderTextField(
              controller: controller,
              onChanged: onChange,
              obscureText: obscureText,
              obscuringCharacter: '*',
              onEditingComplete: onEditingComplete,
              valueTransformer: valueTransformers,
              onTap: onTap,
              name: name,
              style: style ?? context.textTheme.labelLarge,
              initialValue: initialValue,
              keyboardType: keyboardType,
              inputFormatters: formatters,
              validator: FormBuilderValidators.compose<String>(valiators ?? []),
              maxLines: maxLines,
              minLines: maxLines,
              readOnly: readOnly ?? false,
              textAlign: textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                filled: isFilled,
                errorMaxLines: 1,
                errorStyle: const TextStyle(height: 0.08),
                hintText: hintText?.tr(),
                suffixIcon: suffixIcon,
                prefixStyle: context.textTheme.bodyLarge,
                prefixIcon: prefixIcon == null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: prefixIcon,
                      ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 8, vertical: maxLines == null ? 0 : 10),
                prefixIconConstraints: const BoxConstraints(minWidth: 22),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

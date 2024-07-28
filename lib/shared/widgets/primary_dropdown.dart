import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PrimaryDropdown extends StatelessWidget {
  final String? intialValue;
  final String name;
  final String hintText;
  final double? height;
  final List<DropdownMenuItem<String>> items;
  final List<String? Function(dynamic)>? valiators;
  final void Function(String?)? onChanged;
  const PrimaryDropdown({
    super.key,
    required this.name,
    this.valiators,
    required this.hintText,
    required this.items,
    this.height,
    this.intialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FormBuilderDropdown<String>(
        name: name,
        onChanged: onChanged,
        initialValue: intialValue,
        validator: FormBuilderValidators.compose(valiators ?? []),
        style: context.textTheme.bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.switchOnTheme(AppColors.lightGrey, AppColors.iosMediumGrey),
          labelText: hintText,
          labelStyle: context.textTheme.headlineMedium!.copyWith(color: AppColors.hintTextColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        ),
        items: items,
      ),
    );
  }
}

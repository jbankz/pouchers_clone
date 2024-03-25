import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTextFieldWidget extends StatelessWidget {
  const EditTextFieldWidget(
      {super.key,
      this.label = '',
      this.title,
      this.controller,
      this.focusNode,
      this.validator,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.readOnly = false,
      this.obscureText = false,
      this.autocorrect = false,
      this.onTap,
      this.onFieldSubmitted,
      this.onChanged,
      this.obscuringCharacter = '*',
      this.textInputAction = TextInputAction.next,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.suffixIcon,
      this.prefix,
      this.titleStyle,
      this.inputFormatters,
      this.contentPadding,
      this.maxLines = 1,
      this.alignLabelWithHint,
      this.titleWidget});

  final String? title;
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool obscureText;
  final String obscuringCharacter;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final bool autocorrect;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final bool? alignLabelWithHint;

  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget ??
              Text(title ?? '',
                  style: titleStyle ??
                      context.titleLarge?.copyWith(fontSize: 12.sp)),
          const Gap(height: 8),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            validator: validator,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            readOnly: readOnly,
            obscureText: obscureText,
            obscuringCharacter: obscuringCharacter,
            onTap: onTap,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            textInputAction: textInputAction,
            autovalidateMode: autovalidateMode,
            autocorrect: autocorrect,
            decoration: InputDecoration(
              label: Text(label),
              hintText: label,
              suffixIcon: suffixIcon,
              prefixIcon: prefix,
              contentPadding: contentPadding,
              alignLabelWithHint: alignLabelWithHint,
            ),
            inputFormatters: inputFormatters,
            maxLines: maxLines,
          )
        ],
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_style.dart';

import '../../resources/value_manger.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    required this.hint,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor = ColorManager.white,
    this.readOnly = false,
    this.validation,
    this.onTap, this.maxLines, this.prefixIcon, this.onChanged,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final Widget? prefixIcon;
  final String hint;
  final TextInputType textInputType;
  final IconData? iconData;
  final Color? backgroundColor;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color cursorColor;
  final bool readOnly;
  final int? maxLines;
  final String? Function(String?)? validation;
  final void Function()? onTap;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool hidden = widget.isObscured;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          height: AppSize.s50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s24),
              border: Border.all(
                  color: ColorManager.primary, width: AppSize.s1)),

          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextFormField(
            onChanged:widget.onChanged ,
            maxLines: widget.maxLines,
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            style: widget.hintTextStyle ??
                AppTextStyles.hintTextStyle(context),
            obscureText: hidden,
            keyboardType: widget.textInputType,
            obscuringCharacter: '*',
            cursorColor: widget.cursorColor,
            onTap: widget.onTap,
            onEditingComplete: () {
              widget.focusNode?.unfocus();
              if (widget.nextFocus != null) {
                FocusScope.of(context).requestFocus(widget.nextFocus);
              }
            },
            textInputAction: widget.nextFocus == null ? TextInputAction.done : TextInputAction.next,
            validator: (value) {
              if (widget.validation == null) {
                setState(() {
                  errorText = null;
                });
              }
              else {
                setState(() {
                  errorText = widget.validation!(value);
                });
              }
              return errorText;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(AppPadding.p12),
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObscured
                  ? IconButton(
                onPressed: () {
                  setState(
                        () {
                      hidden = !hidden;
                    },
                  );
                },
                iconSize: AppSize.s24,
                splashRadius: AppSize.s1,
                isSelected: !hidden,
                color: widget.cursorColor,
                selectedIcon: const Icon(CupertinoIcons.eye),
                icon: const Icon(CupertinoIcons.eye_slash),
              )
                  : null,
              hintStyle: widget.hintTextStyle ??
                  AppTextStyles.hintTextStyle(context),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorStyle: const TextStyle(
                fontSize: AppSize.s0,
                color: ColorManager.transparent,
              ),
            ),
          ),
        );



  }
}

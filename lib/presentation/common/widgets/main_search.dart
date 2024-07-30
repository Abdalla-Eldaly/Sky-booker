import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_style.dart';

import '../../resources/value_manger.dart';

class MainSearchTextField extends StatefulWidget {
  const MainSearchTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    this.hint,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor = ColorManager.white,
    this.readOnly = false,
    this.validation,
    this.onTap, this.maxLines, this.prefixIcon, this.onChanged, this.surfixIcon,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final Widget? prefixIcon;
  final Widget? surfixIcon;
  final String? hint;
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
  State<MainSearchTextField> createState() => _MainSearchTextFieldState();
}

class _MainSearchTextFieldState extends State<MainSearchTextField> {
  late bool hidden = widget.isObscured;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
        height: AppSize.s50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s15),
          shape: BoxShape.rectangle,

        ),

        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: TextFormField(
          onChanged:widget.onChanged ,
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          readOnly: widget.readOnly,
          style: widget.hintTextStyle ??
              AppTextStyles.textFieldTextStyle(context),
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
            suffixIcon: widget.surfixIcon,

            hintStyle: widget.hintTextStyle ??
                AppTextStyles.hintTextFieldTextStyle(context),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
              borderSide: const BorderSide(color: ColorManager.grey)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s15),
                borderSide: const BorderSide(color: ColorManager.secondary)
            ),

            enabledBorder: OutlineInputBorder(

                borderRadius: BorderRadius.circular(AppSize.s15),
                borderSide: const BorderSide(color: ColorManager.grey)
            ),
            errorStyle: const TextStyle(
              fontSize: AppSize.s0,
              color: ColorManager.transparent,
            ),
          ),
        ),
      );



  }
}

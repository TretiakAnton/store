import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/constants.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required this.passController,
    this.validator,
    this.textInputAction,
    this.onChange,
  }) : super(key: key);
  final TextEditingController passController;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChange;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return InputWidget(
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      obscureText: isPasswordObscure,
      textEditingController: widget.passController,
      textInputType: TextInputType.visiblePassword,
      hintText: 'Password',
      maxLines: 1,
      inputFormatters: [
        LengthLimitingTextInputFormatter(40),
      ],
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isPasswordObscure = !isPasswordObscure;
          });
        },
        icon: SvgPicture.asset(
          isPasswordObscure
              ? 'assets/svg/hidden_icon.svg'
              : 'assets/svg/not_hidden_icon.svg',
          width: 15,
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  final int? maxLength;
  final String? hintText;
  final Color? hintColor;
  final double? hintSize;
  final String? initialValue;
  final FontWeight? hintFontWeight;
  final TextInputType? textInputType;
  final List<String>? autofillHints;
  final bool obscureText;
  final bool enabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? inputBorder;
  final GestureTapCallback? onTap;

  final double? hintLetterSpace;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final TextInputAction? textInputAction;
  final TextStyle? inputtextsStyle;

  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  final List<TextInputFormatter>? inputFormatters;

  const InputWidget({
    required this.textEditingController,
    this.obscureText = false,
    this.maxLength,
    this.hintText,
    this.hintColor,
    this.hintSize = 14,
    this.hintFontWeight,
    this.hintLetterSpace = 1,
    this.fillColor = Colors.transparent,
    this.contentPadding,
    this.initialValue,
    this.autofillHints,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.inputBorder,
    this.validator,
    this.maxLines,
    this.enabled = true,
    this.autofocus = false,
    this.focusNode,
    this.onTap,
    this.textInputAction,
    this.inputtextsStyle,
    this.onChanged,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      autofocus: autofocus,
      focusNode: focusNode,
      expands: false,
      keyboardType: textInputType,
      autofillHints: autofillHints,
      controller: textEditingController,
      maxLength: maxLength,
      validator: validator,
      initialValue: initialValue,
      enabled: enabled,
      onTap: onTap,
      onChanged: onChanged,
      textInputAction: textInputAction,
      style: inputtextsStyle,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: suffixIcon,
              )
            : null,
        prefixIcon: prefixIcon != null
            ? Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: prefixIcon,
              )
            : null,
        disabledBorder: inputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: primary,
              ),
            ),
        border: inputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: primary,
              ),
            ),
        focusedBorder: inputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: primary,
              ),
            ),
        enabledBorder: inputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: primary,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        errorMaxLines: 2,
        hintText: hintText,
        hintStyle: const TextStyle(),
        filled: true,
        fillColor: fillColor,
        contentPadding: contentPadding,
      ),
    );
  }
}

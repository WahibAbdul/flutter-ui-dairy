import 'package:flutter/material.dart';

import '../utils/textfield_utils.dart';

class StrTextField extends StatefulWidget {
  final Stream<String> stream;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Color? color;
  final Widget? suffixIcon;
  final bool? readOnly;
  final InputBorder? border;
  final InputDecoration? decoration;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;

  const StrTextField(this.stream,
      {super.key,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.keyboardType,
      this.maxLength,
      this.maxLines,
      this.readOnly = false,
      this.prefixIcon,
      this.color,
      this.border,
      this.textAlign,
      this.decoration,
      this.textCapitalization,
      this.suffixIcon});

  @override
  State<StrTextField> createState() => _StrTextFieldState();
}

class _StrTextFieldState extends State<StrTextField> {
  TextEditingController? _textController;
  var isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.stream,
        builder: (context, snapshot) {
          String data = snapshot.data ?? "";
          if (widget.readOnly == true) {
            _textController = TextEditingController(text: data);
          } else {
            if (_textController == null && snapshot.hasData) {
              _textController = TextEditingController(text: data);
              _textController?.selection = TextFieldUtils.getCursorPosition(_textController!, data);
              _textController?.selection = TextSelection.collapsed(offset: _textController?.text.length ?? 0);
            }
          }
          return Focus(
            child: TextField(
              controller: _textController,
              // cursorColor: widget.color,
              decoration: widget.decoration ??
                  InputDecoration(
                      focusColor: widget.color,
                      hintText: widget.hintText,
                      labelText: widget.labelText,
                      errorText: snapshot.error?.toString(),
                      errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
                      // focusedBorder: (widget.color != null)
                      //     ? Theme.of(context)
                      //         .inputDecorationTheme
                      //         .enabledBorder
                      //         ?.copyWith(borderSide: BorderSide(color: widget.color!, width: 2))
                      //     : Theme.of(context).inputDecorationTheme.focusedBorder,
                      // border: widget.border?.copyWith(borderSide: BorderSide(color: widget.color ?? Colors.grey)),
                      // prefixIconColor: (hasfocus),
                      prefixIcon: widget.prefixIcon != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 20, right: 16),
                              child: widget.prefixIcon,
                            )
                          : null,
                      suffixIcon: widget.obscureText == true ? _getPasswordVisibilityIcon() : widget.suffixIcon),
              maxLength: widget.maxLength,
              autocorrect: false,
              onChanged: widget.onChanged,
              textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
              maxLines: widget.maxLines ?? 1,
              enabled: !(widget.readOnly ?? false),
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              obscureText: isPasswordVisible ? false : widget.obscureText ?? false,
              keyboardType: widget.keyboardType,
              textAlign: widget.textAlign ?? TextAlign.start,
            ),
          );
        });
  }

  Widget _getPasswordVisibilityIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        });
      },
      splashColor: Colors.transparent,
      icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
    );
  }
}

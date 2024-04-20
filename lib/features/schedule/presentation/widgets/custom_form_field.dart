import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final String labelText;
  final String? errorText;
  final int length;
  final bool readOnly;
  final Widget prefixIcon;
  final Function()? onTap;
  const CustomFormField(
      {super.key,
      this.onFieldSubmitted,
      this.onChanged,
      required this.keyboardType,
      required this.labelText,
      this.errorText,
      required this.length,
      this.readOnly = false,
       required this.prefixIcon,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );

    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      maxLength: length,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counter: const SizedBox(),
        errorText: errorText,
        label: Text(labelText),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        errorBorder: border,
        isDense: true,
        filled: readOnly,
        prefixIcon: prefixIcon
      ),
    );
  }
}

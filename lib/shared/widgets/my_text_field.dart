// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'size_fade_switcher.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final void Function(String) onChanged;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.label,
    this.errorText,
    this.obscureText = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          obscureText: obscureText,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            label: Text(label),
          ),
        ),
        SizeFadeSwitcher(
          child: errorText != null
              ? Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(errorText!),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

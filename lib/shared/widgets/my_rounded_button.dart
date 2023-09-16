import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../extensions/build_context.dart';

class MyRoundedButton extends StatelessWidget {
  final Color? color;
  final bool withBorder;
  final String label;
  final double? paddingHeight;
  final double? width;

  const MyRoundedButton({
    super.key,
    required this.label,
    this.color,
    this.withBorder = false,
    this.paddingHeight = 18,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: paddingHeight!),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          border: withBorder ? Border.all(color: context.primary, width: 2) : null),
      child: Text(
        label,
        style: context.textTheme.titleMedium?.copyWith(color: AppColors.white),
      ),
    );
  }
}

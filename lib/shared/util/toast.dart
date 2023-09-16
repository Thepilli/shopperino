import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/app_colors.dart';

void showCustomToast(String message, {Color? color, Color? textColor, bool isError = false}) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? AppColors.notCompleted : (color ?? AppColors.black),
      textColor: textColor ?? AppColors.white,
      fontSize: 16,
    );

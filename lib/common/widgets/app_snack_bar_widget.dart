import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

/// снэкбар для алертов при успешном сценарии
SnackBar successSnackBar({String? title}){
  return SnackBar(
    content: Row(
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title ?? GlobalConstant.empty,
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: AppColors.black,
  );
}

/// снэкбар для алертов при возникновение ошибок
SnackBar errorSnackBar({String? title}){
  return SnackBar(
    content: Row(
      children: [
        const Icon(
          Icons.dangerous,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title ?? GlobalConstant.empty,
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: AppColors.semanticDanger,
  );
}
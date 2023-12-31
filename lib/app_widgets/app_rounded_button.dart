// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_app/constants/color_constants.dart';
import 'package:expense_app/utils/my_styles.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color bgColor;
  final String title;
  final Color textColor;
  final Widget? mWidget;
  const AppRoundedButton({
    Key? key,
    this.mWidget,
    required this.onTap,
    this.bgColor = ColorConstants.mattBlackColor,
    required this.title,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
        child: mWidget ??
            Text(
              title,
              style: mTextStyles16(fontColor: textColor),
            ),
      ),
    );
  }
}

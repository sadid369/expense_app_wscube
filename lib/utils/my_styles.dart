import 'package:expense_app/constants/color_constants.dart';
import 'package:flutter/material.dart';

// styles
TextStyle mTextStyles34({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}) {
  return TextStyle(
    fontSize: 34,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyles12({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}) {
  return TextStyle(
    fontSize: 12,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyles25({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}) {
  return TextStyle(
    fontSize: 25,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyles16({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}) {
  return TextStyle(
    fontSize: 16,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}

TextStyle mTextStyles43({
  FontWeight mWeight = FontWeight.normal,
  Color fontColor = Colors.black,
}) {
  return TextStyle(
    fontSize: 43,
    fontFamily: 'Mulish',
    fontWeight: mWeight,
    color: fontColor,
  );
}
// Widgets

Widget hSpacer({double mHeight = 11}) {
  return SizedBox(
    height: mHeight,
  );
}

Widget wSpacer({double mWeight = 11}) {
  return SizedBox(
    width: mWeight,
  );
}

//Text Field Decoration

InputDecoration myDecoration({
  IconData? mPrefixIcon,
  required String mLabel,
  required String mHint,
  bool isPassword = false,
}) {
  return InputDecoration(
    label: Text(mLabel),
    hintText: mHint,
    prefixIcon: mPrefixIcon != null ? Icon(mPrefixIcon) : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21),
      borderSide: const BorderSide(
        color: ColorConstants.mattBlackColor,
        width: 1,
      ),
    ),
  );
}

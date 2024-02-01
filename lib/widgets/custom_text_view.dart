import '../../const/dimens.dart';
import '../../const/fonts.dart';
import 'package:flutter/material.dart';

class TcbTextViewStyle {
  static const String w600sSmallFontText = "w600sSmallFText";
  static const String w600sMediumFontText = "w600sMediumFText";
  static const String w600sMaxFontText = "w600sMaxFText";

  static const String w400sSmallFontText = "w400sSmallFText";
  static const String w400sMediumFontText = "w400sMediumFText";
  static const String w400sMaxFontText = "w400sMaxFText";

  static const String w600sSmallFontDisplay = "w600sSmallFDisplay";
  static const String w600sMediumFontDisplay = "w600sMediumFDisplay";
  static const String w600sMaxFontDisplay = "w600sMaxFDisplay";

  static const String w400sSmallFontDisplay = "w400sSmallFDisplay";
  static const String w400sMediumFontDisplay = "w400sMediumFDisplay";
  static const String w400sMaxFontDisplay = "w400sMaxFDisplay";

  static const String w400sHighFontDisplay = "w400sHighFontDisplay";
  static const String w600sHighFontDisplay = "w600sHighFontDisplay";
  static const String w400sHighFontText = "w400sHighFontText";
  static const String w600sHighFontText = "w600sHighFontText";
}

class TcbTextView extends StatelessWidget {
  final String text;
  final String style;
  final Color color;
  final double? letterSpacing;

  const TcbTextView(
      {super.key,
      this.style = TcbTextViewStyle.w600sMediumFontText,
      required this.text,
      this.color = Colors.black,
      this.letterSpacing = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style == TcbTextViewStyle.w600sSmallFontText
          ? w600sSmallFontText()
          : style == TcbTextViewStyle.w600sMediumFontText
              ? w600sMediumFontText()
              : style == TcbTextViewStyle.w600sMaxFontText
                  ? w600sMaxFontText()
                  : style == TcbTextViewStyle.w400sSmallFontText
                      ? w400sSmallFontText()
                      : style == TcbTextViewStyle.w400sMediumFontText
                          ? w400sMediumFontText()
                          : style == TcbTextViewStyle.w400sMaxFontText
                              ? w400sMaxFontText()
                              : style == TcbTextViewStyle.w600sSmallFontDisplay
                                  ? w600sSmallFontDisplay()
                                  : style ==
                                          TcbTextViewStyle
                                              .w600sMediumFontDisplay
                                      ? w600sMediumFontDisplay()
                                      : style ==
                                              TcbTextViewStyle
                                                  .w600sMaxFontDisplay
                                          ? w600sMaxFontDisplay()
                                          : style ==
                                                  TcbTextViewStyle
                                                      .w400sSmallFontDisplay
                                              ? w400sSmallFontDisplay()
                                              : style ==
                                                      TcbTextViewStyle
                                                          .w400sMediumFontDisplay
                                                  ? w400sMediumFontDisplay()
                                                  : style ==
                                                          TcbTextViewStyle
                                                              .w400sMaxFontDisplay
                                                      ? w400sMaxFontDisplay()
                                                      : style ==
                                                              TcbTextViewStyle
                                                                  .w400sHighFontDisplay
                                                          ? w400sHighFontDisplay()
                                                          : style ==
                                                                  TcbTextViewStyle
                                                                      .w600sHighFontDisplay
                                                              ? w600sHighFontDisplay()
                                                              : style ==
                                                                      TcbTextViewStyle
                                                                          .w400sHighFontText
                                                                  ? w400sHighFontText()
                                                                  : w600sHighFontText(),
    );
  }

  TextStyle w600sSmallFontText() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.fontSmall,
        fontFamily: Fonts.sfProText,
        letterSpacing: letterSpacing);
  }

  TextStyle w600sMediumFontText() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.fontMedium,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProText);
  }

  TextStyle w600sMaxFontText() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.fontMax,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProText);
  }

  TextStyle w400sSmallFontText() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontSmall,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProText);
  }

  TextStyle w400sMediumFontText() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontMedium,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProText);
  }

  TextStyle w400sMaxFontText() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontMax,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProText);
  }

  TextStyle w600sSmallFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.fontSmall,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w600sMediumFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.fontMedium,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w600sMaxFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacing,
        fontSize: Dimens.fontMax,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w400sSmallFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontSmall,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w400sMediumFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontMedium,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w400sMaxFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontMax,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w400sHighFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontHigh,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w600sHighFontDisplay() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.fontHigh,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProDisplay);
  }

  TextStyle w400sHighFontText() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.fontHigh,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProText);
  }

  TextStyle w600sHighFontText() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.fontHigh,
        letterSpacing: letterSpacing,
        fontFamily: Fonts.sfProText);
  }
}

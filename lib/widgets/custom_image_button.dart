import '.././const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const/dimens.dart';

int lastTimeClick = 0;

class ImageButton extends StatelessWidget {
  final String image;
  final Function? onClick;
  final double? width;
  final double? height;
  final int? color;
  final String? text;
  final int? textColor;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double padding;
  final double radiusBorderClick;

  const ImageButton(
      {super.key,
      required this.image,
      this.height = 24,
      this.onClick,
      this.width = 24,
      this.padding = 0,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.fontFamily,
      this.fontSize = Dimens.fontMedium,
      this.textColor,
      this.text,
      this.radiusBorderClick = 16});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (DateTime.now().millisecondsSinceEpoch - lastTimeClick < 1500) {
            return;
          }
          lastTimeClick = DateTime.now().millisecondsSinceEpoch;
          if (onClick != null) {
            onClick!();
          }
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusBorderClick),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: image.contains("png")
                  ? Image.asset(
                      image,
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                      color: color != null ? Color(color!) : null,
                    )
                  : SvgPicture.asset(
                      image,
                      height: height,
                      width: width,
                      fit: BoxFit.cover,
                    ),
            ),
            if (text != null)
              Text(
                text!,
                textAlign: textAlign ?? TextAlign.right,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: textColor != null ? Color(textColor!) : null,
                  fontSize: fontSize,
                  fontFamily: fontFamily ?? Fonts.sfProText,
                  fontWeight: fontWeight,
                  // height: 0.08,
                  // letterSpacing: -0.43,
                ),
              )
          ],
        ),
      ),
    );
  }
}

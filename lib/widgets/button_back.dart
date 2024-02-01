import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/image_assets.dart';
import '../const/strings.dart';
import 'custom_image_button.dart';

class TcbBackButton extends StatelessWidget {
  final double width;
  final double height;
  final String image;

  const TcbBackButton(
      {super.key,
      this.width = 24,
      this.height = 24,
      this.image = ImageAssetsUtil.arrowBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 4,
        ),
        ImageButton(
          padding: 12,
          width: width,
          height: height,
          image: image,
          onClick: () async {
            if (Platform.isAndroid) {
              await AppConfig.platform.invokeMethod("onBack");
            } else {
              SystemNavigator.pop();
            }
          },
        )
      ],
    );
  }
}

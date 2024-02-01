import '../../../const/image_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../const/dimens.dart';
import '../const/fonts.dart';

class NumberKeyBoard extends StatefulWidget {
  final bool isShowButton000;
  final Function? onDone;
  final TextEditingController textEditingController;

  const NumberKeyBoard(
      {super.key,
      required this.isShowButton000,
      required this.textEditingController,
      this.onDone});

  @override
  State<StatefulWidget> createState() => NumberKeyBoardState();
}

class NumberKeyBoardState extends State<NumberKeyBoard> {
  late bool isShowButton000;
  Function? onDone;
  late TextEditingController textEditingController;
  bool isEnableButtonDone = false;

  @override
  void initState() {
    isShowButton000 = widget.isShowButton000;
    onDone = widget.onDone;
    textEditingController = widget.textEditingController;
    textEditingController.addListener(() {
      if (textEditingController.text.isNotEmpty) {
        setState(() {
          isEnableButtonDone = true;
        });
      } else {
        setState(() {
          isEnableButtonDone = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFD3D4D9)),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "1",
                onClick: () => onClick("1"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "4",
                onClick: () => onClick("4"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "7",
                onClick: () => onClick("7"),
              ),
              const SizedBox(
                height: 7,
              ),
              if (isShowButton000)
                NumberKeyboardButton(
                  text: "000",
                  onClick: () => onClick("000"),
                ),
              if (!isShowButton000)
                const SizedBox(
                  height: 46,
                ),
              const SizedBox(
                height: 7,
              ),
            ],
          ),
          const SizedBox(
            width: 7,
          ),
          Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "2",
                onClick: () => onClick("2"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "5",
                onClick: () => onClick("5"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "8",
                onClick: () => onClick("8"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "0",
                onClick: () => onClick("0"),
              ),
              const SizedBox(
                height: 7,
              ),
            ],
          ),
          const SizedBox(
            width: 7,
          ),
          Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "3",
                onClick: () => onClick("3"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "6",
                onClick: () => onClick("6"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "9",
                onClick: () => onClick("9"),
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: ".",
                onClick: () => onClick("."),
              ),
              const SizedBox(
                height: 7,
              ),
            ],
          ),
          const SizedBox(
            width: 7,
          ),
          Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "Del",
                onClick: () => onClick("Del"),
                height: 99,
              ),
              const SizedBox(
                height: 7,
              ),
              NumberKeyboardButton(
                text: "Done",
                onClick: () => onClick("Done"),
                isEnableButtonDone: isEnableButtonDone,
                height: 99,
              ),
              const SizedBox(
                height: 7,
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }

  onClick(String text) {
    if (text.toLowerCase() == "del") {
      textEditingController.text = textEditingController.text.isNotEmpty
          ? textEditingController.text
              .substring(0, textEditingController.text.length - 1)
          : "";
    } else if (text.toLowerCase() == "done") {
      if (onDone != null) {
        onDone!();
      }
    } else {
      textEditingController.text += text;
    }
  }
}

class NumberKeyboardButton extends StatefulWidget {
  final String text; //text=='delete' => button Delete
  final Function onClick;
  final double width;
  final double height;
  final bool isEnableButtonDone;

  const NumberKeyboardButton(
      {super.key,
      required this.text,
      required this.onClick,
      this.width = 86,
      this.height = 46,
      this.isEnableButtonDone = false});

  @override
  State<StatefulWidget> createState() => NumberKeyboardButtonState();
}

class NumberKeyboardButtonState extends State<NumberKeyboardButton> {
  late String text; //text=='delete' => button Delete
  late Function onClick;
  late double width;
  late double height;
  late bool isEnableButtonDone;

  @override
  Widget build(BuildContext context) {
    setState(() {
      text = widget.text;
      onClick = widget.onClick;
      width = widget.width;
      height = widget.height;
      isEnableButtonDone = widget.isEnableButtonDone;
    });
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: text.toLowerCase() == "del"
            ? const Color.fromARGB(255, 173, 178, 189)
            : text.toLowerCase() == "done"
                ? isEnableButtonDone
                    ? const Color.fromARGB(255, 10, 132, 255)
                    : const Color.fromARGB(255, 173, 178, 189)
                : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (text.toLowerCase() == "done" && !isEnableButtonDone)
              ? null
              : () {
                  onClick();

                  if (kDebugMode) {
                    print(text);
                  }
                },
          child: Center(
            child: text.toLowerCase() == "done"
                ? const Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimens.fontKeyBoardDone,
                      fontFamily: Fonts.sfProText,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.41,
                    ),
                  )
                : text.toLowerCase() == "del"
                    ? Row(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          SvgPicture.asset(
                            ImageAssetsUtil.delete,
                            width: 24,
                            height: 18,
                            fit: BoxFit.fill,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      )
                    : Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: Dimens.fontKeyBoard,
                          fontFamily: Fonts.sfProDisplay,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.29,
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}

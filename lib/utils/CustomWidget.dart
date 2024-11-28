import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';

Widget getUnderlineText(String text, Color color, int maxLine,
    TextAlign textAlign, FontWeight fontWeight, double textSizes) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: textSizes,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight),
    maxLines: maxLine,
    textAlign: textAlign,
  );
}

Widget getBottomText(BuildContext context, String s, Function function) {
  double bottomHeight = getScreenPercentSize(context, 7.6);
  double radius = getPercentSize(bottomHeight, 18);

  return InkWell(
    child: Container(
      height: bottomHeight,
      margin: EdgeInsets.symmetric(
          horizontal: getPercentSize(bottomHeight, 50),
          vertical: getPercentSize(bottomHeight, 15)),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Center(
        child: getTextWidget(
          s,
          Colors.white,
          getPercentSize(bottomHeight, 30),
          FontWeight.bold,
          TextAlign.start,
        ),
      ),
    ),
    onTap: () {
      function();
    },
  );
}

getOutLineBorder(double radius) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    borderSide: BorderSide(color: Colors.white, width: 2),
  );
}

Widget getTextWithFontFamilyWidget(String string, Color color, double size,
    FontWeight fontWeight, TextAlign align) {
  return Text(string,
      textAlign: align,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          decoration: TextDecoration.none,
          fontFamily: customFontFamily,
          color: color));
}

Widget getSplashTextWidget(String string, Color color, double size,
    FontWeight fontWeight, TextAlign align) {
  return Text(string,
      textAlign: align,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          decoration: TextDecoration.none,
          fontFamily: 'Sniglet',
          color: color));
}

Widget getTextWidget(String string, Color color, double size,
    FontWeight fontWeight, TextAlign align) {
  return Text(string,
      textAlign: align,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          decoration: TextDecoration.none,
          fontFamily: fontFamily,
          color: color));
}

Widget getTextWidgetWithSpacing(String text, Color color, TextAlign textAlign,
    FontWeight fontWeight, double textSizes) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: textSizes,
        color: color,
        height: 1.5,
        fontFamily: fontFamily,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Color getOrderColor(String s) {
  if (s.contains('On Delivery')) {
    return primaryColor.withOpacity(0.2);
  } else if (s.contains('Completed')) {
    return Colors.lightGreen;
  } else {
    return Colors.redAccent;
  }
}

double getHorizontalSpace(BuildContext context) {
  return getWidthPercentSize(context, 4);
}

Color getIconColor(String s) {
  if (s.contains('On Delivery')) {
    return primaryColor;
  } else {
    return Colors.white;
  }
}

Widget getTextWidgetWithSpacing1(String text, Color color, TextAlign textAlign,
    FontWeight fontWeight, double textSizes) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: textSizes,
        color: color,
        height: 1.3,
        fontFamily: fontFamily,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget getLineTextView(String s, var color, var fontSize) {
  return Text(
    s,
    maxLines: 1,
    style: TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      decorationColor: (s.isNotEmpty) ? color : Colors.transparent,
      decorationStyle: TextDecorationStyle.solid,
      decoration: TextDecoration.lineThrough,
      fontSize: fontSize,
    ),
  );
}

Widget getSpaceTextWidget(String text, Color color, TextAlign textAlign,
    FontWeight fontWeight, double textSizes) {
  return Text(
    text,
    style: TextStyle(
        height: 1.5,
        decoration: TextDecoration.none,
        fontSize: textSizes,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget getCustomTextWithFontFamilyWidget(String string, Color color,
    double size, FontWeight fontWeight, TextAlign align, int maxLine) {
  return Text(string,
      textAlign: align,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          fontFamily: customFontFamily,
          color: color));
}

Widget getCustomTextWidget(String string, Color color, double size,
    FontWeight fontWeight, TextAlign align, int maxLine) {
  return Text(string,
      textAlign: align,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          fontFamily: fontFamily,
          color: color));
}

double getScreenPercentSize(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.height * percent) / 100;
}

double getWidthPercentSize(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.width * percent) / 100;
}

double getPercentSize(double total, double percent) {
  return (total * percent) / 100;
}

Widget getPrescriptionDesc(BuildContext context, String s,
    TextEditingController textEditingController) {
  double height = getScreenPercentSize(context, 8.5);

  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 27);
  FocusNode myFocusNode = FocusNode();
  bool isAutoFocus = false;
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      padding:
          EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 2)),
      alignment: Alignment.topRight,
      decoration: ShapeDecoration(
        color: cellColor,
        shape: SmoothRectangleBorder(
          side: BorderSide(
              color: isAutoFocus ? primaryColor : borderColor, width: 1),
          borderRadius: SmoothBorderRadius(
            cornerRadius: radius,
            cornerSmoothing: 0.8,
          ),
        ),
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              isAutoFocus = true;
              myFocusNode.canRequestFocus=true;
            });
          } else {
            setState(() {
              isAutoFocus = false;
              myFocusNode.canRequestFocus=false;
            });
          }
        },
        child: TextField(
          maxLines: 6,
          focusNode: myFocusNode,
          autofocus: isAutoFocus,
          controller: textEditingController,
          style: TextStyle(
              fontFamily: fontFamily,
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: fontSize),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: height / 3.1),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: s,
              hintStyle: TextStyle(
                  fontFamily: fontFamily,
                  color: subTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize)),
        ),
      ),
    );
  });
}

Widget getDefaultTextFiledWithoutIconWidget(BuildContext context, String s,
    TextEditingController textEditingController) {
  double height = getScreenPercentSize(context, 7);

  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 27);
  FocusNode myFocusNode = FocusNode();
  bool isAutoFocus = false;
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        height: height,
        margin:
            EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
        padding:
            EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 4)),
        alignment: Alignment.centerLeft,
        decoration: ShapeDecoration(
          color: alphaColor,
          shape: SmoothRectangleBorder(
            side: BorderSide(
                color: isAutoFocus ? primaryColor : borderColor, width: 1),
            borderRadius: SmoothBorderRadius(
              cornerRadius: radius,
              cornerSmoothing: 0.8,
            ),
          ),
        ),
        child: Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              setState(() {
                isAutoFocus = true;
                myFocusNode.canRequestFocus=true;
              });
            } else {
              setState(() {
                isAutoFocus = false;
                myFocusNode.canRequestFocus=false;
              });
            }
          },
          child: TextField(
            maxLines: 1,
            controller: textEditingController,
            autofocus: false,
            focusNode: myFocusNode,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontFamily: fontFamily,
                color: textColor,
                fontWeight: FontWeight.w400,
                fontSize: fontSize),
            decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(bottom: getPercentSize(height, 35)),
                border: InputBorder.none,
                isDense: true,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: s,
                hintStyle: TextStyle(
                    fontFamily: fontFamily,
                    color: subTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize)),
          ),
        ),
      );
    },
  );
}

Widget getEditProfileTextFiledWidget(BuildContext context, String s,
    TextEditingController textEditingController) {
  double height = getScreenPercentSize(context, 7);

  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 27);
  FocusNode myFocusNode = FocusNode();
  bool isAutoFocus = false;
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      height: height,
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        color: cellColor,
        shape: SmoothRectangleBorder(
          side: BorderSide(
              color: isAutoFocus ? primaryColor : borderColor, width: 1),
          borderRadius: SmoothBorderRadius(
            cornerRadius: radius,
            cornerSmoothing: 0.8,
          ),
        ),
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              isAutoFocus = true;
              myFocusNode.canRequestFocus = true;
            });
          } else {
            setState(() {
              isAutoFocus = false;
              myFocusNode.canRequestFocus = false;
            });
          }
        },
        child: TextField(
          focusNode: myFocusNode,
          autofocus: false,
          maxLines: 1,
          controller: textEditingController,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              fontFamily: fontFamily,
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: fontSize),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: getWidthPercentSize(context, 4)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: s,
              suffixIcon: Icon(
                Icons.add,
                color: Colors.transparent,
                size: getPercentSize(height, 40),
              ),
              hintStyle: TextStyle(
                  fontFamily: fontFamily,
                  color: subTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize)),
        ),
      ),
    );
  });
}

Widget getDefaultTextFiledWidget(BuildContext context, String s, var icon,
    TextEditingController textEditingController) {
  double height = getScreenPercentSize(context, 7);

  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 27);
  FocusNode myFocusNode = FocusNode();

  Color color = borderColor;


  return StatefulBuilder(
    builder: (context, setState) {
      myFocusNode.addListener((){

        print('focus---${myFocusNode.hasFocus}---$s');


        setState((){
          if(myFocusNode.hasFocus){
            color=primaryColor;
          }else{
            color = borderColor;
          }
        });

      });
      return Container(
        height: height,
        margin:
            EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
        alignment: Alignment.centerLeft,

        decoration: ShapeDecoration(
          color: cellColor,
          shape: SmoothRectangleBorder(
            side: BorderSide(
                color: color, width: 1

            ),
            borderRadius: SmoothBorderRadius(
              cornerRadius: radius,
              cornerSmoothing: 0.8,
            ),
          ),
        ),

        // decoration: BoxDecoration(
        //   color: cellColor,
        //   border: Border.all(color: subTextColor,width: 0.3),
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(radius),
        //   ),
        // ),
        child: Focus(
          onFocusChange: (hasFocus) {
            // if (hasFocus) {
            //   setState(() {
            //     isAutoFocus = true;
            //     // myFocusNode.canRequestFocus=true;
            //   });
            // } else {
            //   setState(() {
            //     isAutoFocus = false;
            //     // myFocusNode.canRequestFocus=false;
            //   });
            // }
          },
          child: TextFormField(
            focusNode: myFocusNode,
            maxLines: 1,
            // autofocus: isAutoFocus,
            controller: textEditingController,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontFamily: fontFamily,
                color: textColor,
                fontWeight: FontWeight.w400,
                fontSize: fontSize),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: getWidthPercentSize(context, 4)),
                border: OutlineInputBorder(),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: s,
                suffixIcon: Icon(
                  icon,
                  color: subTextColor,
                  size: getPercentSize(height, 40),
                ),
                isDense: true,
                hintStyle: TextStyle(
                    fontFamily: fontFamily,
                    color: subTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize)),
          ),
        ),
      );
    },
  );
}

Widget getHorizonSpace(double space) {
  return SizedBox(
    width: space,
  );
}

getDefaultDecorationWithColor(Color color, double radius) {
  return ShapeDecoration(
    color: color,
    shape: SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
}

Widget getCellMaterialWidget(
    BuildContext context, Widget widget, double radius, double height) {
  return Material(
    color: Colors.transparent,

    shadowColor: primaryColor.withOpacity(0.4),
    elevation: getPercentSize(height, 35),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    child: widget,
  );
}

Widget getAddMaterialWidget(
    BuildContext context, Widget widget, double radius, double height) {
  return Material(
    color: Colors.transparent,

    shadowColor: primaryColor.withOpacity(0.3),
    elevation: getPercentSize(height, 25),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    child: widget,
  );
}


Widget getMaterialWidget(
    BuildContext context, Widget widget, double radius, double height) {
  return Material(
    color: Colors.transparent,

    shadowColor: primaryColor.withOpacity(0.3),
    elevation: getPercentSize(height, 35),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    child: widget,
  );
}

Widget getMaterialCell(BuildContext context, {Widget? widget}) {
  return Material(
    color: Colors.transparent,
    // shadowColor: 'EAE7F2'.toColor(),
    shadowColor: primaryColor.withOpacity(0.1),
    elevation: getScreenPercentSize(context, 5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(getScreenPercentSize(context, 1)))),
    child: widget,
  );
}

Widget getSubMaterialCell(BuildContext context, {Widget? widget}) {
  return Material(
    color: Colors.transparent,
    // shadowColor: 'EAE7F2'.toColor(),
    shadowColor: primaryColor.withOpacity(0.08),
    elevation: getScreenPercentSize(context, 2),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(getScreenPercentSize(context, 01)))),
    child: widget,
  );
}

getDecorationWithColor(double radius, Color color) {
  return ShapeDecoration(
    color: color,
    // shadows: [
    //   BoxShadow(
    //       color: color.withOpacity(0.3),
    //       blurRadius: 2,
    //       spreadRadius: 1,
    //       offset: Offset(0, 1))
    // ],
    shape: SmoothRectangleBorder(
      side: BorderSide(color: iconColor, width: 0.1),
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
}

getDecorationWithColorRadius(double radius, Color color) {
  return ShapeDecoration(
    color: backgroundColor,
    shadows: [
      BoxShadow(
          color: color.withOpacity(0.3),
          blurRadius: 4,
          spreadRadius: 4,
          offset: Offset(0, 4))
    ],
    shape: SmoothRectangleBorder(
      side: BorderSide(color: iconColor, width: 0.1),
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
}

getAppBar(BuildContext context, String s,
    {bool? isBack, Function? function, Widget? widget}) {
  return Material(
    elevation: getScreenPercentSize(context, 1.5),
    shadowColor: primaryColor.withOpacity(0.1),
    child: Container(
      color: backgroundColor,
      height: getScreenPercentSize(context, 7),
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: getTextWithFontFamilyWidget(
                s,
                textColor,
                getScreenPercentSize(context, 3),
                FontWeight.w500,
                TextAlign.center),
          ),
          //
          Visibility(
            visible: (isBack != null),
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getHorizontalSpace(context)),
                    child: InkWell(
                        onTap: () {
                          if (function != null) {
                            function();
                          }
                        },
                        child: Image.asset(
                          '${assetsPath}back.png',
                          height: getScreenPercentSize(context, 2.5),
                          color: textColor,
                        ))),
              ),
            ),
          ),

          Visibility(
            visible: (widget != null),
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getHorizontalSpace(context)),
                    child: widget),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

getDecorationWithRadius(double radius, Color color) {
  return ShapeDecoration(
    color: backgroundColor,
    // shadows: [
    //   BoxShadow(
    //       color: color.withOpacity(0.1),
    //       blurRadius: 4,
    //       spreadRadius: 4,
    //       offset: Offset(0, 4))
    // ],
    shape: SmoothRectangleBorder(
      side: BorderSide(color: iconColor, width: 0.1),
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
  // return BoxDecoration(
  //     color: backgroundColor,
  //     border: Border.all(color: iconColor, width: 0.1),
  //     borderRadius: BorderRadius.circular(radius),
  //     boxShadow: [
  //       BoxShadow(
  //           color: shadowColor.withOpacity(0.3),
  //           blurRadius: 3,
  //           spreadRadius: 1,
  //           offset: Offset(0, 1))
  // ]);
}

getDecorationWithBorder(double radius, {Color? color}) {
  return ShapeDecoration(
    color: backgroundColor,
    shadows: [
      BoxShadow(
          color: subTextColor.withOpacity(0.1),
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(0, 1))
    ],
    shape: SmoothRectangleBorder(
      side: BorderSide(color: (color == null) ? borderColor : color, width: 1),
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
  // return BoxDecoration(
  //     color: backgroundColor,
  //     border: Border.all(color: iconColor, width: 0.1),
  //     borderRadius: BorderRadius.circular(radius),
  //     boxShadow: [
  //       BoxShadow(
  //           color: shadowColor.withOpacity(0.3),
  //           blurRadius: 3,
  //           spreadRadius: 1,
  //           offset: Offset(0, 1))
  // ]);
}

getDecoration(double radius) {
  return ShapeDecoration(
    color: backgroundColor,
    // shadows: [
    //   BoxShadow(
    //       color: subTextColor.withOpacity(0.1),
    //       blurRadius: 22,
    //       spreadRadius: 1,
    //       offset: Offset(0, 1))
    // ],
    shape: SmoothRectangleBorder(
      side: BorderSide(color: iconColor, width: 0.1),
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 0.8,
      ),
    ),
  );
  // return BoxDecoration(
  //     color: backgroundColor,
  //     border: Border.all(color: iconColor, width: 0.1),
  //     borderRadius: BorderRadius.circular(radius),
  //     boxShadow: [
  //       BoxShadow(
  //           color: shadowColor.withOpacity(0.3),
  //           blurRadius: 3,
  //           spreadRadius: 1,
  //           offset: Offset(0, 1))
  // ]);
}

Widget getCellWidget(
    BuildContext context, String s, var icon, Function function) {
  double height = getScreenPercentSize(context, 7);

  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 25);

  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      height: height,
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: cellColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: TextField(
        maxLines: 1,
        enabled: false,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: fontSize),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getWidthPercentSize(context, 2)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: s,
            suffixIcon: Icon(
              icon,
              color: subTextColor,
              size: getPercentSize(height, 40),
            ),
            hintStyle: TextStyle(
                fontFamily: fontFamily,
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize)),
      ),
    ),
  );
}

Widget getDisableTextFiledWidget(BuildContext context, String s, var icon,
    TextEditingController textEditingController, Function function) {
  double height = getScreenPercentSize(context, 7);

  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 25);

  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      height: height,
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: cellColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: TextField(
        maxLines: 1,
        enabled: false,
        controller: textEditingController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: fontSize),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getWidthPercentSize(context, 2)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: s,
            suffixIcon: Icon(
              icon,
              color: subTextColor,
              size: getPercentSize(height, 40),
            ),
            hintStyle: TextStyle(
                fontFamily: fontFamily,
                color: textColor,
                fontWeight: FontWeight.w400,
                fontSize: fontSize)),
      ),
    ),
  );
}

Widget getBackIcon(BuildContext context, Function function) {
  double appBarHeight = getScreenPercentSize(context, 6);

  return Align(
    alignment: Alignment.centerLeft,
    child: InkWell(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: appBarHeight,
        width: appBarHeight,
        decoration: BoxDecoration(
            color: cellColor,
            borderRadius: BorderRadius.all(
                Radius.circular(getPercentSize(appBarHeight, 25)))),
        child: Icon(
          Icons.keyboard_backspace,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget getPasswordTextFiled(BuildContext context, String s,
    TextEditingController textEditingController) {
  double height = getScreenPercentSize(context, 7);
  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 27);

  FocusNode myFocusNode = FocusNode();
  bool isAutoFocus = false;
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
          height: height,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
              vertical: getScreenPercentSize(context, 1.2)),
          decoration: ShapeDecoration(
            color: cellColor,
            shape: SmoothRectangleBorder(
              side: BorderSide(
                  color: isAutoFocus ? primaryColor : borderColor, width: 1),
              borderRadius: SmoothBorderRadius(
                cornerRadius: radius,
                cornerSmoothing: 0.8,
              ),
            ),
          ),
          child: Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus) {
                setState(() {
                  isAutoFocus = true;
                  myFocusNode.canRequestFocus=true;
                });
              } else {
                setState(() {
                  isAutoFocus = false;
                  myFocusNode.canRequestFocus=false;
                });
              }
            },
            child: TextField(
              maxLines: 1,
              focusNode: myFocusNode,
              obscureText: true,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              controller: textEditingController,
              style: TextStyle(
                  fontFamily: fontFamily,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: getWidthPercentSize(context, 4)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: s,
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: subTextColor,
                    size: getPercentSize(height, 40),
                  ),
                  hintStyle: TextStyle(
                      fontFamily: fontFamily,
                      color: subTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: fontSize)),
            ),
          ));
    },
  );
}

Widget getButtonWidget(
    BuildContext context, String s, var color, Function function) {
  double height = getScreenPercentSize(context, 7);
  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 30);

  return InkWell(
    child: Material(
      color: Colors.transparent,
      shadowColor: primaryColor.withOpacity(0.3),
      elevation: getPercentSize(height, 45),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(getPercentSize(radius, 85)))),
      child: Container(
        height: height,
        margin: EdgeInsets.only(
            top: getScreenPercentSize(context, 1.2),
            bottom: getHorizontalSpace(context),
            left: getHorizontalSpace(context),
            right: getHorizontalSpace(context)),
        decoration: ShapeDecoration(
          color: color,
          // shadows: [
          // BoxShadow(
          //     color: color.withOpacity(0.4),
          //   spreadRadius: 4,
          //   // blurRadius: 5,
          //   blurRadius: 25,
          //   offset: Offset(0, 7),
          // )

          // BoxShadow(
          //     color: color.withOpacity(0.2),
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //     offset: Offset(0, 5))
          // ],

          shape: SmoothRectangleBorder(
            side: BorderSide(color: subTextColor, width: 0.3),
            borderRadius: SmoothBorderRadius(
              cornerRadius: radius,
              cornerSmoothing: 0.8,
            ),
          ),
        ),
        child: Center(
            child: getDefaultTextWidget(
                s, TextAlign.center, FontWeight.w500, fontSize, Colors.white)),
      ),
    ),
    onTap: () {
      function();
    },
  );
}

Widget getButtonWithoutSpaceWidget(
    BuildContext context, String s, var color, Function function) {
  double height = getScreenPercentSize(context, 7);
  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 30);

  return InkWell(
    child: Material(
      color: Colors.transparent,
      shadowColor: primaryColor.withOpacity(0.3),
      elevation: getPercentSize(height, 45),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(getPercentSize(radius, 85)))),
      child: Container(
        height: height,
        margin: EdgeInsets.only(
          bottom: getScreenPercentSize(context, 1.5),
        ),
        decoration: ShapeDecoration(
          color: color,
          // shadows: [
          // BoxShadow(
          //     color: color.withOpacity(0.4),
          //   spreadRadius: 4,
          //   // blurRadius: 5,
          //   blurRadius: 25,
          //   offset: Offset(0, 7),
          // )

          // BoxShadow(
          //     color: color.withOpacity(0.2),
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //     offset: Offset(0, 5))
          // ],

          shape: SmoothRectangleBorder(
            side: BorderSide(color: subTextColor, width: 0.3),
            borderRadius: SmoothBorderRadius(
              cornerRadius: radius,
              cornerSmoothing: 0.8,
            ),
          ),
        ),
        child: Center(
            child: getDefaultTextWidget(
                s, TextAlign.center, FontWeight.w500, fontSize, Colors.white)),
      ),
    ),
    onTap: () {
      function();
    },
  );
}

Widget getAddButtonWidget(
    BuildContext context, String s, var color, Function function) {
  double height = getScreenPercentSize(context, 7);
  double radius = getPercentSize(height, 20);
  double fontSize = getPercentSize(height, 30);

  return InkWell(
    child: Container(
      height: height,
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      decoration: ShapeDecoration(
        color: '#F9F6FF'.toColor(),
        // shadows: [
        //   BoxShadow(
        //       color: color.withOpacity(0.2),
        //       blurRadius: 5,
        //       spreadRadius: 5,
        //       offset: Offset(0, 5))
        // ],

        shape: SmoothRectangleBorder(
          side: BorderSide(color: borderColor, width: 0.3),
          borderRadius: SmoothBorderRadius(
            cornerRadius: radius,
            cornerSmoothing: 0.8,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: primaryColor,
            size: (fontSize),
          ),
          SizedBox(
            width: (fontSize / 2),
          ),
          getTextWithFontFamilyWidget(
            s,
            primaryColor,
            fontSize,
            FontWeight.w400,
            TextAlign.center,
          ),
        ],
      ),
    ),
    onTap: () {
      function();
    },
  );
}

Widget getDefaultTextWidget(String s, TextAlign textAlign,
    FontWeight fontWeight, double fontSize, var color) {
  return Text(
    s,
    textAlign: textAlign,
    style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color),
  );
}

Widget getBlueButton(BuildContext context, Function function, String s) {
  double height = getScreenPercentSize(context, 7);
  double radius = getPercentSize(height, 25);
  double textSize = getPercentSize(height, 30);
  return SizedBox(
    height: height,
    child: GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Center(
            child: getTextWidget(
                s, Colors.white, textSize, FontWeight.w500, TextAlign.center)),
      ),
    ),
  );
}

Widget getButton(BuildContext context, Function function, String s) {
  double height = getScreenPercentSize(context, 6);
  double radius = getPercentSize(height, 12);
  double textSize = getPercentSize(height, 40);
  return SizedBox(
    height: height,
    child: GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Center(
            child: getTextWidget(
                s, Colors.white, textSize, FontWeight.w400, TextAlign.center)),
      ),
    ),
  );
}

Widget getBorderButton(BuildContext context, Function function, String s) {
  double height = getScreenPercentSize(context, 6);
  double radius = getPercentSize(height, 12);
  double textSize = getPercentSize(height, 40);
  return SizedBox(
    height: height,
    child: GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: primaryColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Center(
            child: getTextWidget(
                s, primaryColor, textSize, FontWeight.w100, TextAlign.center)),
      ),
    ),
  );
}

Widget getAppBarIcon() {
  return Icon(
    Icons.keyboard_backspace_outlined,
    color: textColor,
  );
}

Widget getAppBarText(BuildContext context, String s) {
  return getCustomTextWithoutAlign(
      s, textColor, FontWeight.bold, getScreenPercentSize(context, 2));
}

Widget getCustomTextWithoutAlignWithFontFamily(
    String text, Color color, FontWeight fontWeight, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: customFontFamily,
        decoration: TextDecoration.none,
        fontWeight: fontWeight),
  );
}

Widget getCustomTextWithoutAlign(
    String text, Color color, FontWeight fontWeight, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: fontWeight),
  );
}

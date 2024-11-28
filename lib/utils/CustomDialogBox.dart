import 'package:flutter/material.dart';

import 'Constant.dart';
import 'CustomWidget.dart';


class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;
  final Function? func;

  const CustomDialogBox(
      {super.key, this.title, this.descriptions, this.text, this.img, this.func});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: padding,
              top: avatarRadius ,
              right: padding,
              bottom: padding),
          // margin: EdgeInsets.only(top: avatarRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                '${assetsPath}user 1.png',
                height: getScreenPercentSize(context,12),
                // color: textColor,
              )

              ,
              SizedBox(
                height: getScreenPercentSize(context, 3),
              ),
              getCustomTextWithFontFamilyWidget(widget.title!, textColor, getScreenPercentSize(context, 2.5)
                  , FontWeight.w400,
                  TextAlign.center, 1),
              SizedBox(
                height: getScreenPercentSize(context, 1.5),
              ),
              getCustomTextWidget('Your account has been successfully created!', textColor, getScreenPercentSize(context, 2),
                  FontWeight.normal, TextAlign.center, 2),
              SizedBox(
                height: getScreenPercentSize(context, 4),
              ),

              getButtonWithoutSpaceWidget(context, 'Ok', primaryColor, (){
                Navigator.of(context).pop();
                widget.func!();
              }),

              SizedBox(
                height: getScreenPercentSize(context, 2),
              ),


            ],
          ),
        ),

      ],
    );
  }
}




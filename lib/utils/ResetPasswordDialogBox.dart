import 'package:flutter/material.dart';

import 'Constant.dart';
import 'CustomWidget.dart';

class ResetPasswordDialogBox extends StatefulWidget {
  final Function? func;

  const ResetPasswordDialogBox({super.key, this.func});

  @override
  _ResetPasswordDialogBoxState createState() => _ResetPasswordDialogBoxState();
}

class _ResetPasswordDialogBoxState extends State<ResetPasswordDialogBox> {
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
          padding:
              EdgeInsets.only(left: padding, right: padding, bottom: padding),
          margin: EdgeInsets.only(top: avatarRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                '${assetsPath}lock.png',
                height: getScreenPercentSize(context, 12),
              ),
              SizedBox(
                height: getScreenPercentSize(context, 5),
              ),
              getCustomTextWithFontFamilyWidget('Password Changed', textColor, getScreenPercentSize(context, 3),
                  FontWeight.w500, TextAlign.center, 1),
              SizedBox(
                height: getScreenPercentSize(context, 1.7),
              ),
              getCustomTextWidget('Your password has been successfully changed!',
                  textColor, getScreenPercentSize(context, 2), FontWeight.w400, TextAlign.center, 2),
              SizedBox(
                height: getScreenPercentSize(context, 5),
              ),

              getButtonWithoutSpaceWidget(context, 'Ok',primaryColor, (){
                Navigator.of(context).pop();
                widget.func!();
              }),

              SizedBox(
                height: getScreenPercentSize(context, 1.5),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

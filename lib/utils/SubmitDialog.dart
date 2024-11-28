import 'package:flutter/material.dart';

import 'Constant.dart';
import 'CustomWidget.dart';

class SubmitDialog extends StatefulWidget {
  final Function? func;

  const SubmitDialog({super.key, this.func});

  @override
  _SubmitDialogState createState() => _SubmitDialogState();
}

class _SubmitDialogState extends State<SubmitDialog> {
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
                '${assetsPath}user 1.png',
                height: getScreenPercentSize(context, 12),
                // color: primaryColor,
              ),
              SizedBox(
                height: getScreenPercentSize(context, 5),
              ),
              getCustomTextWithFontFamilyWidget('Your Request has been\nsubmitted',
                  textColor, getScreenPercentSize(context, 2.2),
                  FontWeight.w500, TextAlign.center, 2),
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

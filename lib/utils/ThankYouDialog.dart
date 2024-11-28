import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/MainPage.dart';
import 'package:flutter_pet_shop/TrackOrderPage.dart';

import 'Constant.dart';
import 'CustomWidget.dart';




class ThankYouDialog extends StatefulWidget {
  final BuildContext context;
  final ValueChanged<int> onChanged;

  @override
  _ThankYouDialog createState() {
    return _ThankYouDialog();
  }

  const ThankYouDialog(this.context, this.onChanged, {super.key});
}

class _ThankYouDialog extends State<ThankYouDialog> {
  @override
  Widget build(BuildContext context) {
    double height = getScreenPercentSize(context, 70);
    double radius = getPercentSize(height, 2);
    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0.0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: dialogContent(context, setState),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  dialogContent(BuildContext context, var setState) {
    double height = getScreenPercentSize(context, 45);
    double width = getWidthPercentSize(context, 80);
    double radius = getPercentSize(height, 4);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all((radius)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Expanded(child: Container(child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              '${assetsPath}Group.png',
              height: getPercentSize(height, 27),
              width: getPercentSize(height, 27),
            ),
            SizedBox(
              height: getPercentSize(
                height,
                7,
              ),
            ),
            getTextWidget(
                'Order Placed',
                textColor,
              getPercentSize(height, 5  ),
                FontWeight.bold,
                TextAlign.center,
              ) ,


            SizedBox(
              height: getPercentSize(
                height,
                5,
              ),
            ),


            getCustomTextWidget('Your order has been successfully Completed!',
                textColor, getScreenPercentSize(context, 2), FontWeight.w400, TextAlign.center, 2),

            SizedBox(
              height: getPercentSize(
                height,
                9,
              ),
            ),


            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getPercentSize(width, 5)),
              child: Row(

                children: [

                  Expanded(
                    child: InkWell(
                      onTap: (){

                        Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(),
                                  ));

                      },
                      child: getMaterialCell(context,widget: Container(
                        margin: EdgeInsets.only(right: getWidthPercentSize(context,3)),
                        height: getScreenPercentSize(context,7),

                        decoration: ShapeDecoration(

                          color: alphaColor,

                          shape: SmoothRectangleBorder(
                            side: BorderSide(color: primaryColor,width: 2),
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: getScreenPercentSize(context, 1.8),
                              cornerSmoothing: 0.8,
                            ),
                          ),
                        ),





                        child: Center(
                          child: getTextWidget('Ok', primaryColor, getScreenPercentSize(context, 2),
                              FontWeight.w600, TextAlign.center),
                        ),
                      )),
                    ),
                  ),


                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => TrackOrderPage(),
                                              ));
                      },
                      child: getMaterialCell(context,widget: Container(
                        margin: EdgeInsets.only(left: getWidthPercentSize(context,3)),
                        height: getScreenPercentSize(context,7),

                        decoration: ShapeDecoration(

                          color: primaryColor,

                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: getScreenPercentSize(context, 1.8),
                              cornerSmoothing: 0.8,
                            ),
                          ),
                        ),





                        child: Center(
                          child: getTextWidget('Track Order', Colors.white, getScreenPercentSize(context, 2),
                              FontWeight.w600, TextAlign.center),
                        ),
                      )),
                    ),
                  )
                ],
              ),
            )



          ],
        ),)),



        ],
      ),
    );
  }
}

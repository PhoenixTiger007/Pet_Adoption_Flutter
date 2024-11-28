
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  _OrderTrackingPage createState() {
    return _OrderTrackingPage();
  }
}

class _OrderTrackingPage extends State<OrderTrackingPage>
    with SingleTickerProviderStateMixin {
  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

 
  //
  Color color1 = primaryColor;

  @override
  Widget build(BuildContext context) {
    double imageSize = SizeConfig.safeBlockVertical! * 5;
    double leftMargin = SizeConfig.safeBlockVertical! * 1.8;

    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: backgroundColor,

            title: getAppBarText(context,
               'Order Tracking',
                ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: getAppBarIcon(),
                  onPressed: _requestPop,
                );
              },
            ),
          ),
          body: Container(
            margin:
                EdgeInsets.only(top: 10, left: leftMargin, right: leftMargin),
            child: Column(
              children: [
                getMaterialCell(context,widget: Container(
                  margin: EdgeInsets.only(top: 5, bottom: getScreenPercentSize(context,3)),
                  padding: EdgeInsets.all(15),


                  decoration: getDecoration(15),

                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: getCustomTextWidget(
                                  'Delivery Man',
                                  textColor,
                                  10,

                                  FontWeight.w500,
                                  TextAlign.start,
                                  1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: imageSize,
                                  width: imageSize,
                                  // margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          '${assetsPath}hugh.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: getCustomTextWidget(
                                          'Harry Daniels',
                                          textColor,
                                          getScreenPercentSize(context, 1.5),

                                          FontWeight.bold,   TextAlign.start,
                                          1),
                                    ),
                                    RatingBar.builder(
                                      itemSize: 15,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      tapOnlyMode: true,
                                      updateOnDrag: true,
                                      itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 10,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),InkWell(
                        child:  Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(10),

                          // margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cellColor,
                          ),

                          child: Icon(
                            Icons.message,
                            color: textColor,
                            size: 20,
                          ),
                        ),
                        onTap: (){
                          // Navigator.of(context).push(MaterialPageRoute(builder:(context) => ChatScreen(user:chats[0].sender),));

                        },
                      ),
                      InkWell(
                        child:  Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cellColor,
                          ),

                          child: Icon(
                            Icons.call,
                            color: textColor,
                            size: 20,
                          ),
                        ),
                        onTap: (){
                          _callNumber('45454545');

                        },
                      )
                    ],
                  ),
                )),

                // Timeline(children: items, position: TimelinePosition.center)
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      timelineRow('Order Accepted','We have receiving your order','10:32 am',true),
                      timelineRow('Preparing package','We are preparing your order','10:35 am',true),
                      timelineRow('On the way','We are preparing your order','12:32 pm',true),
                      timelineRow('Delivered','Order delivered.','4:00 pm',true),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _callNumber(String s) async {



  }




  Widget timelineRow(String title,String desc,String subTitle,bool isSelect) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: isSelect?(primaryColor):Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Text(''),
              ),
              Container(
                width: 3,
                height: 50,
                decoration: BoxDecoration(
                  color: isSelect?(primaryColor):Colors.grey,
                  shape: BoxShape.rectangle,
                ),
                child: Text(''),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: getScreenPercentSize(context, 2),
                            fontWeight: FontWeight.w500,
                            color: textColor)),

                    SizedBox(height: getScreenPercentSize(context, 0.5),),
                    // Text('$desc',
                    //     style: TextStyle(
                    //         fontFamily: fontFamily,
                    //         fontSize: getScreenPercentSize(context, 1.5),
                    //         fontWeight: FontWeight.w400,
                    //         color: subTextColor)),

                     getCustomTextWidget(loremText, subTextColor, getScreenPercentSize(context, 1.5), FontWeight.w400,
                          TextAlign.start,2),


                    // SizedBox(height: getScreenPercentSize(context, 0.5),),
                    // Text('Delhi , MAHARASHTRA'.toUpperCase(),
                    //     style: TextStyle(
                    //         fontFamily: fontFamily,
                    //         fontSize: getScreenPercentSize(context, 1.5),
                    //         fontWeight: FontWeight.w400,
                    //         color: subTextColor)),
                  ],
                ),
              ),


              SizedBox(width: getWidthPercentSize(context, 2),),

              Text(subTitle,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: getScreenPercentSize(context, 1.8),
                      fontWeight: FontWeight.w500,
                      color: subTextColor)),



            ],
          ),
        ),
      ],
    );
  }



  Widget mapWidget(String text,String subText){
   return Container(
      height: SizeConfig.safeBlockVertical! * 30,
      padding: EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCustomTextWithoutAlign(
                text, textColor, FontWeight.w800, 14),
            Spacer(),
            getCustomTextWidget(subText, textColor, 10,
                FontWeight.w500,TextAlign.start,  1)
          ],
        ),
      ),
    );
  }

  Widget getCheckWidget() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.checkmark_alt,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}



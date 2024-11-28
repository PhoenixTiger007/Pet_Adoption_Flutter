
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/PrefData.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'model/ModelNotification.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  _NotificationList createState() => _NotificationList();
}

class _NotificationList extends State<NotificationList> {
  final List<ModelNotification> _notificationList = DataFile.getNotificationList();
  bool isData = false;

  @override
  void initState() {
    super.initState();

    isDataAvailable();
  }
  isDataAvailable() async {
    isData = await PrefData.getIsCart();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double totalHeight = SizeConfig.safeBlockHorizontal! * 100;
    double itemHeight = getPercentSize(totalHeight, 25);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            toolbarHeight: 0,
            centerTitle: true,
            // title: getTextWidget(
            //     "Notification",
            //     textColor,
            //     getScreenPercentSize(context, 2),
            //     FontWeight.normal,
            //     TextAlign.center),
            // leading: Builder(
            //   builder: (context) {
            //     return InkWell(
            //       onTap: () {
            //         finish();
            //       },
            //       child: Icon(
            //         Icons.keyboard_backspace,
            //         color: textColor,
            //       ),
            //     );
            //   },
            // ),


          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                getAppBar(context, 'Notification',isBack: true,function: (){
                  finish();
                }),
                SizedBox(height: getScreenPercentSize(context, 1),),
                Expanded(flex: 1,
                  child: isData?ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical:getPercentSize(itemHeight, 7)),
                    itemCount: _notificationList.length,
                    itemBuilder: (context, index) {
                      ModelNotification notification = _notificationList[index];
                      return getMaterialCell(context,widget: Container(
                        decoration: getDecorationWithRadius(getScreenPercentSize(context, 1.5),primaryColor),
                        margin:
                        EdgeInsets.symmetric(horizontal: getHorizontalSpace(context),vertical: getPercentSize(itemHeight, 10)),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: getPercentSize(itemHeight, 15),
                            horizontal: getPercentSize(itemHeight, 10)),
                        // height: itemHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getMaterialWidget(context,  Container(
                              margin: EdgeInsets.only(
                                  right: getWidthPercentSize(context,3)),
                              height: getPercentSize(itemHeight, 45),
                              width: getPercentSize(itemHeight, 45),
                              decoration: getDecorationWithColor(getPercentSize(itemHeight, 15), primaryColor),
                              child: Center(
                                child: Image.asset(
                                  '${assetsPath}notifications.png',
                                  height: getPercentSize(itemHeight, 20),
                                  color: Colors.white,
                                ),
                              ),
                            ), getPercentSize(itemHeight, 15), getPercentSize(itemHeight, 45))
                            ,
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [



                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: getCustomTextWithFontFamilyWidget(notification.title, textColor
                                            , getPercentSize(itemHeight, 16), FontWeight.w400, TextAlign.start, 1),),

                                      getCustomTextWidget('2 h ago', subTextColor, getPercentSize(itemHeight,12),
                                          FontWeight.w400, TextAlign.start, 2),

                                    ],
                                  ),
                                  SizedBox(height:getPercentSize(itemHeight, 7)),

                                  getCustomTextWidget(notification.desc, textColor, getPercentSize(itemHeight,15),
                                      FontWeight.w400, TextAlign.start, 2),



                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                    },
                  ):emptyWidget(),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          finish();
          return false;
        });
  }


  emptyWidget(){
    PrefData.setIsNotification(true);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('${assetsPath}bell-1 1.png',height: getScreenPercentSize(context, 20),),
          SizedBox(height: getScreenPercentSize(context, 3),),
          getCustomTextWithFontFamilyWidget('No Notification Yet!',
              textColor, getScreenPercentSize(context, 2.5), FontWeight.w500, TextAlign.center, 1),
          SizedBox(height: getScreenPercentSize(context, 1),),

          getCustomTextWidget("We'll notify you when something arrives.",
              textColor, getScreenPercentSize(context, 2), FontWeight.w400, TextAlign.center,1),


        ],
      ),
    );

  }

  void finish() {
    Navigator.of(context).pop();
  }
}

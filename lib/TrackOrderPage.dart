import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/MainPage.dart';

import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';

import 'package:flutter_pet_shop/utils/SizeConfig.dart';


class TrackOrderPage extends StatefulWidget {
  final Function? function;

  const TrackOrderPage({super.key, this.function});

  @override
  _TrackOrderPage createState() {
    return _TrackOrderPage();
  }
}

class _TrackOrderPage extends State<TrackOrderPage> {





  @override
  void initState() {
    super.initState();


    setState(() {});
  }


  Future<bool> _requestPop() {
    if(widget.function!=null){
      widget.function!();
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
    }

    return Future.value(true);
  }
  void doNothing(BuildContext context) {}
  double leftMargin=0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
     leftMargin = getHorizontalSpace(context);

    double radius = getScreenPercentSize(context, 1);

    double height = getScreenPercentSize(context, 12);
    double imageSize = getPercentSize(height, 67);

    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            toolbarHeight: 0,

          ),
          body: Container(
            child: Column(
              children: [

                getAppBar(context, 'Track Order',isBack: true,function: (){
                  _requestPop();
                }),
                SizedBox(height: getScreenPercentSize(context, 1.5),)
,


                Expanded(flex: 1,
                  child: ListView(children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: leftMargin),

                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            height: imageSize,

                            width: imageSize,
                            // color: Colors.green,

                            // decoration: getDecoration(radius),

                            margin: EdgeInsets.only(right: (leftMargin/2),),
                            // child: Card(
                            //   color: Colors.red,
                            //   elevation: 0,
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadiusDirectional.circular(radius)),
                              // clipBehavior: Clip.antiAlias,
                            //   child: Image.asset(
                            //     assetsPath+'cat_1.png',
                            //     fit: BoxFit.fill,
                            //
                            //   // ),
                            // ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(radius),
                              child: Image.asset(
                                    '${assetsPath}cat_1.png',
                                    fit: BoxFit.fill,
                                  ),
                            )

                          )
                          ,



                          Expanded(
                            child: Row(
                              children: [
                                Expanded(flex: 1,
                                  child:
                                  getCustomTextWidget(
                                      'Arriving today',
                                      textColor,
                                      getPercentSize(height, 14),
                                      FontWeight.w400,
                                      TextAlign.start,
                                      1),

                                ),

                                getCustomTextWithFontFamilyWidget(
                                    '8 PM',
                                    textColor,
                                    getPercentSize(height, 14),
                                    FontWeight.w400,
                                    TextAlign.start,

                                    1)

                              ],
                            ),
                          ),





                        ],
                      ),
                    ),


                    Container(height: 1,color: borderColor,margin: EdgeInsets.symmetric(vertical:
                    getScreenPercentSize(context, 2),horizontal: leftMargin),),

                    timelineRow('Ordered on Monday,January 23','','',true),
                    timelineRow('Shipped on Monday,January 23','','',true),
                    timelineRow('Out for delivery','See all updates','',true),
                    timelineRow('Arriving today by 8PM','','',false),

                    Container(height: 1,color: borderColor,margin: EdgeInsets.symmetric(horizontal: leftMargin),),


                    Padding(
                      padding:  EdgeInsets.all(leftMargin),
                      child: getTextWidget('Shipped with App Name', textColor, getScreenPercentSize(context, 1.8), FontWeight.bold
                          , TextAlign.start),
                    )

                    ,
                    getCell('Request Cancellation'),

                    SizedBox(height: (leftMargin/2),),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: leftMargin),
                      child: Row(
                        children: [
                          getTextWidget('Tracking ID: ', subTextColor, getScreenPercentSize(context, 1.8), FontWeight.w400
                              , TextAlign.start),

                          Expanded(
                            flex: 1,
                            child: getTextWidget('546859', textColor, getScreenPercentSize(context, 1.8), FontWeight.w400
                                , TextAlign.start),),



                        ],
                      ),
                    )
                    ,
                    Container(height: 1,color: borderColor,margin: EdgeInsets.all(leftMargin),)
,
                    getCell('Request or Replace Items'),
                    getCell('View Order Details'),

                  ],),
                )



              ],
            ),
          ),
        ));
  }

  getCell(String s){
    return     getSubMaterialCell(context,widget: Container(
      margin: EdgeInsets.only(
        left: leftMargin,right: leftMargin,
          bottom: getScreenPercentSize(
              context, 2)),
      padding: EdgeInsets.all(
          getScreenPercentSize(
              context, 2)),

      decoration: getDecorationWithRadius(


          getScreenPercentSize(
              context, 1.5),primaryColor),


      child: Row(
        children: [

          Expanded(
            flex: 1,
            child: getTextWidget(s, textColor, getScreenPercentSize(context, 1.8), FontWeight.w400
                , TextAlign.start),),

          Image.asset('${assetsPath}right-chevron.png',height: getScreenPercentSize(context, 2),color: textColor,)


        ],
      ),
    ));
  }

  Widget timelineRow(String title,String desc,String subTitle,bool isSelect) {

    double size=getScreenPercentSize(context,2);
    double height=getScreenPercentSize(context,7);
    return Container(

      child: Row(
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
                SizedBox(
                  width: size,
                  height: size,
                  // decoration: new BoxDecoration(
                  //   color: isSelect?(primaryColor):subTextColor,
                  //   shape: BoxShape.circle,
                  // ),

                  child: isSelect?Icon(
                    Icons.check_circle_sharp,
                    size: size,
                    color: primaryColor,
                  ):Image.asset(
                    '${assetsPath}un_selected_check.png',
                    height: size,
                    width: size,
                    color: subTextColor,
                  ),
                ),
                SizedBox(
                  width: getWidthPercentSize(context, 0.2),
                  height: (isSelect)? height:0,
                  child:(isSelect)? DottedLine(
                    dashLength: 3.0,
                    lineThickness: 3,
                    dashRadius: 0.0,
                    dashGapLength: 3.0,
                    dashColor: isSelect?(primaryColor):subTextColor,
                    direction: Axis.horizontal,
                    lineLength: (height),
                  ):Container(),

                  // decoration: new BoxDecoration(
                  //   color: isSelect?(primaryColor):Colors.grey,
                  //   shape: BoxShape.rectangle,
                  // ),
                  // child: Text(""),
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
                              fontSize: getScreenPercentSize(context, 1.6),
                              fontWeight: FontWeight.w500,
                              color: textColor)),

                      SizedBox(height: getScreenPercentSize(context, 1),),
                      // Text('$desc',
                      //     style: TextStyle(
                      //         fontFamily: fontFamily,
                      //         fontSize: getScreenPercentSize(context, 1.5),
                      //         fontWeight: FontWeight.w400,
                      //         color: subTextColor)),

                      getCustomTextWidget(desc, primaryColor, getScreenPercentSize(context, 1.5), FontWeight.w600,
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


                // SizedBox(width: getWidthPercentSize(context, 2),),

                // Text('$subTitle',
                //     style: TextStyle(
                //         fontFamily: fontFamily,
                //         fontSize: getScreenPercentSize(context, 1.8),
                //         fontWeight: FontWeight.w500,
                //         color: subTextColor)),



              ],
            ),
          ),
        ],
      ),
    );
  }
}



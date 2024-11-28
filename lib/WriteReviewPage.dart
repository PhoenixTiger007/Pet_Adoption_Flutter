import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'generated/l10n.dart';

class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({super.key});

  @override
  _WriteReviewPage createState() {
    return _WriteReviewPage();
  }
}

class _WriteReviewPage extends State<WriteReviewPage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    setThemePosition();
    double margin = getHorizontalSpace(context);
    double icon = getScreenPercentSize(context, 3.5);
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 0,
            backgroundColor: backgroundColor,
            title: getAppBarText(context, S.of(context).writeReviewPage),
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
            child: Container(
              margin: EdgeInsets.only(
                  // left: margin,
                  // right: margin,
                  // top: margin,
                  bottom: MediaQuery.of(context).size.width * 0.01),
              child: ListView(
                children: [

                  getAppBar(context, S.of(context).writeReviewPage,function: (){
                    _requestPop();
                  }, isBack: true),

                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      '${assetsPath}rate.png',
                      height: SizeConfig.safeBlockVertical! * 25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: margin, bottom: margin),
                    child: Align(
                      alignment: Alignment.center,
                      child: RatingBar.builder(
                        itemSize: icon,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        tapOnlyMode: true,
                        updateOnDrag: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: margin),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: icon,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ),
                  getMaterialCell(context,widget: Container(
                    padding: EdgeInsets.all(margin),
                    margin: EdgeInsets.symmetric(vertical: margin,horizontal: margin),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getScreenPercentSize(context, 1.2))),
                        
                        
                        color: backgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: margin),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomTextWidget(
                                  S.of(context).yourName,
                                  textColor,
                                  getScreenPercentSize(context, 1.8),
                                  FontWeight.bold,
                                  TextAlign.start,
                                  1),
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: margin),
                          child: TextField(
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: fontFamily,
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: getScreenPercentSize(context,  1.5)),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.only(top: 3, left: (margin / 2)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: subTextColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: margin),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomTextWidget(
                                  S.of(context).writeYourReview,
                                  textColor,
                                  getScreenPercentSize(context, 1.8),
                                  FontWeight.bold,
                                  TextAlign.start,
                                  1),
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: margin),
                          child: TextField(
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: fontFamily,
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: getScreenPercentSize(context, 1.5)),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.only(top: 3, left: (margin / 2)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: subTextColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        getCustomTextWidget(
                            S.of(context).minimumCharacter,
                            subTextColor,
                            getScreenPercentSize(context, 1.8),
                            FontWeight.w400,
                            TextAlign.start,
                            1)
                      ],
                    ),
                  )),

                  Container(
                    margin: EdgeInsets.only(top: (margin/2)),
                    child: getButtonWidget(context, 'Submit', primaryColor, (){

                    }),
                  )


                ],
              ),
            ),
          ),
        ));
  }
}

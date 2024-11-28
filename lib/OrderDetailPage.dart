import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  _OrderDetailPage createState() {
    return _OrderDetailPage();
  }
}

class _OrderDetailPage extends State<OrderDetailPage>
    with SingleTickerProviderStateMixin {
  List<ProductModel> myOrderList = DataFile.getProductModel();

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double margin = SizeConfig.safeBlockVertical! * 2;
    double padding = SizeConfig.safeBlockVertical! * 0.9;


    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            centerTitle: true,
            backgroundColor: backgroundColor,
            title: getAppBarText(context, 'Order Details'),
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
            // margin: EdgeInsets.only(left: leftMargin, right: leftMargin),

            child: Column(
              children: [

                getAppBar(context, 'Order Details',isBack: true, function: (){
                  _requestPop();
                }),
                Expanded(flex: 1,
                  child: ListView(
                    padding: EdgeInsets.only(top: margin,left: margin,right: margin),
                    children: [
                      Row(
                        children: [
                          getCustomTextWidget(
                              'Order ID',
                              textColor,
                              getScreenPercentSize(context, 1.8),
                              FontWeight.w500,
                              TextAlign.start,
                              1),
                          getCustomTextWidget(
                              '#2CE5DW',
                              subTextColor,
                              getScreenPercentSize(context, 1.8),
                              FontWeight.w500,
                              TextAlign.start,
                              1),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: padding),
                            child: Icon(
                              Icons.timelapse_outlined,
                              size: getScreenPercentSize(context, 1.8),
                            ),
                          ),
                          getCustomTextWidget(
                              '07/01/2021',
                              textColor,
                              getScreenPercentSize(context, 1.8),
                              FontWeight.w500,
                              TextAlign.start,
                              1)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: margin),
                        child: Row(
                          children: [
                            getCustomTextWidget(
                                'Items ',
                                textColor,
                                getScreenPercentSize(context, 1.8),
                                FontWeight.w500,
                                TextAlign.start,
                                1),
                            getCustomTextWidget(
                                myOrderList.length.toString(),
                                primaryColor,
                                getScreenPercentSize(context, 1.8),
                                FontWeight.w500,
                                TextAlign.start,
                                1)
                          ],
                        ),
                      ),
                      onDelivery(),

                      Padding(
                        padding: EdgeInsets.only(top: margin, bottom: padding),
                        child: getCustomTextWithFontFamilyWidget(
                            'Description',
                            textColor,
                            getScreenPercentSize(context, 2),
                            FontWeight.bold,
                            TextAlign.start,
                            1),
                      ),

                      getCustomTextWidget(
                          'Rice ,Alo Borda.Bacon Borda.Vegetables,Beef Curry.Dal.',
                          subTextColor,
                          getScreenPercentSize(context, 2),
                          FontWeight.w400,
                          TextAlign.start,
                          1),


                      Padding(
                        padding: EdgeInsets.only(top: margin, bottom: padding),

                        child: getCustomTextWithFontFamilyWidget(
                            'Size',
                            textColor,
                            getScreenPercentSize(context, 2),
                            FontWeight.bold,
                            TextAlign.start,
                            1),
                        // c
                        // child: getCustomText(
                        //     S.of(context).size,
                        //     ConstantData.mainTextColor,
                        //     1,
                        //     TextAlign.start,
                        //     FontWeight.bold,
                        //     ConstantData.font18Px),
                      ),

                      getCustomTextWidget(
                          '12',
                          subTextColor,
                          getScreenPercentSize(context, 2),
                          FontWeight.w500,
                          TextAlign.start,
                          1),

                      Container(
                        height: 0.3,
                        color: textColor,
                        margin: EdgeInsets.only(bottom: 15, top: 15),
                      ),

                      Row(
                        children: [
                          getCustomTextWithFontFamilyWidget('Total Amount', textColor, 16,
                              FontWeight.w500, TextAlign.start, 1),
                          Spacer(),
                          getCustomTextWithFontFamilyWidget('\$24.20', primaryColor, 16,
                              FontWeight.w500, TextAlign.start, 1),
                        ],
                      ),

                      SizedBox(
                        height: getScreenPercentSize(context, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget onDelivery() {
    double imageSize = SizeConfig.safeBlockVertical! * 10;
    double margin = SizeConfig.safeBlockVertical! * 2;
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myOrderList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 0.3,
                        color: textColor,
                        margin: EdgeInsets.only(bottom: margin, top: margin),
                      ),
                      Row(
                        children: [
                          Container(
                            height: imageSize,
                            width: imageSize,
                            margin: EdgeInsets.only(right: margin),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: cellColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(margin),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        assetsPath + myOrderList[index].image!),
                                    fit: BoxFit.cover)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    getCustomTextWithFontFamilyWidget(
                                        myOrderList[index].name!,
                                        textColor,
                                        getScreenPercentSize(context,2),
                                        FontWeight.w400,
                                        TextAlign.start,
                                        1),
                                    Spacer(),
                                    getCustomTextWithFontFamilyWidget(
                                        'Quantity: ',
                                        textColor,
                                        getScreenPercentSize(context, 2),
                                        FontWeight.w500,
                                        TextAlign.start,
                                        1),
                                    getCustomTextWithFontFamilyWidget(
                                        '2',
                                        primaryColor,
                                        getScreenPercentSize(context, 2),
                                        FontWeight.bold,
                                        TextAlign.start,
                                        1),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: getCustomTextWithFontFamilyWidget(
                                      myOrderList[index].price!,
                                      primaryColor,
                                      getScreenPercentSize(context, 2.1),
                                      FontWeight.w400,
                                      TextAlign.start,
                                      1),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.grey,
                                      size: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: getCustomTextWidget(
                                          'Delivered at 11:14 am',
                                          textColor,
                                          getScreenPercentSize(context, 1.8),
                                          FontWeight.w500,
                                          TextAlign.start,
                                          1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      //   ],
                      // )
                    ],
                  ),
                ),
                onTap: () {

                },
              );
            }));
  }
}

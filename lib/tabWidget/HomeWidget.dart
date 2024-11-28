import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/PetDetailPage.dart';
import 'package:flutter_pet_shop/model/DataModel.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';

import '../NotificationList.dart';
import '../ProductDetailPage.dart';
import '../ShopPage.dart';

class HomeWidget extends StatefulWidget {
  final Function function;
  final Function? functionViewAll;
  final Function? functionAdoptionAll;

  const HomeWidget(this.function, {super.key, this.functionViewAll,this.functionAdoptionAll});

  @override
  _HomeWidget createState() {
    return _HomeWidget();
  }
}

class _HomeWidget extends State<HomeWidget> {
  double defMargin = 0;
  double padding = 0;
  double height = 0;
  List<DataModel> dataList = DataFile.getCategoryData();
  List<ProductModel> productList = DataFile.getProductModel();
  List<ProductModel> adoptList = DataFile.getAdoptModel();
  FocusNode myFocusNode = FocusNode();
  bool isAutoFocus = false;

  @override
  Widget build(BuildContext context) {
    defMargin = getHorizontalSpace(context);
    // defMargin = getScreenPercentSize(context, 2.5);
    padding = getScreenPercentSize(context, 2);
    height = getScreenPercentSize(context, 5.7);
    // height = getScreenPercentSize(context, 5.5);
    double radius = getScreenPercentSize(context, 1.5);
    double btnHeight = getScreenPercentSize(context, 13);

    return Container(
      color: backgroundColor,
      padding: EdgeInsets.only(top: getScreenPercentSize(context, 2)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            myFocusNode.canRequestFocus = false;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBar(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: defMargin,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: defMargin),
                  //   child: getCustomTextWithFontFamilyWidget(
                  //       'Adopt a Friend',
                  //       textColor,
                  //       getScreenPercentSize(context, 2.5),
                  //       FontWeight.w500,
                  //       TextAlign.start,
                  //       1),
                  // ),
                  Row(
                    children: [
                      SizedBox(
                        width: defMargin,
                      ),
                      Expanded(
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              height: height,
                              margin: EdgeInsets.symmetric(
                                  vertical: (defMargin / 2)),
                              decoration: getDecorationWithBorder(radius,
                                  color:
                                      isAutoFocus ? primaryColor : borderColor),
                              child: Focus(
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    setState(() {
                                      isAutoFocus = true;
                                    });
                                  } else {
                                    setState(() {
                                      isAutoFocus = false;
                                    });
                                  }
                                },
                                child: TextField(
                                  focusNode: myFocusNode,
                                  autofocus: false,
                                  style: TextStyle(
                                    fontFamily: fontFamily,
                                    color: textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getScreenPercentSize(context, 2),
                                  ),
                                  onChanged: (string) {},
                                  maxLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: defMargin),
                                      hintText: 'Search...',
                                      prefixIcon: Icon(
                                        CupertinoIcons.search,
                                        color: subTextColor,
                                        size: getPercentSize(height, 50),
                                      ),
                                      hintStyle: TextStyle(
                                        color: subTextColor,
                                        fontFamily: fontFamily,
                                        fontSize:
                                            getScreenPercentSize(context, 2),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      disabledBorder: getOutLineBorder(radius),
                                      enabledBorder: getOutLineBorder(radius),
                                      focusedBorder: getOutLineBorder(radius),
                                      isDense: true),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // SizedBox(
                      //   width: (defMargin / 2),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     filterDialog();
                      //   },
                      //   child: getMaterialWidget(
                      //       context,
                      //       Container(
                      //         height: height,
                      //         width: height,
                      //         decoration:
                      //             getDecorationWithColor(radius, primaryColor),
                      //         child: Center(
                      //           child: Image.asset(
                      //               assetsPath + "filter bold.png",
                      //               color: Colors.white,
                      //               height: getPercentSize(height, 55)),
                      //         ),
                      //       ),
                      //       radius,
                      //       height),
                      // ),
                      SizedBox(
                        width: (defMargin),
                      ),
                    ],
                  ),
                  getSlider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopPage(),
                                ));
                          },
                          child: getSubMaterialCell(
                            context,
                            widget: Container(
                              height: btnHeight,
                              margin: EdgeInsets.only(
                                  left: defMargin, right: (defMargin / 2)),
                              decoration:
                                  getDecorationWithRadius(radius, primaryColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    '${assetsPath}Group 33638.png',
                                    height: getPercentSize(btnHeight, 40),
                                  ),
                                  SizedBox(
                                    height: getPercentSize(btnHeight, 7),
                                  ),
                                  getTextWithFontFamilyWidget(
                                      'Shop',
                                      textColor,
                                      getPercentSize(btnHeight, 12),
                                      FontWeight.w500,
                                      TextAlign.start)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            widget.function();
                          },
                          child: getSubMaterialCell(
                            context,
                            widget: Container(
                              height: btnHeight,
                              margin: EdgeInsets.only(
                                  right: defMargin, left: (defMargin / 2)),
                              decoration:
                                  getDecorationWithRadius(radius, primaryColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    '${assetsPath}dog-4 1.png',
                                    height: getPercentSize(btnHeight, 40),
                                  ),
                                  SizedBox(
                                    height: getPercentSize(btnHeight, 7),
                                  ),
                                  getTextWithFontFamilyWidget(
                                      'Pet Adoptions',
                                      textColor,
                                      getPercentSize(btnHeight, 12),
                                      FontWeight.w500,
                                      TextAlign.start)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getScreenPercentSize(context, 3),
                  ),
                  getTitle('Categories', function: widget.functionViewAll!),
                  getCategoryList(),
                  SizedBox(
                    height: getScreenPercentSize(context, 1),
                  ),
                  getTitle('Our Picks for you',
                      function: widget.functionAdoptionAll!),
                  gridList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  gridList() {
    var height = getScreenPercentSize(context, 30);

    double width = getWidthPercentSize(context, 40);
    double imgHeight = getPercentSize(height, 50);
    double remainHeight = height - imgHeight;

    double radius = getPercentSize(height, 5);

    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: adoptList.length,
        itemBuilder: (context, index) {
          ProductModel model = adoptList[index];

          return InkWell(
            child: getCellMaterialWidget(
                context,
                Container(
                  width: width,
                  margin: EdgeInsets.only(
                      left: defMargin, top: defMargin, bottom: defMargin),
                  decoration: ShapeDecoration(
                    color: backgroundColor,
                    // shadows: [
                    //   BoxShadow(
                    //       color: primaryColor.withOpacity(0.1),
                    //       blurRadius: 5,
                    //       spreadRadius: 5,
                    //       offset: Offset(0, 3))
                    // ],
                    shape: SmoothRectangleBorder(
                      // side: BorderSide(color: iconColor, width: 0.1),
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: radius,
                        cornerSmoothing: 0.8,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: imgHeight,
                        margin: EdgeInsets.all(getPercentSize(width, 5)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(radius),
                              child: Image.asset(
                                assetsPath + model.image!,
                                width: width,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.all(
                                    getPercentSize(imgHeight, 5)),
                                height: getPercentSize(imgHeight, 18),
                                width: getPercentSize(imgHeight, 18),
                                decoration: ShapeDecoration(
                                  color: backgroundColor,
                                  shape: SmoothRectangleBorder(
                                    side: BorderSide(
                                        color: iconColor, width: 0.1),
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius:
                                          getPercentSize(imgHeight, 5),
                                      cornerSmoothing: 0.8,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset('${assetsPath}heart.png',
                                      color: primaryColor,
                                      height: getPercentSize(imgHeight, 10)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //
                      //   height: width,
                      //   color: Colors.red,
                      //   margin: EdgeInsets.symmetric(horizontal: getPercentSize(width, 5),
                      //       ),
                      //
                      //
                      //   child: Image.asset(
                      //     assetsPath + model.image!,
                      //   ),
                      // ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getPercentSize(width, 5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: getCustomTextWidget(
                                        model.name!,
                                        textColor,
                                        getPercentSize(remainHeight, 11.5),
                                        FontWeight.bold,
                                        TextAlign.start,1)),

                                getCustomTextWidget(
                                    model.price!,
                                    primaryColor,
                                    getPercentSize(remainHeight, 11.5),
                                    FontWeight.bold,
                                    TextAlign.start,1)
                              ],
                            ),
                            SizedBox(
                              height: getPercentSize(remainHeight, 7),
                            ),

                            Row(
                              children: [

                                Image.asset(
                                  '${assetsPath}location.png',
                                  height: getPercentSize(remainHeight, 11),
                                ),
                                SizedBox(
                                  width: getPercentSize(width, 2),
                                ),
                                Expanded(
                                    child: getCustomTextWidget(
                                        model.address!,
                                        textColor,
                                        getPercentSize(remainHeight, 10),
                                        FontWeight.w400,
                                        TextAlign.start,1)),

                                // Image.asset(
                                //       assetsPath + "location.png",
                                //       height: getPercentSize(remainHeight, 10),
                                //     ),
                                //   SizedBox(
                                //     width: getPercentSize(width, 2),
                                //   ),
                                //   Expanded(
                                //       child: getTextWidget(
                                //           model.address!,
                                //           textColor,
                                //           getPercentSize(remainHeight, 10),
                                //           FontWeight.w400,
                                //           TextAlign.start)),
                              ],
                            ),
                            SizedBox(
                              height: getPercentSize(remainHeight, 2),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: getTextWidget(
                                        model.desc!,
                                        subTextColor,
                                        getPercentSize(remainHeight, 10),
                                        FontWeight.w400,
                                        TextAlign.start)),
                                SizedBox(
                                  width: getPercentSize(width, 2),
                                ),
                                // getMaterialWidget(context, Container(
                                //   height: getPercentSize(remainHeight, 14),
                                //   width: getPercentSize(remainHeight, 14),
                                //   decoration: getDecorationWithColor(
                                //       getPercentSize(remainHeight, 3),
                                //       primaryColor),
                                //   child: Center(
                                //     child: Icon(Icons.add,
                                //         color: Colors.white,
                                //         size: getPercentSize(remainHeight, 9)),
                                //   ),
                                // ), getPercentSize(remainHeight, 3), getPercentSize(remainHeight, 14))
                              ],
                            ),
                            // getTextWidget(
                            //     model.subTitle!,
                            //     subTextColor,
                            //     getPercentSize(remainHeight, 10),
                            //     FontWeight.w300,
                            //     TextAlign.center),

                            //
                            // SizedBox(
                            //   height: getPercentSize(remainHeight, 5),
                            //
                            // ),
                            // getTextWidget(
                            //     model.price!,
                            //     primaryColor,
                            //     getPercentSize(remainHeight, 18),
                            //     FontWeight.bold,
                            //     TextAlign.center),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                radius,
                height),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PetDetailPage(model)));
            },
          );
        },
      ),
    );
  }

  List<String> list = [
    'Latest Products',
    'Best Selling',
    'Lowest Price',
    'Highest Price'
  ];

  int position = 0;

  filterDialog() {
    double height = getScreenPercentSize(context, 45);
    double radius = getScreenPercentSize(context, 3);
    double subHeight = getPercentSize(height, 14.5);

    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius))),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: height,
                padding: EdgeInsets.all(getScreenPercentSize(context, 2)),
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: getTextWithFontFamilyWidget(
                              'Sort By',
                              textColor,
                              getPercentSize(height, 5),
                              FontWeight.w500,
                              TextAlign.start),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.close,
                              size: getPercentSize(height, 6),
                              color: textColor,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: getPercentSize(height, 1),
                    ),
                    getTextWidget(
                        'Arrange based on the following types',
                        subTextColor,
                        getPercentSize(height, 3.5),
                        FontWeight.w400,
                        TextAlign.start),
                    SizedBox(
                      height: getPercentSize(height, 2),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // setState(() {
                            // position=index;
                            Navigator.of(context).pop();
                            filterDialog1();
                            // });
                          },
                          child: Container(
                            height: subHeight,
                            margin: EdgeInsets.symmetric(
                                vertical: getPercentSize(height, 2)),
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidthPercentSize(context, 3)),
                            decoration: ShapeDecoration(
                              color: cellColor,
                              shape: SmoothRectangleBorder(
                                side: BorderSide(
                                    color: primaryColor.withOpacity(0.5),
                                    width: 0.3),
                                borderRadius: SmoothBorderRadius(
                                  cornerRadius: getPercentSize(subHeight, 25),
                                  cornerSmoothing: 0.8,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: getTextWidget(
                                      list[index],
                                      textColor,
                                      getPercentSize(subHeight, 27),
                                      FontWeight.w400,
                                      TextAlign.start),
                                ),
                                Visibility(
                                  visible: (position == index),
                                  child: Icon(
                                    Icons.check_circle,
                                    size: getPercentSize(subHeight, 35),
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          );
        });
  }


  RangeValues _currentRangeValues = const RangeValues(100, 1000);

  filterDialog1() {
    double height = getScreenPercentSize(context, 45);
    double radius = getScreenPercentSize(context, 3);
    double margin = getScreenPercentSize(context, 2);

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius))),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return FractionallySizedBox(
                heightFactor: 0.6,
                child: Container(
                  // padding: EdgeInsets.symmetric(ver: getScreenPercentSize(context, 2)),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: margin,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: getTextWithFontFamilyWidget(
                                  'Filter',
                                  textColor,
                                  getPercentSize(height, 5),
                                  FontWeight.w500,
                                  TextAlign.start),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.close,
                                  size: getPercentSize(height, 6),
                                  color: textColor,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getPercentSize(height, 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: getTextWidget(
                            'Filter products with more specific types',
                            subTextColor,
                            getPercentSize(height, 3.5),
                            FontWeight.w400,
                            TextAlign.start),
                      ),
                      SizedBox(
                        height: getPercentSize(height, 4),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: getTextWithFontFamilyWidget(
                            'Price',
                            textColor,
                            getPercentSize(height, 4),
                            FontWeight.w500,
                            TextAlign.start),
                      ),
                      SizedBox(
                        height: getPercentSize(height, 2),
                      ),
                      RangeSlider(
                        values: _currentRangeValues,
                        min: 10,
                        max: 1000,
                        activeColor: primaryColor,
                        inactiveColor: primaryColor.withOpacity(0.5),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: Row(
                          children: [
                            Expanded(
                              child: getTextWidget(
                                  '\$50',
                                  primaryColor,
                                  getScreenPercentSize(context, 2),
                                  FontWeight.w600,
                                  TextAlign.start),
                            ),

                            getTextWidget(
                                '\$250',
                                primaryColor,
                                getScreenPercentSize(context, 2),
                                FontWeight.w600,
                                TextAlign.start),

                            // getTextWidget(
                            //     '\$1000',
                            //     disableIconColor,
                            //     TextAlign.start,
                            //     FontWeight.w600,
                            //     getScreenPercentSize(context, 2))
                          ],
                        ),
                      ),

                      SizedBox(
                        height: getScreenPercentSize(context, 3),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: getTextWithFontFamilyWidget(
                            'Brand',
                            textColor,
                            getPercentSize(height, 4),
                            FontWeight.w500,
                            TextAlign.start),
                      ),
                      SizedBox(
                        height: getPercentSize(height, 2),
                      ),

                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: margin),
                          child: getGrid(setState)),
                      SizedBox(
                        height: getPercentSize(height, 10),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: margin),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                                },
                                child: getMaterialCell(context,
                                    widget: Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              getWidthPercentSize(context, 3)),
                                      height: getScreenPercentSize(context, 7),
                                      decoration: ShapeDecoration(
                                        color: alphaColor,
                                        // shadows: [
                                        //   BoxShadow(
                                        //       color: textColor.withOpacity(0.1),
                                        //       blurRadius: 2,
                                        //       spreadRadius: 1,
                                        //       offset: Offset(0, 4))
                                        // ],
                                        shape: SmoothRectangleBorder(
                                          side: BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius: SmoothBorderRadius(
                                            cornerRadius: getScreenPercentSize(
                                                context, 1.8),
                                            cornerSmoothing: 0.8,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: getTextWidget(
                                            'Reset',
                                            textColor,
                                            getScreenPercentSize(context, 2),
                                            FontWeight.bold,
                                            TextAlign.center),
                                      ),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  // if(_position==3){
                                  //   PrefData.setIsIntro(false);
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                                  // }else {
                                  //   if (_position < (introModelList.length - 1)) {
                                  //     setState(() {
                                  //       _position = _position + 1;
                                  //       controller.jumpToPage(_position);
                                  //     });
                                  //   } else {
                                  //     skip();
                                  //   }
                                  // }
                                },
                                child: getMaterialCell(context,
                                    widget: Container(
                                      margin: EdgeInsets.only(
                                          left:
                                              getWidthPercentSize(context, 3)),
                                      height: getScreenPercentSize(context, 7),
                                      decoration: ShapeDecoration(
                                        color: primaryColor,
                                        // shadows: [BoxShadow(
                                        //     color: textColor.withOpacity(0.1),
                                        //     blurRadius: 2,
                                        //     spreadRadius: 1,
                                        //     offset: Offset(0, 4))],
                                        shape: SmoothRectangleBorder(
                                          borderRadius: SmoothBorderRadius(
                                            cornerRadius: getScreenPercentSize(
                                                context, 1.8),
                                            cornerSmoothing: 0.8,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: getTextWidget(
                                            'Apply',
                                            Colors.white,
                                            getScreenPercentSize(context, 2),
                                            FontWeight.bold,
                                            TextAlign.center),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: getPercentSize(height, 10),
                      ),

                      // FlutterSlider(
                      //   handlerHeight: getScreenPercentSize(context, 1),
                      //   values: [_lowerValue, _upperValue],
                      //   rangeSlider: true,
                      //   max: 300,
                      //   min: 0,
                      //   step: FlutterSliderStep(step: 1),
                      //   jump: false,
                      //   trackBar: FlutterSliderTrackBar(
                      //       activeTrackBarHeight:
                      //           getScreenPercentSize(context, 1.2),
                      //       activeTrackBar: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(
                      //               getScreenPercentSize(context, 2)),
                      //           color: primaryColor),
                      //       inactiveTrackBarHeight:
                      //           getScreenPercentSize(context, 1.2),
                      //       inactiveTrackBar: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(
                      //               getScreenPercentSize(context, 2)),
                      //           color: subTextColor.withOpacity(0.5))),
                      //   tooltip: FlutterSliderTooltip(
                      //       disableAnimation: true,
                      //       alwaysShowTooltip: true,
                      //       boxStyle: FlutterSliderTooltipBox(
                      //           decoration:
                      //               BoxDecoration(color: Colors.transparent)),
                      //       textStyle: TextStyle(
                      //           fontFamily: fontFamily,
                      //           fontWeight: FontWeight.w800,
                      //           fontSize: 0,
                      //           color: Colors.transparent),
                      //       format: (String value) {
                      //         return '\$' + value;
                      //       }),
                      //   handler: FlutterSliderHandler(
                      //     decoration: BoxDecoration(),
                      //     child: Container(),
                      //   ),
                      //   rightHandler: FlutterSliderHandler(
                      //     decoration: BoxDecoration(),
                      //     child: Container(
                      //       height: 78,
                      //       width: 78,
                      //       decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color: Colors.red,
                      //       ),
                      //       padding:
                      //           EdgeInsets.all(getScreenPercentSize(context, 2)),
                      //     ),
                      //   ),
                      //   disabled: false,
                      //   onDragging: (handlerIndex, lowerValue, upperValue) {
                      //     _lowerValue = lowerValue;
                      //     _upperValue = upperValue;
                      //     setState(() {});
                      //   },
                      // ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  List<String> materialList = [
    'King',
    'Pedigree',
    'Baker',
    'Whiskies',
    'Chomp',
    'Pet Toys',
    'Meow',
    'Bash',
    'Domino'
  ];

  int materialPosition = 0;

  getGrid(var setState) {
    var crossAxisSpacing = 1;
    var screenWidth = MediaQuery.of(context).size.width;
    var crossAxisCount = 3;
    var width = (screenWidth - ((crossAxisCount - 1) * crossAxisSpacing)) /
        crossAxisCount;
    var cellHeight = getScreenPercentSize(context, 5.5);

    var margin = getWidthPercentSize(context, 3);

    var aspectRatio = width / cellHeight;

    return Container(
      margin: EdgeInsets.only(right: 1),
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        shrinkWrap: true,
        childAspectRatio: aspectRatio,
        mainAxisSpacing: margin,
        crossAxisSpacing: (margin),
        // childAspectRatio: 0.64,
        primary: false,
        children: List.generate(materialList.length, (index) {
          return InkWell(
            onTap: () {
              setState(() {
                materialPosition = index;
              });
            },
            child: SizedBox(
              width: cellHeight,
              child: Container(
                margin: EdgeInsets.only(
                    top: getPercentSize(cellHeight, 3), bottom: 1),
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: getWidthPercentSize(context, 3)),
                decoration: ShapeDecoration(
                  color:
                      (materialPosition == index) ? primaryColor : alphaColor,
                  // shadows: [
                  //   BoxShadow(
                  //       color: primaryColor.withOpacity(0.3),
                  //       blurRadius: 2,
                  //       spreadRadius: 1,
                  //       offset: Offset(0, 1))
                  // ],
                  shape: SmoothRectangleBorder(
                    side: BorderSide(color: iconColor, width: 0.3),
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: getPercentSize(cellHeight, 15),
                      cornerSmoothing: 0.8,
                    ),
                  ),
                ),
                // decoration: BoxDecoration(
                //     color: (materialPosition == index)
                //         ? primaryColor
                //         : alphaColor,
                //
                //
                //     borderRadius: BorderRadius.all(
                //         Radius.circular(getPercentSize(cellHeight, 15)))),
                child: Center(
                  child: getTextWidget(
                    materialList[index],
                    (index == materialPosition) ? Colors.white : textColor,
                    getPercentSize(cellHeight, 30),
                    FontWeight.w500,
                    TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // gridList() {
  //   double margin = getScreenPercentSize(context, 1);
  //   var height = getScreenPercentSize(context, 32);
  //
  //   double width = getWidthPercentSize(context, 50);
  //   double sideMargin = margin * 1.2;
  //   double imgHeight = getPercentSize(height, 55);
  //   double remainHeight = height - imgHeight;
  //
  //   double radius = getPercentSize(height, 5);
  //
  //
  //
  //   double _crossAxisSpacing = 0;
  //   var _screenWidth = MediaQuery.of(context).size.width;
  //   var _crossAxisCount = 2;
  //   var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
  //       _crossAxisCount;
  //
  //   var _aspectRatio = _width / height;
  //
  //
  //
  //   return GridView.count(
  //     crossAxisCount: _crossAxisCount,
  //     shrinkWrap: true,
  //
  //     padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 2),horizontal: defMargin),
  //     scrollDirection: Axis.vertical,
  //     primary: false,
  //     crossAxisSpacing: defMargin,
  //     mainAxisSpacing: defMargin,
  //     childAspectRatio: _aspectRatio,
  //     children: List.generate(productList.length, (index) {
  //       ProductModel model = productList[index];
  //
  //       return InkWell(
  //         child: Container(
  //           // margin: EdgeInsets.only(
  //           //     left: defMargin, top: margin, bottom: margin),
  //
  //           decoration: getDecoration(radius),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Container(
  //
  //                 height: imgHeight,
  //                 margin: EdgeInsets.all(getPercentSize(width, 2)),
  //
  //                 // decoration: BoxDecoration(
  //                 //     color: cellColor,
  //                 //     borderRadius:
  //                 //     BorderRadius.all(Radius.circular(radius))),
  //                 child: Center(
  //                     child: Image.asset(
  //                       assetsPath + model.image!,
  //                     )),
  //               ),
  //               Expanded(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       getTextWidget(
  //                           model.name!,
  //                           textColor,
  //                           getPercentSize(remainHeight, 13),
  //                           FontWeight.w500,
  //                           TextAlign.start),
  //                       SizedBox(
  //                         height: getPercentSize(remainHeight, 5),
  //
  //                       ),
  //                       getTextWidget(
  //                           model.subTitle!,
  //                           subTextColor,
  //                           getPercentSize(remainHeight, 10),
  //                           FontWeight.w300,
  //                           TextAlign.center)
  //
  //                       ,
  //
  //
  //                       SizedBox(
  //                         height: getPercentSize(remainHeight, 5),
  //
  //                       ),
  //                       getTextWidget(
  //                           model.price!,
  //                           primaryColor,
  //                           getPercentSize(remainHeight, 18),
  //                           FontWeight.bold,
  //                           TextAlign.center),
  //                     ],
  //                   )),
  //               // getTextWidget(
  //               //     model.price!,
  //               //     primaryColor,
  //               //     getPercentSize(height, 25),
  //               //     FontWeight.bold,
  //               //     TextAlign.center),
  //             ],
  //           ),
  //         ),
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => ProductDetailPage(model)));
  //         },
  //       );
  //
  //     }),
  //   );
  // }

  int selectedCategory = 0;

  getCategoryList() {
    double height = getScreenPercentSize(context, 7);
    double width = getWidthPercentSize(context, 30);
    return Container(
        height: height,
        margin: EdgeInsets.symmetric(vertical: padding),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: dataList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Color color = '#F1DDD3'.toColor();

              if (index % 3 == 0) {
                color = '#F7E1BD'.toColor();
              } else if (index % 3 == 1) {
                color = '#DBF0E5'.toColor();
              } else if (index % 3 == 2) {
                color = '#F1DDD3'.toColor();
              }
              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: selectedCategory == index
                              ? primaryColor
                              : Colors.transparent,
                          width: selectedCategory == index ? 1 : 0),
                      borderRadius: BorderRadius.all(
                          Radius.circular(getPercentSize(height, 50)))),
                  margin: EdgeInsets.only(
                      left: index == 0 ? (defMargin) : (defMargin / 1.5)),
                  child: Container(
                    margin: EdgeInsets.all(1),

                    width: width,

                    decoration: ShapeDecoration(
                      color: color,
                      shape: SmoothRectangleBorder(
                        // side: BorderSide(color: primaryColor,width: selectedCategory==index?1:0),

                        borderRadius: SmoothBorderRadius(
                          cornerRadius: getPercentSize(height, 50),
                          cornerSmoothing: 0.8,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: height,
                          width: height,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              assetsPath + dataList[index].image!,
                              height: getPercentSize(height, 60),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getPercentSize(width, 10),
                        ),
                        Expanded(
                            child: getCustomTextWidget(
                                dataList[index].name!,
                                Colors.black,
                                getPercentSize(width - height, 22),
                                FontWeight.w500,
                                TextAlign.start,
                                1))
                      ],
                    ),

                    // child: Container(
                    //   margin: EdgeInsets.only(left: defMargin),
                    //   child: Stack(
                    //     children: [
                    //       Container(
                    //         height: imageSize,
                    //         width: imageSize,
                    //         decoration: BoxDecoration(
                    //           color: cellColor,
                    //           shape: BoxShape.circle,
                    //         ),
                    //         child: Center(
                    //           child: Image.asset(
                    //             assetsPath + dataList[index].image!,
                    //             height: getPercentSize(imageSize, 90),
                    //           ),
                    //         ),
                    //       ),
                    //       Visibility(
                    //         visible: (selectedCategory == index),
                    //         child: Container(
                    //           height: imageSize,
                    //           width: imageSize,
                    //           decoration: BoxDecoration(
                    //             color: primaryColor.withOpacity(0.4),
                    //             shape: BoxShape.circle,
                    //           ),
                    //           child: Center(
                    //             child: getCustomTextWidget(
                    //                 dataList[index].name!,
                    //                 Colors.white,
                    //                 getPercentSize(imageSize, 20),
                    //                 FontWeight.w500,
                    //                 TextAlign.center,
                    //                 1),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SubCategoriesPage()));
                },
              );
            }));
  }

  getTitle(String s, {Function? function}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defMargin),
      child: Row(
        children: [
          Expanded(
            child: getTextWithFontFamilyWidget(
                s,
                textColor,
                getScreenPercentSize(context, 2),
                FontWeight.w500,
                TextAlign.start),
          ),
          InkWell(
            onTap: () {
              if (function != null) {
                function();
              }
            },
            child: getTextWidget(
                'View All',
                primaryColor,
                getScreenPercentSize(context, 1.6),
                FontWeight.w500,
                TextAlign.start),
          )
        ],
      ),
    );
  }

  getAppBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defMargin),
      child: Row(
        children: [
          // Image.asset(
          //   assetsPath + "menu.png",
          //   height: getScreenPercentSize(context, 2.5),
          //   color: textColor,
          // ),

          Expanded(
            child: getCustomTextWithFontFamilyWidget(
                'Adopt a Friend',
                textColor,
                getScreenPercentSize(context, 2.5),
                FontWeight.w500,
                TextAlign.start,
                1),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => NotificationList(),));
            },
            child: Image.asset(
              '${assetsPath}notifications.png',
              height: getScreenPercentSize(context, 2.5),
              color: textColor,
            ),
          ),

          // Icon(
          //   Icons.shopping_bag_outlined,
          //   color: Colors.lightGreen,
          //   size: getScreenPercentSize(context, 3),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => AddNewPetPage(),
          //         ));
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(left: getWidthPercentSize(context, 2)),
          //     height: height,
          //     width: height,
          //     decoration: getDecorationWithColor(
          //         getPercentSize(height, 25), primaryColor),
          //     child: Center(
          //       child: Icon(Icons.add,
          //           color: Colors.white, size: getPercentSize(height, 70)),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  getSlider() {
    double sliderHeight = getScreenPercentSize(context, 22);

    return SizedBox(
      width: double.infinity,
      height: sliderHeight,
      child: CarouselSlider.builder(
        itemCount: 3,
        options:
            CarouselOptions(autoPlay: true, onPageChanged: (index, reason) {}),
        itemBuilder: (context, index, realIndex) {
          Color color = '#F1DDD3'.toColor();

          if (index % 2 == 0) {
            color = Colors.green.shade200;
          } else if (index % 2 == 1) {
            color = Colors.orangeAccent.shade100;
          }

          if (index == 0) {
            return getBanner(sliderHeight, 'pet_3.png');
          } else if (index == 1) {
            return getSliderCell(sliderHeight, color);
          } else {
            return getBanner(sliderHeight, 'pet_6.png', color: color);
          }
        },
      ),
    );
  }

  Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
        (c.blue * f).round());
  }

  getSliderCell(double height, Color color) {
    // Color color = "#A193E2".toColor();
    double width = double.infinity;

    double radius = getPercentSize(height, 7);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.5), color.withOpacity(0.9), color])),
      margin:
          EdgeInsets.symmetric(vertical: defMargin, horizontal: (padding / 2)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: padding),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCustomTextWithFontFamilyWidget(
                      'Pet Adoption\nMade Easy',
                      Colors.white,
                      getPercentSize(height, 11),
                      FontWeight.w500,
                      TextAlign.end,
                      2),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getPercentSize(height, 4.5),
                        horizontal: getWidthPercentSize(context, 4)),
                    margin: EdgeInsets.only(top: getPercentSize(height, 6)),
                    decoration: getDefaultDecorationWithColor(
                        Colors.white, (radius / 1.5)),
                    child: getCustomTextWithFontFamilyWidget(
                      'Shop Now',
                      Colors.black,
                      getPercentSize(height, 7),
                      FontWeight.w400,
                      TextAlign.start,
                      1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(getPercentSize(height, 5)),
                // margin: EdgeInsets.all(getPercentSize(height, 5)),
                child: Image.asset(
                  '${assetsPath}pet_3.png',
                  width: getScreenPercentSize(context, 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getBanner(double height, String img, {Color? color}) {
    color ??= '#A193E2'.toColor();
    double width = double.infinity;

    double radius = getPercentSize(height, 7);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          // color: color,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color!,
                color.withOpacity(0.9),
                color.withOpacity(0.5)
              ])),
      margin:
          EdgeInsets.symmetric(vertical: defMargin, horizontal: (padding / 2)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getPercentSize(height, 5)),
              child: Image.asset(
                assetsPath + img,
                width: getWidthPercentSize(context, 42),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: padding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCustomTextWithFontFamilyWidget(
                      'Pet Adoption\nMade Easy',
                      Colors.white,
                      getPercentSize(height, 11),
                      FontWeight.w500,
                      TextAlign.start,
                      2),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getPercentSize(height, 4.5),
                        horizontal: getWidthPercentSize(context, 4)),
                    margin: EdgeInsets.only(top: getPercentSize(height, 6)),
                    decoration: getDefaultDecorationWithColor(
                        Colors.white, (radius / 1.5)),
                    child: getCustomTextWithFontFamilyWidget(
                      'Shop Now',
                      Colors.black,
                      getPercentSize(height, 7),
                      FontWeight.w400,
                      TextAlign.start,
                      1,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  sellerList() {
    double height = getScreenPercentSize(context, 10);

    double width = getPercentSize(height, 80);
    double radius = getPercentSize(height, 5);

    return Container(
        margin: EdgeInsets.symmetric(horizontal: defMargin),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: productList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              ProductModel model = productList[index];
              return InkWell(
                child: getMaterialCell(context,
                    widget: Container(
                      margin:
                          EdgeInsets.only(top: padding, bottom: (padding / 2)),
                      padding: EdgeInsets.symmetric(horizontal: (padding / 2)),
                      height: height,
                      width: double.infinity,
                      decoration: getDecoration(radius),
                      child: Row(
                        children: [
                          Container(
                            height: width,
                            margin: EdgeInsets.only(right: padding),
                            width: width,
                            padding: EdgeInsets.all(getPercentSize(width, 10)),
                            decoration: BoxDecoration(
                                color: cellColor,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    getPercentSize(width, 10)))),
                            child: Center(
                                child: Image.asset(
                              assetsPath + model.image!,
                            )),
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getTextWidget(
                                  model.name!,
                                  textColor,
                                  getPercentSize(height, 20),
                                  FontWeight.w500,
                                  TextAlign.center),
                              SizedBox(
                                height: getPercentSize(height, 5),
                              ),
                              getTextWidget(
                                  model.subTitle!,
                                  subTextColor,
                                  getPercentSize(height, 15),
                                  FontWeight.w300,
                                  TextAlign.center)
                            ],
                          )),
                          getTextWidget(
                              model.price!,
                              primaryColor,
                              getPercentSize(height, 25),
                              FontWeight.bold,
                              TextAlign.center),
                        ],
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(model)));
                },
              );
            }));
  }
}

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/DataModel.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import '../ProductDetailPage.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPage createState() {
    return _ShopPage();
  }
}

class _ShopPage extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  double padding = 0;
  double defMargin = 0;
  double height = 0;

  List<DataModel> dataList = DataFile.getCategoryData();
  List<ProductModel> productList = DataFile.getProductModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }
  FocusNode myFocusNode=FocusNode();
  bool isAutoFocus=false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    padding = getScreenPercentSize(context, 2);
    defMargin = getScreenPercentSize(context, 2);
    height = getScreenPercentSize(context, 6);
 double   bottomHeight = getScreenPercentSize(context, 7.4);
 double   bottomWidth = getWidthPercentSize(context, 48);

    double radius = getScreenPercentSize(context, 1.5);

    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: GestureDetector(
            onTap: (){
              setState(() {
                myFocusNode.canRequestFocus=false;
              });
            },
            child: Container(
              width: double.infinity,
              color: backgroundColor,

              child: Stack(
                children: [
                  Column(
                    children: [
                      getAppBar(context, 'Shop',isBack: true,function: (){
                        _requestPop();
                      }),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(height: getScreenPercentSize(context, 1.5),),

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
                                        margin: EdgeInsets.symmetric(vertical: (defMargin/2)),
                                        decoration: getDecorationWithBorder(radius,color: isAutoFocus?primaryColor:borderColor),
                                        child: Focus(

                                          onFocusChange: (hasFocus) {
                                            if(hasFocus) {

                                              setState((){
                                                isAutoFocus=true;
                                              });
                                            }else{
                                              setState((){
                                                isAutoFocus=false;
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
                                              fontSize: getScreenPercentSize(context,2),
                                            ),
                                            onChanged: (string) {},
                                            maxLines: 1,
                                            textAlignVertical: TextAlignVertical.center,
                                            textAlign: TextAlign.left,
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: defMargin),
                                                hintText: 'Search...',
                                                prefixIcon: Icon(
                                                  CupertinoIcons.search,
                                                  color: subTextColor,
                                                  size: getPercentSize(height, 50),
                                                ),
                                                hintStyle: TextStyle(
                                                  color: subTextColor,
                                                  fontFamily: fontFamily,
                                                  fontSize: getScreenPercentSize(context, 2),
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
                                //   child: getMaterialWidget(context, Container(
                                //     height: height,
                                //     width: height,
                                //     decoration:
                                //     getDecorationWithColor(radius, primaryColor),
                                //     child: Center(
                                //       child: Image.asset(assetsPath + "filter bold.png",
                                //           color: Colors.white,
                                //           height: getPercentSize(height, 55)),
                                //     ),
                                //   ), radius, height),
                                // ),
                                SizedBox(
                                  width: (defMargin),
                                ),
                              ],
                            ),

                            // Container(
                            //   margin: EdgeInsets.all(defMargin),
                            //   decoration: getDecoration(radius),
                            //   child: TextField(
                            //     style: TextStyle(
                            //       fontFamily: fontFamily,
                            //       color: textColor,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: getScreenPercentSize(context, 1.7),
                            //     ),
                            //     onChanged: (string) {},
                            //     maxLines: 1,
                            //     textAlignVertical: TextAlignVertical.center,
                            //     textAlign: TextAlign.left,
                            //     decoration: InputDecoration(
                            //       contentPadding: EdgeInsets.only(left: defMargin),
                            //       hintText: 'Search food , accessories..',
                            //       // prefixIcon: Icon(Icons.search),
                            //       suffixIcon: Icon(
                            //         Icons.search,
                            //         color: subTextColor,
                            //       ),
                            //       hintStyle: TextStyle(
                            //         color: subTextColor,
                            //         fontFamily: fontFamily,
                            //         fontSize: getScreenPercentSize(context, 1.7),
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //       filled: true,
                            //       isDense: true,
                            //       fillColor: Colors.transparent,
                            //       disabledBorder: getOutLineBorder(radius),
                            //       enabledBorder: getOutLineBorder(radius),
                            //       focusedBorder: getOutLineBorder(radius),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: (defMargin/2),),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: defMargin),
                            //   child: getTextWithFontFamilyWidget(
                            //       'Category',
                            //       textColor,
                            //       getScreenPercentSize(context, 2),
                            //       FontWeight.w500,
                            //       TextAlign.start),
                            // ),
                            // SizedBox(height: (defMargin/2),),

                            getCategoryList(),
                            SizedBox(
                              height: getScreenPercentSize(context, 1),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.all(defMargin),
                            //   child: getTextWidget(
                            //       'Product',
                            //       textColor,
                            //       getScreenPercentSize(context, 1.8),
                            //       FontWeight.bold,
                            //       TextAlign.start),
                            // ),
                            sellerList()
                          ],
                        ),
                      ),
                    ],
                  ),


                  Align(
                    alignment: Alignment.bottomCenter,

                    child: Container(

                      width: bottomWidth,
                      height: bottomHeight,
                      margin: EdgeInsets.only(bottom: getScreenPercentSize(context,5)),

                      decoration: BoxDecoration(
                        color: primaryColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(getPercentSize(bottomHeight, 65)))
                      ),

                      child: Row(
                        children: [


                          Expanded(flex: 1,child: InkWell(
                            onTap: (){
                              filterDialog();
                            },
                            child: Container(

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset('${assetsPath}Sort.png',color: Colors.white,
                                     height: getPercentSize(bottomWidth, 10)   ),
                                  SizedBox(width: getPercentSize(bottomWidth, 4),),
                                  getTextWidget('Sort', Colors.white, getPercentSize(bottomWidth, 8),
                                      FontWeight.w600, TextAlign.center)
                                ],
                              ),

                            ),
                          ),),Container(height: double.infinity,
                          width: 1,
                          color: Colors.white,),
                          Expanded(flex: 1,child: InkWell(
                            onTap: (){
                              filterDialog1();
                            },
                            child: Container(  child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Image.asset('${assetsPath}Filter.png',color: Colors.white,
                                    height: getPercentSize(bottomWidth, 10)   ),
                                SizedBox(width: getPercentSize(bottomWidth, 4),),
                                getTextWidget('Filter', Colors.white, getPercentSize(bottomWidth, 8),
                                    FontWeight.w600, TextAlign.center)
                              ],
                            ),),
                          ),)

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int selectedCategory = 0;



  // sellerList() {
  //   defMargin = getScreenPercentSize(context, 1.5);
  //
  //   double margin = getScreenPercentSize(context, 1);
  //   var height = getScreenPercentSize(context, 32);
  //
  //   double width = getWidthPercentSize(context, 40);
  //   double sideMargin = margin * 1.2;
  //   double imgHeight = getPercentSize(height, 50);
  //   double remainHeight = height - imgHeight;
  //
  //   double radius = getPercentSize(height, 5);
  //
  //   double _crossAxisSpacing = 0;
  //   var _screenWidth = MediaQuery.of(context).size.width;
  //   var _crossAxisCount = 2;
  //   var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
  //       _crossAxisCount;
  //
  //   var _aspectRatio = _width / height;
  //
  //   return GridView.count(
  //     crossAxisCount: _crossAxisCount,
  //     shrinkWrap: true,
  //     padding: EdgeInsets.symmetric(horizontal: (defMargin*1.2)),
  //     scrollDirection: Axis.vertical,
  //     primary: false,
  //     crossAxisSpacing: (defMargin*2),
  //     mainAxisSpacing: 0,
  //     childAspectRatio: _aspectRatio,
  //     children: List.generate(productList.length, (index) {
  //       ProductModel model = productList[index];
  //
  //       return InkWell(
  //         child: getMaterialCell(context,widget: Container(
  //           width: width,
  //           margin: EdgeInsets.only(
  //               top: defMargin, bottom: (defMargin)),
  //           decoration: ShapeDecoration(
  //             color: backgroundColor,
  //             // shadows: [
  //             //   BoxShadow(
  //             //       color: primaryColor.withOpacity(0.1),
  //             //       blurRadius: 3,
  //             //       spreadRadius: 3,
  //             //       offset: Offset(0, 1))
  //             // ],
  //             shape: SmoothRectangleBorder(
  //               // side: BorderSide(color: iconColor, width: 0.1),
  //               borderRadius: SmoothBorderRadius(
  //                 cornerRadius: radius,
  //                 cornerSmoothing: 0.8,
  //               ),
  //             ),
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Container(
  //                 height: imgHeight,
  //                 margin: EdgeInsets.only(top: getPercentSize(width, 7),bottom: getPercentSize(width, 5)),
  //                 child: Stack(
  //                   children: [
  //                     Center(
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(radius),
  //
  //                         child: Image.asset(
  //                           assetsPath + model.image!,
  //                           width: width,
  //                           fit: BoxFit.fill,
  //                         ),
  //                       ),
  //                     ),
  //                     Align(
  //                       alignment: Alignment.topRight,
  //                       child: Container(
  //                         margin: EdgeInsets.symmetric(horizontal: getPercentSize(imgHeight, 14),vertical: getPercentSize(imgHeight, 6)),
  //                         height: getPercentSize(imgHeight, 18),
  //                         width: getPercentSize(imgHeight, 18),
  //                         decoration: ShapeDecoration(
  //                           color: backgroundColor,
  //                           shape: SmoothRectangleBorder(
  //                             side: BorderSide(color: iconColor, width: 0.1),
  //                             borderRadius: SmoothBorderRadius(
  //                               cornerRadius: getPercentSize(imgHeight, 5),
  //                               cornerSmoothing: 0.8,
  //                             ),
  //                           ),
  //                         ),
  //                         child: Center(
  //                           child: Image.asset(assetsPath + "heart.png",
  //                               color: primaryColor,
  //                               height: getPercentSize(imgHeight, 10)),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                   child: Container(
  //                     margin: EdgeInsets.symmetric(
  //                         horizontal: getPercentSize(width, 5)),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Expanded(
  //                                 child: getTextWidget(
  //                                     model.name!,
  //                                     textColor,
  //                                     getPercentSize(remainHeight, 12),
  //                                     FontWeight.bold,
  //                                     TextAlign.start)),
  //
  //                           ],
  //                         ),
  //                         // SizedBox(
  //                         //   height: getPercentSize(remainHeight, 4),
  //                         // ),
  //                         // Row(
  //                         //   children: [
  //                         //     Image.asset(
  //                         //       assetsPath + "location.png",
  //                         //       height: getPercentSize(remainHeight, 9),
  //                         //     ),
  //                         //     SizedBox(
  //                         //       width: getPercentSize(width, 2),
  //                         //     ),
  //                         //     Expanded(
  //                         //         child: getTextWidget(
  //                         //             model.address!,
  //                         //             textColor,
  //                         //             getPercentSize(remainHeight, 9),
  //                         //             FontWeight.w400,
  //                         //             TextAlign.start)),
  //                         //   ],
  //                         // ),
  //                         SizedBox(
  //                           height: getPercentSize(remainHeight, 4),
  //                         ),
  //                         Row(
  //                           children: [
  //                             Expanded(
  //                                 child:   getTextWithFontFamilyWidget(
  //                                     model.price!,
  //                                     primaryColor,
  //                                     getPercentSize(remainHeight, 12),
  //                                     FontWeight.w400,
  //                                     TextAlign.start)),
  //                             SizedBox(
  //                               width: getPercentSize(width, 2),
  //                             ),
  //                             // getMaterialWidget(context, Container(
  //                             //   height: getPercentSize(remainHeight, 16),
  //                             //   width: getPercentSize(remainHeight, 16),
  //                             //   decoration: getDecorationWithColor(
  //                             //       getPercentSize(remainHeight, 3), primaryColor),
  //                             //   child: Center(
  //                             //     child: Icon(Icons.add,
  //                             //         color: Colors.white,
  //                             //         size: getPercentSize(remainHeight, 11)),
  //                             //   ),
  //                             // ), getPercentSize(remainHeight, 3), getPercentSize(remainHeight, 16))
  //
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   )),
  //             ],
  //           ),
  //         )),
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => ProductDetailPage(model)));
  //         },
  //       );
  //     }),
  //   );
  // }

  sellerList() {

    defMargin = getScreenPercentSize(context, 1.5);

    var height = getScreenPercentSize(context, 35);

    double width = getWidthPercentSize(context, 40);
    double imgHeight = getPercentSize(height, 45);
    double remainHeight = height - imgHeight;

    double radius = getPercentSize(height, 5);

    double crossAxisSpacing = 0;
    var screenWidth = MediaQuery.of(context).size.width;
    var crossAxisCount = 2;
    var width0 = (screenWidth - ((crossAxisCount - 1) * crossAxisSpacing)) /
        crossAxisCount;

    var aspectRatio = width0 / height;

    return





      GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: (defMargin*1.2)),
      scrollDirection: Axis.vertical,
      primary: false,
      crossAxisSpacing: (defMargin*2),
      mainAxisSpacing: 0,
      childAspectRatio: aspectRatio,
      children: List.generate(productList.length, (index) {
        ProductModel model = productList[index];

        return InkWell(
          child: Container(
            width: width,
            margin: EdgeInsets.only(
                top: defMargin, bottom: (defMargin)),
            decoration: ShapeDecoration(
              color: backgroundColor,
              shadows: [
                BoxShadow(
                    color: subTextColor.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 1))
              ],
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
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: getPercentSize(width, 7),bottom: getPercentSize(width, 5)),
                  child: Stack(
                    children: [
                      Center(
                        child:
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(radius),
                        //
                        //   child:
                        Image.asset(
                          assetsPath + model.icon!,
                          height: getPercentSize(imgHeight, 75),
                          // fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: getPercentSize(imgHeight, 9),
                            // vertical: getPercentSize(imgHeight, 6)
                          ),
                          height: getPercentSize(imgHeight, 18),
                          width: getPercentSize(imgHeight, 18),
                          // decoration: ShapeDecoration(
                          // color: backgroundColor,
                          // shape: SmoothRectangleBorder(
                          //   side: BorderSide(color: iconColor, width: 0.1),
                          //   borderRadius: SmoothBorderRadius(
                          //     cornerRadius: getPercentSize(imgHeight, 5),
                          //     cornerSmoothing: 0.8,
                          //   ),
                          // ),
                          // ),
                          child: Center(
                            child: Image.asset('${assetsPath}heart.png',
                                color: primaryColor,
                                height: getPercentSize(imgHeight, 20)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getPercentSize(width, 5)),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: getCustomTextWidget(
                                      model.subText!,
                                      textColor,
                                      getPercentSize(remainHeight, 8),
                                      FontWeight.bold,
                                      TextAlign.start,1)),

                            ],
                          ),
                          // SizedBox(
                          //   height: getPercentSize(remainHeight, 4),
                          // ),
                          SizedBox(
                            height: getPercentSize(remainHeight, 5),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                '${assetsPath}star.png',
                                height: getPercentSize(remainHeight, 9),
                              ),
                              SizedBox(
                                width: getPercentSize(width, 2),
                              ),
                              getTextWidget(
                                  '4.5',
                                  subTextColor,
                                  getPercentSize(remainHeight, 8),
                                  FontWeight.w400,
                                  TextAlign.start),

                              SizedBox(
                                width: getPercentSize(width, 4.5),
                              ),
                              Expanded(
                                child: getTextWidget(
                                    '19 Reviews',
                                    subTextColor,
                                    getPercentSize(remainHeight, 8),
                                    FontWeight.w400,
                                    TextAlign.start),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height: getPercentSize(remainHeight, 5),
                          // ),
                          // can i test

                          
                          Row(
                            children: [
                              Expanded(
                                  child:   getTextWithFontFamilyWidget(
                                      model.price!,
                                      primaryColor,
                                      getPercentSize(remainHeight, 12),
                                      FontWeight.w400,
                                      TextAlign.start)),
                              SizedBox(
                                width: getPercentSize(width, 2),
                              ),
                              getAddMaterialWidget(context, Container(
                                height: getPercentSize(remainHeight, 15),
                                width: getPercentSize(remainHeight, 15),
                                decoration: getDecorationWithColor(
                                    getPercentSize(remainHeight, 3), primaryColor),
                                child: Center(
                                  child: Icon(Icons.add,
                                      color: Colors.white,
                                      size: getPercentSize(remainHeight, 15)),
                                ),
                              ), getPercentSize(remainHeight, 3), getPercentSize(remainHeight, 16))

                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailPage(model)));
          },
        );
      }),
    );
    //
    // double margin = getScreenPercentSize(context, 1);
    // var height = getScreenPercentSize(context, 36);
    //
    // double width = getWidthPercentSize(context, 40);
    // double sideMargin = margin * 1.2;
    // double imgHeight = getPercentSize(height, 47);
    // double remainHeight = height - imgHeight;
    //
    // double radius = getPercentSize(height, 5);
    //
    // double _crossAxisSpacing = 0;
    // var _screenWidth = MediaQuery.of(context).size.width;
    // var _crossAxisCount = 2;
    // var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
    //     _crossAxisCount;
    //
    // var _aspectRatio = _width / height;
    //
    // return Container(
    //
    //   child: GridView.count(
    //     crossAxisCount: _crossAxisCount,
    //     shrinkWrap: true,
    //     padding: EdgeInsets.symmetric(horizontal: defMargin),
    //     scrollDirection: Axis.vertical,
    //     primary: false,
    //     crossAxisSpacing: (defMargin),
    //     mainAxisSpacing: 0,
    //     childAspectRatio: _aspectRatio,
    //     children: List.generate(productList.length, (index) {
    //       ProductModel model = productList[index];
    //
    //       return InkWell(
    //         child: getMaterialCell(context,widget: Container(
    //           width: width,
    //           margin: EdgeInsets.symmetric(vertical: (defMargin/2)),
    //
    //           decoration: ShapeDecoration(
    //             color: backgroundColor,
    //             // shadows: [
    //             //   BoxShadow(
    //             //       color: primaryColor.withOpacity(0.1),
    //             //       blurRadius: 3,
    //             //       spreadRadius: 3,
    //             //       offset: Offset(0, 1))
    //             // ],
    //             shape: SmoothRectangleBorder(
    //               // side: BorderSide(color: iconColor, width: 0.1),
    //               borderRadius: SmoothBorderRadius(
    //                 cornerRadius: radius,
    //                 cornerSmoothing: 0.8,
    //               ),
    //             ),
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Container(
    //                 height: imgHeight,
    //                 margin: EdgeInsets.only(top: getPercentSize(width, 7),bottom: getPercentSize(width, 5)),
    //                 child: Stack(
    //                   children: [
    //                     Center(
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(radius),
    //
    //                         child: Image.asset(
    //                           assetsPath + model.image!,
    //                           width: width,
    //                           fit: BoxFit.fill,
    //                         ),
    //                       ),
    //                     ),
    //                     Align(
    //                       alignment: Alignment.topRight,
    //                       child: Container(
    //                         margin: EdgeInsets.symmetric(horizontal: getPercentSize(imgHeight, 14),vertical: getPercentSize(imgHeight, 6)),
    //                         height: getPercentSize(imgHeight, 18),
    //                         width: getPercentSize(imgHeight, 18),
    //                         decoration: ShapeDecoration(
    //                           color: backgroundColor,
    //                           shape: SmoothRectangleBorder(
    //                             side: BorderSide(color: iconColor, width: 0.1),
    //                             borderRadius: SmoothBorderRadius(
    //                               cornerRadius: getPercentSize(imgHeight, 5),
    //                               cornerSmoothing: 0.8,
    //                             ),
    //                           ),
    //                         ),
    //                         child: Center(
    //                           child: Image.asset(assetsPath + "heart.png",
    //                               color: primaryColor,
    //                               height: getPercentSize(imgHeight, 10)),
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               Expanded(
    //                   child: Container(
    //                     margin: EdgeInsets.symmetric(
    //                         horizontal: getPercentSize(width, 5)),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           children: [
    //                             Expanded(
    //                                 child: getTextWidget(
    //                                     model.name!,
    //                                     textColor,
    //                                     getPercentSize(remainHeight, 10),
    //                                     FontWeight.bold,
    //                                     TextAlign.start)),
    //                             getTextWithFontFamilyWidget(
    //                                 model.price!,
    //                                 primaryColor,
    //                                 getPercentSize(remainHeight, 10),
    //                                 FontWeight.w500,
    //                                 TextAlign.start)
    //                           ],
    //                         ),
    //                         SizedBox(
    //                           height: getPercentSize(remainHeight, 4),
    //                         ),
    //                         Row(
    //                           children: [
    //                             Image.asset(
    //                               assetsPath + "location.png",
    //                               height: getPercentSize(remainHeight, 9),
    //                             ),
    //                             SizedBox(
    //                               width: getPercentSize(width, 2),
    //                             ),
    //                             Expanded(
    //                                 child: getTextWidget(
    //                                     model.address!,
    //                                     textColor,
    //                                     getPercentSize(remainHeight, 9),
    //                                     FontWeight.w400,
    //                                     TextAlign.start)),
    //                           ],
    //                         ),
    //                         SizedBox(
    //                           height: getPercentSize(remainHeight, 6),
    //                         ),
    //                         Row(
    //                           children: [
    //                             Expanded(
    //                                 child: getTextWidget(
    //                                     model.desc!,
    //                                     subTextColor,
    //                                     getPercentSize(remainHeight, 8),
    //                                     FontWeight.w400,
    //                                     TextAlign.start)),
    //                             SizedBox(
    //                               width: getPercentSize(width, 2),
    //                             ),
    //
    //
    //
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   )),
    //             ],
    //           ),
    //         )),
    //         onTap: () {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => ProductDetailPage(model)));
    //         },
    //       );
    //     }),
    //   ),
    // );
  }


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



  // getCategoryList() {
  //   double height = getScreenPercentSize(context, 6);
  //   double width = getWidthPercentSize(context, 20);
  //   double radius = getPercentSize(height, 20);
  //   return Container(
  //       height: height,
  //       child: ListView.builder(
  //           padding: EdgeInsets.zero,
  //           shrinkWrap: true,
  //           itemCount: dataList.length,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) {
  //             double imageSize = getPercentSize(height, 50);
  //             double remainSize = height - getPercentSize(height, 50);
  //
  //             bool isSelected = (selectedCategory == index);
  //
  //             return InkWell(
  //               child: Container(
  //                 decoration: ShapeDecoration(
  //                   color: isSelected?primaryColor:alphaColor,
  //                   shadows: [
  //                     BoxShadow(
  //                         color: isSelected?subTextColor.withOpacity(0.1):Colors.transparent,
  //                         blurRadius: 2,
  //                         spreadRadius: 1,
  //                         offset: Offset(0, 1))
  //                   ],
  //                   shape: SmoothRectangleBorder(
  //                     side: BorderSide(color: iconColor, width: 0.1),
  //                     borderRadius: SmoothBorderRadius(
  //                       cornerRadius: radius,
  //                       cornerSmoothing: 0.8,
  //                     ),
  //                   ),
  //                 ),
  //                 padding: EdgeInsets.all(getPercentSize(height, 5)),
  //                 margin: EdgeInsets.only(
  //                     left: defMargin,
  //                     right: getWidthPercentSize(context, 2),
  //                     bottom: getScreenPercentSize(context, 0.5),
  //                     top: getScreenPercentSize(context, 0.5)),
  //                 width: width,
  //                 child:
  //                 Center(
  //                   child: getCustomTextWidget(
  //                               dataList[index].name!,
  //                               isSelected ? Colors.white : subTextColor,
  //                               getPercentSize(height, 30),
  //                               FontWeight.w500,
  //                               TextAlign.center,
  //                               1),
  //                 )
  //
  //                 // child: Column(
  //                 //   children: [
  //                 //     Container(
  //                 //       height: imageSize,
  //                 //       width: double.infinity,
  //                 //       decoration: BoxDecoration(
  //                 //         color: isSelected ? Colors.white : Colors.transparent,
  //                 //         borderRadius:
  //                 //             BorderRadius.circular(getPercentSize(radius, 80)),
  //                 //         // shape: BoxShape.circle,
  //                 //       ),
  //                 //       child: Center(
  //                 //         child: Image.asset(
  //                 //           assetsPath + dataList[index].image!,
  //                 //           height: getPercentSize(imageSize, 90),
  //                 //         ),
  //                 //       ),
  //                 //     ),
  //                 //
  //                 //     Expanded(
  //                 //       child: Center(
  //                 //         child: getCustomTextWidget(
  //                 //             dataList[index].name!,
  //                 //             isSelected ? Colors.white : textColor,
  //                 //             getPercentSize(remainSize, 25),
  //                 //             FontWeight.w500,
  //                 //             TextAlign.center,
  //                 //             1),
  //                 //       ),
  //                 //     )
  //                 //     // Visibility(
  //                 //     //   visible: (selectedCategory == index),
  //                 //     //   child: Container(
  //                 //     //     height: imageSize,
  //                 //     //     width: imageSize,
  //                 //     //     decoration: BoxDecoration(
  //                 //     //       color: primaryColor.withOpacity(0.4),
  //                 //     //       shape: BoxShape.circle,
  //                 //     //     ),
  //                 //     //     child: Center(
  //                 //     //       child: getCustomTextWidget(
  //                 //     //           dataList[index].name!,
  //                 //     //           Colors.white,
  //                 //     //           getPercentSize(imageSize, 20),
  //                 //     //           FontWeight.w500,
  //                 //     //           TextAlign.center,
  //                 //     //           1),
  //                 //     //     ),
  //                 //     //   ),
  //                 //     // ),
  //                 //   ],
  //                 // ),
  //               ),
  //               onTap: () {
  //                 setState(() {
  //                   selectedCategory= index;
  //                 });
  //                 // Navigator.push(
  //                 //     context,
  //                 //     MaterialPageRoute(
  //                 //         builder: (context) => SubCategoriesPage()));
  //               },
  //             );
  //           }));
  // }

  List<String> list = [
    'Latest Products',
    'Best Selling',
    'Lowest Price',
    'Highest Price'
  ];

  int position = 0;

  filterDialog() {
    double height = getScreenPercentSize(context, 60);
    double radius = getScreenPercentSize(context, 3);
    double subHeight = getPercentSize(height, 12);
    double margin = getScreenPercentSize(context, 2);

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius))),
        builder: (context) {
          return  FractionallySizedBox(
            heightFactor: 0.6,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  // height: height,
                  // padding: EdgeInsets.symmetric(horizontal: getScreenPercentSize(context, 2)),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: getScreenPercentSize(context, 2),),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: margin),
                        child: Row(
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
                                  size: getPercentSize(height, 5),
                                  color: textColor,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getPercentSize(height, 1),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: margin),
                        child: getTextWidget(
                            'Arrange based on the following types',
                            subTextColor,
                            getPercentSize(height, 3),
                            FontWeight.w400,
                            TextAlign.start),
                      ),
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
                              setState(() {
                              position=index;
                              // Navigator.of(context).pop();
                              // filterDialog1();
                              });
                            },
                            child: Container(
                              height: subHeight,
                              margin: EdgeInsets.symmetric(
                                  vertical: getPercentSize(height, 1.5),horizontal: margin),
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
                      ),

                      SizedBox(
                        height: getPercentSize(height, 6),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: margin),
                        child: Row(

                          children: [

                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));

                                  Navigator.of(context).pop();


                                },
                                child: getMaterialCell(context,widget: Container(
                                  margin: EdgeInsets.only(right: getWidthPercentSize(context,2)),
                                  height: getScreenPercentSize(context,7),

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
                                      side: BorderSide(color: primaryColor,width: 2),
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: getScreenPercentSize(context, 1.8),
                                        cornerSmoothing: 0.8,
                                      ),
                                    ),
                                  ),





                                  child: Center(
                                    child: getTextWidget('Reset', textColor, getScreenPercentSize(context, 2),
                                        FontWeight.bold, TextAlign.center),
                                  ),
                                )),
                              ),
                            ),


                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).pop();
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
                                child: getMaterialCell(context,widget: Container(
                                  margin: EdgeInsets.only(left: getWidthPercentSize(context,2)),
                                  height: getScreenPercentSize(context,7),

                                  decoration: ShapeDecoration(

                                    color: primaryColor,
                                    // shadows: [BoxShadow(
                                    //     color: textColor.withOpacity(0.1),
                                    //     blurRadius: 2,
                                    //     spreadRadius: 1,
                                    //     offset: Offset(0, 4))],
                                    shape: SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: getScreenPercentSize(context, 1.8),
                                        cornerSmoothing: 0.8,
                                      ),
                                    ),
                                  ),





                                  child: Center(
                                    child: getTextWidget('Apply', Colors.white, getScreenPercentSize(context, 2),
                                        FontWeight.bold, TextAlign.center),
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),




                    ],
                  ),
                );
              },
            ),
          );
        });
  }


  List<String> materialList = ['King','Pedigree','Baker','Whiskies','Chomp','Pet Toys','Meow','Bash','Domino'];

  int materialPosition=0;

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
                      SizedBox(height:margin ,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: margin),
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
                        padding:  EdgeInsets.symmetric(horizontal: margin),
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
                        padding:  EdgeInsets.symmetric(horizontal: margin),
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
                        padding:  EdgeInsets.symmetric(horizontal: margin),
                        child: Row(
                          children: [
                            Expanded(
                              child: getTextWidget('\$50', primaryColor, getScreenPercentSize(context, 2),
                                  FontWeight.w600, TextAlign.start),),


                            getTextWidget('\$250', primaryColor, getScreenPercentSize(context, 2),
                                FontWeight.w600, TextAlign.start),

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
                        padding:  EdgeInsets.symmetric(horizontal: margin),
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


                      Padding(padding: EdgeInsets.symmetric(horizontal: margin),
                          child: getGrid(setState))
                      ,
                      SizedBox(
                        height: getPercentSize(height, 10),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: margin),
                        child: Row(

                          children: [

                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));

                                  Navigator.of(context).pop();


                                },
                                child: getMaterialCell(context,widget: Container(
                                  margin: EdgeInsets.only(right: getWidthPercentSize(context,3)),
                                  height: getScreenPercentSize(context,7),

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
                                      side: BorderSide(color: primaryColor,width: 2),
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: getScreenPercentSize(context, 1.8),
                                        cornerSmoothing: 0.8,
                                      ),
                                    ),
                                  ),





                                  child: Center(
                                    child: getTextWidget('Reset', textColor, getScreenPercentSize(context, 2),
                                        FontWeight.bold, TextAlign.center),
                                  ),
                                )),
                              ),
                            ),


                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).pop();
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
                                child: getMaterialCell(context,widget: Container(
                                  margin: EdgeInsets.only(left: getWidthPercentSize(context,3)),
                                  height: getScreenPercentSize(context,7),

                                  decoration: ShapeDecoration(

                                    color: primaryColor,
                                    // shadows: [BoxShadow(
                                    //     color: textColor.withOpacity(0.1),
                                    //     blurRadius: 2,
                                    //     spreadRadius: 1,
                                    //     offset: Offset(0, 4))],
                                    shape: SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: getScreenPercentSize(context, 1.8),
                                        cornerSmoothing: 0.8,
                                      ),
                                    ),
                                  ),





                                  child: Center(
                                    child: getTextWidget('Apply', Colors.white, getScreenPercentSize(context, 2),
                                        FontWeight.bold, TextAlign.center),
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
                margin: EdgeInsets.only(top: getPercentSize(cellHeight, 3),bottom: 1),
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: getWidthPercentSize(context, 3)),
                decoration: ShapeDecoration(
                  color: (materialPosition == index)
                      ? primaryColor
                      : alphaColor,
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
                    (index == materialPosition) ? Colors.white : textColor,getPercentSize(cellHeight, 30),
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

}

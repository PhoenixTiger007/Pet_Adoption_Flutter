import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/DataModel.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import '../ProductDetailPage.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidget createState() {
    return _SearchWidget();
  }
}

class _SearchWidget extends State<SearchWidget>
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
  FocusNode myFocusNode=FocusNode();
  bool isAutoFocus=false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    padding = getScreenPercentSize(context, 2);
    defMargin = getHorizontalSpace(context);
    height = getScreenPercentSize(context, 5.5);

    double radius = getScreenPercentSize(context, 1.5);
    print('defMargin-12--$defMargin');
    return Container(
      width: double.infinity,
      color: backgroundColor,
      // padding: EdgeInsets.on(vertical: defMargin),
      child: GestureDetector(
        onTap: (){
          setState(() {
            myFocusNode.canRequestFocus=false;
          });
        },
        child: Column(
          children: [
            getAppBar(context, 'Search'),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: getScreenPercentSize(context, 1.5),),
                  Padding(
                    padding:  EdgeInsets.all(defMargin),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return Container(

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
                                fontSize: getScreenPercentSize(context, 1.7),
                              ),
                              onChanged: (string) {},
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: defMargin),
                                hintText: 'Search food , accessories..',
                                // prefixIcon: Icon(Icons.search),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: subTextColor,
                                ),
                                hintStyle: TextStyle(
                                  color: subTextColor,
                                  fontFamily: fontFamily,
                                  fontSize: getScreenPercentSize(context, 1.7),
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                isDense: true,
                                fillColor: Colors.transparent,
                                disabledBorder: getOutLineBorder(radius),
                                enabledBorder: getOutLineBorder(radius),
                                focusedBorder: getOutLineBorder(radius),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: (defMargin/2),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defMargin),
                    child: getTextWithFontFamilyWidget(
                        'Category',
                        textColor,
                        getScreenPercentSize(context, 2),
                        FontWeight.w500,
                        TextAlign.start),
                  ),
                  SizedBox(height: (defMargin/2),),

                  getCategoryList(),
                  // SizedBox(
                  //   height: getScreenPercentSize(context, 1),
                  // ),
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
      ),
    );
  }

  int selectedCategory = 0;
  // sellerList() {
  //   var height = getScreenPercentSize(context, 32);
  //
  //   double width = getWidthPercentSize(context, 50);
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
  //         ProductModel model = productList[index];
  //
  //         return InkWell(
  //           child: Container(
  //             // margin: EdgeInsets.only(
  //             //     left: defMargin, top: margin, bottom: margin),
  //
  //             decoration: getDecoration(radius),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Container(
  //
  //                   height: imgHeight,
  //                   margin: EdgeInsets.all(getPercentSize(width, 2)),
  //
  //                   // decoration: BoxDecoration(
  //                   //     color: cellColor,
  //                   //     borderRadius:
  //                   //     BorderRadius.all(Radius.circular(radius))),
  //                   child: Center(
  //                       child: Image.asset(
  //                         assetsPath + model.image!,
  //                       )),
  //                 ),
  //                 Expanded(
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       children: [
  //                         getTextWidget(
  //                             model.name!,
  //                             textColor,
  //                             getPercentSize(remainHeight, 13),
  //                             FontWeight.w500,
  //                             TextAlign.start),
  //                         SizedBox(
  //                           height: getPercentSize(remainHeight, 5),
  //
  //                         ),
  //                         getTextWidget(
  //                             model.subTitle!,
  //                             subTextColor,
  //                             getPercentSize(remainHeight, 10),
  //                             FontWeight.w300,
  //                             TextAlign.center)
  //
  //                        ,
  //
  //
  //                         SizedBox(
  //                           height: getPercentSize(remainHeight, 5),
  //
  //                         ),
  //                         getTextWidget(
  //                             model.price!,
  //                             primaryColor,
  //                             getPercentSize(remainHeight, 18),
  //                             FontWeight.bold,
  //                             TextAlign.center),
  //                       ],
  //                     )),
  //                 // getTextWidget(
  //                 //     model.price!,
  //                 //     primaryColor,
  //                 //     getPercentSize(height, 25),
  //                 //     FontWeight.bold,
  //                 //     TextAlign.center),
  //               ],
  //             ),
  //           ),
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => ProductDetailPage(model)));
  //           },
  //         );
  //
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

    return GridView.count(
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
                            height: getPercentSize(remainHeight, 3),
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
                          SizedBox(
                            height: getPercentSize(remainHeight, 3),
                          ),
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
  //   double height = getScreenPercentSize(context, 15);
  //   double width = getWidthPercentSize(context, 20);
  //   double radius = getPercentSize(height, 20);
  //
  //   print("defMargin---$defMargin");
  //   return Container(
  //       height: height,
  //       child: ListView.builder(
  //           padding: EdgeInsets.symmetric(horizontal: defMargin),
  //           shrinkWrap: true,
  //           itemCount: dataList.length,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) {
  //             double imageSize = getPercentSize(height, 50);
  //             double remainSize = height - getPercentSize(height, 50);
  //
  //             bool isSelected = (selectedCategory == index);
  //
  //             return Container(
  //               margin: EdgeInsets.only(
  //                   right: getWidthPercentSize(context, 4),
  //
  //                   bottom: getScreenPercentSize(context, 0.5),
  //                   top: getScreenPercentSize(context, 0.5)),
  //               child: InkWell(
  //                 child: Container(
  //                   decoration: isSelected?
  //
  //
  //                   ShapeDecoration(
  //                     color: primaryColor,
  //
  //                     shape: SmoothRectangleBorder(
  //                       // side: BorderSide(color: iconColor, width: 0.1),
  //                       borderRadius: SmoothBorderRadius(
  //                         cornerRadius: radius,
  //                         cornerSmoothing: 0.8,
  //                       ),
  //                     ),
  //                   )
  //
  //                   // ? BoxDecoration(
  //                   //     color: primaryColor,
  //                   //     borderRadius: BorderRadius.circular(radius),
  //                   //   )
  //                       :   ShapeDecoration(
  //                     color: backgroundColor,
  //
  //                     shape: SmoothRectangleBorder(
  //                       side: BorderSide(color: borderColor, width: 1),
  //                       borderRadius: SmoothBorderRadius(
  //                         cornerRadius: radius,
  //                         cornerSmoothing: 0.8,
  //                       ),
  //                     ),
  //                   )
  //                   ,
  //                   padding: EdgeInsets.all(getPercentSize(height, 5)),
  //
  //                   width: width,
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         height: imageSize,
  //                         width: double.infinity,
  //                         decoration:   ShapeDecoration(
  //                           color: isSelected ? Colors.white : Colors.transparent,
  //
  //                           shape: SmoothRectangleBorder(
  //                             // side: BorderSide(color: iconColor, width: 0.1),
  //                             borderRadius: SmoothBorderRadius(
  //                               cornerRadius: getPercentSize(radius, 80),
  //                               cornerSmoothing: 0.9,
  //                             ),
  //                           ),
  //                         ),
  //
  //                         child: Center(
  //                           child: Image.asset(
  //                             assetsPath + dataList[index].image!,
  //                             height: getPercentSize(imageSize, 90),
  //                           ),
  //                         ),
  //                       ),
  //
  //                       Expanded(
  //                         child: Center(
  //                           child: getCustomTextWidget(
  //                               dataList[index].name!,
  //                               isSelected ? Colors.white : textColor,
  //                               getPercentSize(remainSize, 25),
  //                               FontWeight.w500,
  //                               TextAlign.center,
  //                               1),
  //                         ),
  //                       )
  //                       // Visibility(
  //                       //   visible: (selectedCategory == index),
  //                       //   child: Container(
  //                       //     height: imageSize,
  //                       //     width: imageSize,
  //                       //     decoration: BoxDecoration(
  //                       //       color: primaryColor.withOpacity(0.4),
  //                       //       shape: BoxShape.circle,
  //                       //     ),
  //                       //     child: Center(
  //                       //       child: getCustomTextWidget(
  //                       //           dataList[index].name!,
  //                       //           Colors.white,
  //                       //           getPercentSize(imageSize, 20),
  //                       //           FontWeight.w500,
  //                       //           TextAlign.center,
  //                       //           1),
  //                       //     ),
  //                       //   ),
  //                       // ),
  //                     ],
  //                   ),
  //                 ),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedCategory= index;
  //                   });
  //                   // Navigator.push(
  //                   //     context,
  //                   //     MaterialPageRoute(
  //                   //         builder: (context) => SubCategoriesPage()));
  //                 },
  //               ),
  //             );
  //           }));
  // }


}

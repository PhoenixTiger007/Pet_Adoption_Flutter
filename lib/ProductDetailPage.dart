import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';

import 'AddToCartPage.dart';
import 'model/ReviewModel.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel model;

  const ProductDetailPage(this.model, {super.key});

  @override
  _ProductDetailPage createState() {
    return _ProductDetailPage();
  }
}

class _ProductDetailPage extends State<ProductDetailPage> {
  ScrollController? _scrollController;

  List<ReviewModel> reViewModelList = DataFile.getReviewList();

  List<String> sliderList = [];
  List<ProductModel> subCategoryModelList = DataFile.getProductModel();

  int sliderPosition = 0;

  ProductModel? sModel;

  _scrollListener() {
    setState(() {});
  }

  final controller = PageController();

  int position = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);

    sModel = widget.model;

    for (int i = 0; i < 4; i++) {
      sliderList.add(subCategoryModelList[i].image!);
    }
    setState(() {});
    super.initState();
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }


  @override
  Widget build(BuildContext context) {

    double imgHeight = getWidthPercentSize(context, 75);

    double margin = getHorizontalSpace(context);



    return WillPopScope(
        onWillPop: () async {
          _requestPop();
          return false;
        },
        child: Scaffold(
          backgroundColor: backgroundColor,

          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  getAppBar(context, widget.model.name!, isBack: true,
                      function: () {
                        _requestPop();
                      },
                      widget: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            '${assetsPath}heart.png',
                            height: getScreenPercentSize(context, 2.5),
                            color: textColor,
                          ))),
                  SizedBox(
                    height: getScreenPercentSize(context, 1.5),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: margin),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(getPercentSize(imgHeight, 4)),

                          child: Image.asset(
                            '${assetsPath}product_detail.png',
                            // assetsPath + widget.model.image!,
                            width: imgHeight,
                            height: imgHeight,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: margin),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: (margin/2)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: getTextWithFontFamilyWidget(
                                      widget.model.name!,
                                      textColor,
                                      getScreenPercentSize(context, 3),
                                      FontWeight.w500,
                                      TextAlign.start)),
                              getTextWithFontFamilyWidget(
                                  widget.model.price!,
                                  primaryColor,
                                  getScreenPercentSize(context, 3),
                                  FontWeight.w500,
                                  TextAlign.start)
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              '${assetsPath}star.png',
                              height: getScreenPercentSize(context, 2.2),
                            ),
                            SizedBox(
                              width: getWidthPercentSize(context, 2),
                            ),
                            Expanded(
                                child: getTextWidget(
                                    '4.5',
                                    textColor,
                                    getScreenPercentSize(context, 2),
                                    FontWeight.w400,
                                    TextAlign.start)),
                          ],
                        ),



                        Container(
                          margin:
                          EdgeInsets.only(top: (margin * 1.5), bottom: (margin/2)),
                          child: getTextWithFontFamilyWidget(
                              'Description',
                              textColor,
                              getScreenPercentSize(context, 2.2),
                              FontWeight.w500,
                              TextAlign.start),
                        ),
                        getCustomTextWidget(
                            loremText,
                            textColor,
                            getScreenPercentSize(context, 1.9),
                            FontWeight.w500,
                            TextAlign.left,
                            5),
                        Container(
                          margin:
                          EdgeInsets.only(top: (margin *1.5), bottom: margin),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: getTextWithFontFamilyWidget(
                                    'Quantity',
                                    textColor,
                                    getScreenPercentSize(context, 2.2),
                                    FontWeight.w500,
                                    TextAlign.start),
                              ),

                              Padding(
                                padding: EdgeInsets.only(right: margin),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    getCartButton(Icons.remove,cellColor,textColor, () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      });
                                    }),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 6)),
                                      child: Center(
                                        child: getTextWithFontFamilyWidget('1', textColor,
                                            getScreenPercentSize(context, 2),FontWeight.w400,TextAlign.center),
                                      ),
                                    ),


                                    getCartButton(Icons.add,primaryColor,Colors.white, () {
                                      setState(() {
                                        quantity++;
                                      });
                                    }),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: margin),
                    child: getButtonWidget(context, 'Add to Cart',primaryColor,(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCartPage(),));

                    }),
                  )
                ],
              ),
            ),
          ),

//           body: SafeArea(
//             child: Container(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         Container(
//                           height: height,
//                             // color: cellColor,
//
//                           child: Stack(
//                             children: [
//
//
//                               PageView.builder(
//                                 controller: controller,
//                                 onPageChanged: _onPageViewChange,
//                                 itemBuilder: (context, position) {
//                                   return Container(
// child:   Center(
//   child: Image.asset(
//     assetsPath + sModel!.image!,
//     height: getPercentSize(height, 50),
//   ),
// ),
//
//                                       // decoration: BoxDecoration(
//                                       //     image: DecorationImage(
//                                       //         image: AssetImage(
//                                       //             assetsPath + sliderList[position]),
//                                       //         fit: BoxFit.cover))
//
//                                   );
//                                 },
//                                 itemCount: sliderList.length,
//                               ),
//
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: defMargin, vertical: (defMargin / 2)),
//                                 child: InkWell(
//                                   child: Icon(
//                                     Icons.keyboard_backspace,
//                                     color: textColor,
//                                   ),
//                                   onTap: _requestPop,
//                                 ),
//                               ),
//
//
//
//
//                               Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child:
//                                 Container(
//                                   // margin: EdgeInsets.all(defMargin),
//
//                                   padding: EdgeInsets.only(bottom: defMargin),
//                                   child: SmoothPageIndicator(
//                                     count:  sliderList.length,
//
//                                     effect:  WormEffect(activeDotColor: primaryColor,dotHeight: 10,dotWidth: 10),
//                                     controller: controller,// your preferred effect
//
//                                   )
//                                   ,
//
//                                 ),
//                               )
//
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: margin),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: (margin / 1.2),
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: getCustomTextWidget(
//                                         sModel!.name!,
//                                         textColor,
//                                         getScreenPercentSize(context, 2.5),
//                                         FontWeight.bold,
//                                         TextAlign.start,
//                                         2),
//                                   ),
//                                   Column(
//                                     children: [
//                                       getLineTextView('\$100', subTextColor,
//                                           getScreenPercentSize(context, 2)),
//                                       SizedBox(
//                                         height: margin,
//                                       ),
//                                       getTextWidget(
//                                         sModel!.price!,
//                                         Colors.redAccent,
//                                         getScreenPercentSize(context, 1.8),
//                                         FontWeight.bold,
//                                         TextAlign.end,
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                               getTextWidget(
//                                 'Description',
//                                 textColor,
//                                 getScreenPercentSize(context, 2),
//                                 FontWeight.bold,
//                                 TextAlign.start,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(vertical: margin),
//                                 child: getSpaceTextWidget(
//                                     loremText,
//                                     subTextColor,
//                                     TextAlign.start,
//                                     FontWeight.w400,
//                                     getScreenPercentSize(context, 2)),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//
//
//                   Padding(
//                     padding:  EdgeInsets.only(left: margin,right: margin,bottom: defMargin),
//                     child: Row(
//                       children: [
//                         getCartButton(Icons.remove,cellColor,textColor, () {
//                           setState(() {
//                             if (sModel!.quantity > 1) {
//                               sModel!.quantity--;
//                             }
//                           });
//                         }),
//                         SizedBox(
//                           width:
//                           getScreenPercentSize(
//                               context, 2),
//                         ),
//                         getCustomTextWidget(
//                             sModel!.quantity.toString(),
//                             textColor,
//                             getScreenPercentSize(
//                                 context, 1.8),
//                             FontWeight.w500,
//                             TextAlign.start,
//                             1),
//                         SizedBox(
//                           width:
//                           getScreenPercentSize(
//                               context, 2),
//                         ),
//                         getCartButton(Icons.add,primaryColor,Colors.white, () {
//                           setState(() {
//                             sModel!.quantity++;
//                           });
//                         }),
//                         SizedBox(
//                           width:
//                           getScreenPercentSize(
//                               context, 2),
//                         ),
//                         Expanded(child: getBlueButton(context, (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCartPage(),));
//                         }, "Add to Cart"))
//                       ],
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//           ),



        ));
  }


  int quantity=0;
  getCartButton(var icon,var color,var iconColor, Function function) {


    return InkWell(
      child: Icon(
        icon,
        size: getScreenPercentSize(context,3),
        color: primaryColor,
      ),
      onTap: (){
        function();
      },
    );
  }

}

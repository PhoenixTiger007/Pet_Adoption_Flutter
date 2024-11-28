import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/CheckAddressPage.dart';
import 'package:flutter_pet_shop/MainPage.dart';
import 'package:flutter_pet_shop/SignInPage.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/PrefData.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'ProductDetailPage.dart';
import 'generated/l10n.dart';

class AddToCartPage extends StatefulWidget {
  final Function? function;

  const AddToCartPage({super.key, this.function});

  @override
  _AddToCartPage createState() {
    return _AddToCartPage();
  }
}

class _AddToCartPage extends State<AddToCartPage> {
  List<ProductModel> cartModelList = [];

  _AddToCartPage();
  bool _isSignIn = false;
  bool isData = false;



  @override
  void initState() {
    super.initState();
    signInValue();
    cartModelList = DataFile.getCartModel();
    isDataAvailable();
    setState(() {});
  }
  isDataAvailable() async {
    isData = await PrefData.getIsCart();
    setState(() {});
  }

  Future<bool> _requestPop() {
    if(widget.function!=null){
      widget.function!();
    }else{
      Navigator.of(context).pop();
    }

    return Future.value(true);
  }
  void doNothing(BuildContext context) {}
  void signInValue() async {
    _isSignIn = await PrefData.getIsSignIn();
    setState(() {

    });

  }double leftMargin=0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
     leftMargin =getHorizontalSpace(context);



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

                getAppBar(context, 'Cart',isBack: true,function: (){
                  _requestPop();
                }),
                SizedBox(height: getScreenPercentSize(context, 1.5),)
,
                
                


                Expanded(
                  child: isData?Container(
                    margin: EdgeInsets.only(

                        bottom: MediaQuery
                            .of(context)
                            .size
                            .width * 0.01),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartModelList.length,
                        itemBuilder: (context, index) {
                          return ListItem(
                              index, cartModelList[index], (){
                            removeItem(index);
                          });
                        }),
                  ):emptyWidget(),
                  flex: 1,
                ),
                Visibility(
                  visible: isData,
                  child: Container(
                    padding: EdgeInsets.only(top: leftMargin,),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: leftMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: getCustomTextWithFontFamilyWidget(
                                    S.of(context).total,
                                    textColor,
                                    getScreenPercentSize(context, 2.3),
                                    FontWeight.w700,
                                    TextAlign.start,
                                    1),
                              ),
                              Expanded(
                                flex: 1,
                                child: getCustomTextWithFontFamilyWidget(
                                    '\$104.50',
                                    primaryColor,
                                    getScreenPercentSize(context, 2.8),
                                    FontWeight.w400,
                                    TextAlign.end,
                                    1),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: leftMargin,
                        ),
                        getButtonWidget(context, 'Continue',primaryColor,(){
                          if(_isSignIn) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckAddressPage(),
                                ));
                          }else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          }
                        }),


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  getRoWCell(String s, String s1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: getCustomTextWidget(s, textColor, getScreenPercentSize(context, 2), FontWeight.w800, TextAlign.start, 1),
        ),
        Expanded(
          flex: 1,
          child: getCustomTextWidget(s1, subTextColor, getScreenPercentSize(context, 2),FontWeight.w500, TextAlign.end,
               1),
        )
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      // cartModelList.remove(cartModelList[index]);
    });
  }


  emptyWidget(){
double width=getWidthPercentSize(context, 45);
double height=getScreenPercentSize(context, 7);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('${assetsPath}cart_item.png',height: getScreenPercentSize(context, 20),),
          SizedBox(height: getScreenPercentSize(context, 3),),
          getCustomTextWithFontFamilyWidget('Your Cart is Empty Yet!',
              textColor, getScreenPercentSize(context, 2.5), FontWeight.w500, TextAlign.center, 1),
          SizedBox(height: getScreenPercentSize(context, 1),),

          getCustomTextWidget('Explore more and shortlist some pets.',
              textColor, getScreenPercentSize(context, 2), FontWeight.w400, TextAlign.center, 1),

          InkWell(
            onTap: (){
              PrefData.setIsCart(true);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
            },
            child: getMaterialCell(context,widget: Container(
                margin: EdgeInsets.only(top: getScreenPercentSize(context, 4)),
                width: width,
                height: height,
                decoration: ShapeDecoration(
                  color: backgroundColor,
                  // shadows: [
                  //   BoxShadow(
                  //       color: primaryColor.withOpacity(0.1),
                  //       blurRadius: 5,
                  //       spreadRadius: 5,
                  //       offset: Offset(0, 5))
                  // ],
                  shape: SmoothRectangleBorder(
                    side: BorderSide(color: primaryColor, width: 1.5),
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: getPercentSize(height, 25),
                      cornerSmoothing: 0.8,
                    ),
                  ),
                ),

                child: Center(
                  child: getCustomTextWidget('Go to Shop',
                      primaryColor, getPercentSize(width, 10), FontWeight.w600, TextAlign.center, 1),
                )
            )),
          )

        ],
      ),
    );

  }
}

class ListItem extends StatefulWidget {
  final ProductModel subCategoryModel;

  final int index;
  final Function? onChanged;

  // ListItem(this.imageSize, this.subCategoryModel);
  const ListItem(this.index, this.subCategoryModel, this.onChanged, {super.key});

  @override
  RoomEditDeleteItemState createState() =>
      RoomEditDeleteItemState(
          subCategoryModel,
          onChanged);
}

class RoomEditDeleteItemState extends State<ListItem> {
  double imageSize=0;
  final Function? onChanged;
  ProductModel? subCategoryModel;




  RoomEditDeleteItemState(
      this.subCategoryModel,
      this.onChanged);

  @override
  Widget build(BuildContext context) {
    double height = getScreenPercentSize(context, 12);
    double imageSize = getPercentSize(height, 90);
    double margin = getScreenPercentSize(context, 1.5);
    double radius = getScreenPercentSize(context, 1.5);

    setThemePosition();
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailPage(subCategoryModel!)));
      },
      child: getMaterialCell(context,widget: Container(


        decoration: getDecoration(radius),


        margin: EdgeInsets.symmetric(vertical:getScreenPercentSize(context, 1),horizontal:getHorizontalSpace(context) ),
        height: height,
        child: Row(
          children: [
            Container(
              height: imageSize,
              width: imageSize,
              margin: EdgeInsets.only(right: margin,left: getPercentSize(height, 5)),


              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(radius)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  assetsPath+subCategoryModel!.image!,
                  fit: BoxFit.fill,

                ),
              ),
            )
            ,



            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      getCustomTextWithFontFamilyWidget(
                          subCategoryModel!.name!,
                          textColor,
                          getPercentSize(height, 16),

                          FontWeight.w500, TextAlign.start,
                          1),



                      SizedBox(
                        height: getPercentSize(height, 2),
                      ),
                      getCustomTextWidget(
                          subCategoryModel!.subTitle!,
                          textColor,
                          getPercentSize(height, 12),
                          FontWeight.w400,
                          TextAlign.start,
                          1),


                      SizedBox(
                        height: getPercentSize(height, 10),
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: getCustomTextWithFontFamilyWidget(
                                subCategoryModel!.price!,
                                primaryColor,
                                getPercentSize(height, 15),
                                FontWeight.w400,
                                TextAlign.start,

                                1),
                          ),

                          Padding(
                            padding: EdgeInsets.only(right: margin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                getCartButton(Icons.remove,cellColor,textColor, () {
                                  setState(() {
                                    if (subCategoryModel!.quantity > 1) {
                                      subCategoryModel!.quantity--;
                                    }
                                  });
                                }),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 2)),
                                  child: Center(
                                    child: getTextWithFontFamilyWidget('1', textColor,
                                        getPercentSize(height, 15),FontWeight.w400,TextAlign.center),
                                  ),
                                ),


                                getCartButton(Icons.add,primaryColor,Colors.white, () {
                                  setState(() {
                                    subCategoryModel!.quantity++;
                                  });
                                }),
                              ],
                            ),
                          ),

                          // SizedBox(
                          //   width: getWidthPercentSize(context, 3),
                          // ),

                          // getLineTextView(subCategoryModel!.offerPrice!, subTextColor,
                          //     getPercentSize(height, 15)),
                        ],
                      )


                    ],
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        margin: EdgeInsets.all(getPercentSize(height, 12)),
                        child: Image.asset('${assetsPath}trash.png',height: getPercentSize(height, 17),)),
                  )
                ],
              ),
            ),





          ],
        ),
      )),
    );
  }


  getCartButton(var icon,var color,var iconColor, Function function) {
    double height1 = getScreenPercentSize(context, 12);

    double height = getPercentSize(height1, 20);

    return InkWell(
      child: SizedBox(
        height: height,
        width: height,

        child: Icon(
          icon,
          size: height,
          color: primaryColor,
        ),
      ),
      onTap: (){
        function();
      },
    );
  }
}

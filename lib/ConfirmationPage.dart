import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';
import 'package:flutter_pet_shop/utils/ThankYouDialog.dart';

import 'customView/ReviewSlider.dart';
import 'generated/l10n.dart';
import 'model/AddressModel.dart';
import 'model/PaymentCardModel.dart';
import 'model/ProductModel.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});




  @override
  _ConfirmationPage createState() {
    return _ConfirmationPage();
  }
}

class _ConfirmationPage extends State<ConfirmationPage> {
  List<AddressModel> addressList = DataFile.getAddressList();

  int currentStep = 0;
  List<PaymentCardModel> paymentModelList = DataFile.getPaymentCardList();
  List<ProductModel> cartModelList = DataFile.getCartModel();

  @override
  void initState() {
    super.initState();
    addressList = DataFile.getAddressList();
    Future.delayed(Duration(seconds:  1), () {
      setThemePosition(context: context);
      setState(() {});
    });
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  getOption() {
    return [
      'Address',
     'Payment',
      'Confirmation'
    ];
  }
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
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 0,
            backgroundColor: backgroundColor,
            title: getAppBarText(context,'Checkout'),
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
            child: Column(
              children: [
                getAppBar(context, 'Checkout',isBack: true,function: (){
                  _requestPop();
                }),
                SizedBox(height: getScreenPercentSize(context, 1.5),)
                ,

                ReviewSlider(
                    optionStyle: TextStyle(
                      fontFamily: customFontFamily,
                      fontSize: getScreenPercentSize(context, 1.7),
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    onChange: (index) {},
                    initialValue: 1,
                    circleDiameter: getScreenPercentSize(context, 5.5),
                    isCash: false,
                    width: double.infinity,
                    options: getOption()),

                Expanded(flex: 1,
                  child: ListView(
                    padding: EdgeInsets.only(left: leftMargin,right: leftMargin),

                    children: [

                      SizedBox(
                        height:
                        getScreenPercentSize(context, 3),
                      ),





                      getMaterialCell(context,widget: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            bottom: getScreenPercentSize(
                                context, 2)),
                        padding: EdgeInsets.all(
                            getScreenPercentSize(
                                context, 2)),

                        decoration: getDecorationWithRadius(


                            getScreenPercentSize(
                                context, 1.5),primaryColor),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getCustomTextWithoutAlignWithFontFamily(
                                'Shipping Address',
                                textColor,
                                FontWeight.w500,
                                getScreenPercentSize(context, 1.8)),


                            SizedBox(height: getScreenPercentSize(context, 1),),
                            getCustomTextWithoutAlign(
                                '1901 Thornier Cir.Shiloh,Hawaii 81063',
                                textColor,
                                FontWeight.w400,
                                getScreenPercentSize(context, 1.8))


                          ],
                        ),
                      )),


                      getMaterialCell(context,widget: Container(
                        margin: EdgeInsets.only(
                            bottom: getScreenPercentSize(
                                context, 2)),
                        padding: EdgeInsets.all(
                            getScreenPercentSize(
                                context, 2)),

                        decoration: getDecorationWithRadius(


                            getScreenPercentSize(
                                context, 1.5),primaryColor),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            getCustomTextWithoutAlignWithFontFamily(
                                'Payment Methods',
                                textColor,
                                FontWeight.w500,
                                getScreenPercentSize(context, 1.8)),
                            SizedBox(height: getScreenPercentSize(context, 1),),
                            Row(
                              children: [
                                Image.asset(
                                  '${assetsPath}paypal.png',
                                  height:
                                  getScreenPercentSize(
                                      context, 4),
                                ),
                                SizedBox(
                                  width:
                                  getScreenPercentSize(
                                      context, 2),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      getCustomTextWithoutAlignWithFontFamily(
                                          'Paypal',
                                          textColor,
                                          FontWeight.w500,
                                          getScreenPercentSize(context, 1.8)),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: getScreenPercentSize(
                                                context, 0.5)),
                                        child:
                                        getCustomTextWithoutAlign(
                                            paymentModelList[
                                            0]
                                                .desc!,
                                            textColor,
                                            FontWeight.w400,

                                            getScreenPercentSize(context, 1.8)),
                                      )
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      )),
                      getMaterialCell(context,widget: Container(
                        margin: EdgeInsets.only(
                            bottom: getScreenPercentSize(
                                context, 2)),
                        padding: EdgeInsets.all(
                            getScreenPercentSize(
                                context, 2)),

                        decoration: getDecorationWithRadius(


                            getScreenPercentSize(
                                context, 1.5),primaryColor),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            getCustomTextWithoutAlignWithFontFamily(
                                'Card Details',
                                textColor,
                                FontWeight.w500,
                                getScreenPercentSize(context, 1.8)),
                            SizedBox(height: getScreenPercentSize(context, 1),),

                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return Container(height: 1,color: borderColor,margin: EdgeInsets.symmetric(vertical: (leftMargin/2)),);
                                },
                                shrinkWrap: true,
                                itemCount: cartModelList.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Container(
                                        height: imageSize,
                                        width: imageSize,
                                        margin: EdgeInsets.only(right: (leftMargin/2),),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusDirectional.circular(radius)),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.asset(
                                            assetsPath+cartModelList[index].image!,
                                            fit: BoxFit.fill,

                                          ),
                                        ),
                                      )
                                      ,



                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(flex: 1,
                                              child: Column(

                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  getCustomTextWithFontFamilyWidget(
                                                      cartModelList[index].name!,
                                                      textColor,
                                                      getPercentSize(height, 16),

                                                      FontWeight.w500, TextAlign.start,
                                                      1),



                                                  SizedBox(
                                                    height: getPercentSize(height, 2),
                                                  ),
                                                  getCustomTextWidget(
                                                      cartModelList[index].subTitle!,
                                                      textColor,
                                                      getPercentSize(height, 14),
                                                      FontWeight.w400,
                                                      TextAlign.start,
                                                      1),







                                                ],
                                              ),
                                            ),

                                            getCustomTextWithFontFamilyWidget(
                                                cartModelList[index].price!,
                                                primaryColor,
                                                getPercentSize(height, 15),
                                                FontWeight.w400,
                                                TextAlign.start,

                                                1)

                                          ],
                                        ),
                                      ),





                                    ],
                                  );
                                })
                          ],
                        ),
                      )),




                      getMaterialCell(context,widget: Container(
                        margin: EdgeInsets.only(
                            bottom: getScreenPercentSize(
                                context, 2)),
                        padding: EdgeInsets.all(
                            getScreenPercentSize(
                                context, 2)),

                        decoration: getDecorationWithRadius(


                            getScreenPercentSize(
                                context, 1.5),primaryColor),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            getRow('Subtotal', '\$118.00'),
                            getRow('Shipping', '\$5.00'),
                            getRow('Tax(2%)', '\$2.00'),
                            getRow('Total', '\$125.00',isTotal: true),
                          ],
                        ),
                      )),













                    ],
                  ),
                ),





                Container(
                  margin: EdgeInsets.only( top: getScreenPercentSize(context,0.5)),
                  child: getButtonWidget(context, 'Confirm', primaryColor, (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ThankYouDialog(context, (v) {
                            setState(() {

                            });
                          });
                        });
                  }),
                )
              ],
            ),
          ),
        ));
  }
  
  getRow(String s,String s1, {bool? isTotal}){
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: leftMargin),
      child: Column(
        children: [
          Row(
            children: [

              Expanded(child: getTextWidget(s, textColor, getScreenPercentSize(context, 1.7),
                  FontWeight.w400, TextAlign.start)),

              Visibility(
                visible: (isTotal==null),
                child: getTextWidget(s1, textColor, getScreenPercentSize(context, 1.7),
                    FontWeight.bold, TextAlign.start),
              ),

              Visibility(
                visible: (isTotal!=null),
                child: getTextWidget(s1, primaryColor, getScreenPercentSize(context, 2.3),
                    FontWeight.bold
                    , TextAlign.start),
              ),

            ],
          ),

          Visibility(
            visible: (isTotal==null),
            child: Container(height: 1,color: borderColor,margin: EdgeInsets.symmetric(vertical:
            getScreenPercentSize(context,1.5)),),
          )
        ],
      ),
    );
  }

  bool isSaveCard=true;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  addNewCardDialog() {
    double height = getScreenPercentSize(context, 45);
    double radius = getScreenPercentSize(context, 3);
    double margin = getScreenPercentSize(context, 2);

    double  cellHeight = getScreenPercentSize(context, 6.5);
    double  fontSize = getPercentSize(cellHeight, 29);
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
                heightFactor: 0.53,
                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: margin),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(                        height: getPercentSize(height, 6),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: getTextWithFontFamilyWidget(
                                'Credit Card',
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
                        height: getPercentSize(height, 3),
                      ),



                      getDefaultTextFiledWithoutIconWidget(
                          context, S.of(context).cardNumber, cardNumberController),
                      getDefaultTextFiledWithoutIconWidget(
                          context, S.of(context).cardHolderName, cardHolderNameController),
                      Row(
                        children: [
                          Expanded(flex: 1,child:  getDefaultTextFiledWithoutIconWidget(
                              context, S.of(context).expDateHint, expDateController),),
                          SizedBox(width: getScreenPercentSize(context, 1),),
                          Expanded(flex: 1,child:  getDefaultTextFiledWithoutIconWidget(
                              context, S.of(context).cvvHint, cvvController),)
                        ],
                      ),
                      SizedBox(
                        height: getPercentSize(height, 3),
                      ),


                      InkWell(
                        onTap: () {
                          setState(() {
                            if(isSaveCard){
                              isSaveCard=false;
                            }else{
                              isSaveCard=true;
                            }
                          });
                        },
                        child: Container(

                          margin: EdgeInsets.only(
                              bottom: getScreenPercentSize(context, 1.2)),

                          alignment: Alignment.centerLeft,

                          child: Row(
                            children: [

                              Container(
                                height: getPercentSize(cellHeight, 45),
                                width: getPercentSize(cellHeight, 45),

                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor.withOpacity(0.4),width: 1),
                                    color: (isSaveCard) ? primaryColor : Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(getPercentSize(cellHeight, 12)))
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    size: getPercentSize(cellHeight, 35),
                                    color:
                                    (isSaveCard) ? Colors.white : Colors.transparent,
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: fontSize,
                              ),
                              getCustomTextWidget('Save Card', textColor, fontSize,
                                  FontWeight.w400, TextAlign.start, 1)
                            ],
                          ),
                        ),
                      )
,

                      Container(
                        margin: EdgeInsets.only(top: getScreenPercentSize(context,0.5)),
                        child: getButtonWidget(context, 'Add', primaryColor, (){
                          Navigator.of(context).pop();
                        }),
                      )


                    ],
                  ),
                ),
              );
            },
          );
        });
  }


}

import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/ConfirmationPage.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'customView/ReviewSlider.dart';
import 'generated/l10n.dart';
import 'model/AddressModel.dart';
import 'model/PaymentCardModel.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});




  @override
  _CheckOutPage createState() {
    return _CheckOutPage();
  }
}

class _CheckOutPage extends State<CheckOutPage> {
  List<AddressModel> addressList = DataFile.getAddressList();

  int currentStep = 0;
  int _selectedCard = 0;
  List<PaymentCardModel> paymentModelList = DataFile.getPaymentCardList();

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = getHorizontalSpace(context);

    double cellHeight = MediaQuery.of(context).size.width * 0.2;


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
                    children: [



                      Container(
                        padding: EdgeInsets.only(left: leftMargin,right: leftMargin),
                        child: Column(
                          children: [


                            SizedBox(
                              height:
                              getScreenPercentSize(context, 3),
                            ),





                            ListView.builder(
                                shrinkWrap: true,

                                physics: NeverScrollableScrollPhysics(),
                                itemCount: paymentModelList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    child: getMaterialCell(context,widget: Container(
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
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                assetsPath+  paymentModelList[index].image!,
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        getCustomTextWithoutAlignWithFontFamily(
                                                            paymentModelList[index]
                                                                .name!,
                                                            textColor,
                                                            FontWeight.w500,
                                                            getScreenPercentSize(context, 2.3)),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              top: getScreenPercentSize(
                                                                  context, 0.5)),
                                                          child:
                                                          getCustomTextWithoutAlign(
                                                              paymentModelList[
                                                              index]
                                                                  .desc!,
                                                              textColor,
                                                              FontWeight.w400,

                                                              getScreenPercentSize(context, 2)),
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ),

                                              Align(
                                                alignment:
                                                Alignment.centerRight,
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      right: 3),
                                                  child: Icon(
                                                    (index ==
                                                        _selectedCard)
                                                        ? Icons
                                                        .radio_button_checked
                                                        : Icons
                                                        .radio_button_unchecked,
                                                    color: (index ==
                                                        _selectedCard)
                                                        ? primaryColor
                                                        : subTextColor,
                                                    size: getPercentSize(cellHeight,
                                                        30),
                                                  ),
                                                ),
                                              )

                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                    onTap: () {
                                      _selectedCard = index;
                                      setState(() {});
                                    },
                                  );
                                })
,
                            Container(
                              margin: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,0.5)),
                              child: getAddButtonWidget(context, 'Add New Card', primaryColor, (){
                                addNewCardDialog();
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => AddNewCardPage(),));
                              }),
                            )
                          ],
                        ),
                      ),



                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top: getScreenPercentSize(context,0.5)),
                  child: getButtonWidget(context, 'Next', primaryColor, (){
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return ThankYouDialog(context, (v) {
                    //         setState(() {
                    //
                    //         });
                    //       });
                    //     });
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ConfirmationPage(),));

                  }),
                )
              ],
            ),
          ),
        ));
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

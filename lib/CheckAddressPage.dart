import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/CheckOutPage.dart';
import 'package:flutter_pet_shop/EditAddressPage.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'AddNewAddressPage.dart';
import 'customView/ReviewSlider.dart';
import 'model/AddressModel.dart';
import 'model/PaymentCardModel.dart';

class CheckAddressPage extends StatefulWidget {
  const CheckAddressPage({super.key});




  @override
  _CheckAddressPage createState() {
    return _CheckAddressPage();
  }
}

class _CheckAddressPage extends State<CheckAddressPage> {
  List<AddressModel> addressList = DataFile.getAddressList();

  int currentStep = 0;
  int _selectedAddress = 0;
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
    double topMargin = getScreenPercentSize(context, 1);

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

          // bottomNavigationBar: getBottomText(
          //     context, 'Continue', () {
          //
          //   //
          //   showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return ThankYouDialog(context, (v) {
          //           setState(() {
          //
          //           });
          //         });
          //       });
          //
          //
          // }),



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
                    initialValue: 0,
                    circleDiameter: getScreenPercentSize(context, 5.5),
                    isCash: false,
                    width: double.infinity,
                    options: getOption()),

                // Expanded(flex: 1,
                //   child: ListView(
                //     children: [
                //
                //
                //
                //       Container(
                //         padding: EdgeInsets.only(left: leftMargin,right: leftMargin),
                //         child: Column(
                //           children: [
                //             Container(
                //               child: Row(
                //                 children: [
                //
                //
                //                   getTextWidget(
                //                       S.of(context).addressTitle,
                //
                //                       textColor,
                //                     getScreenPercentSize(
                //                         context, 2.5)
                //                      ,
                //
                //                       FontWeight.w800,
                //                     TextAlign.start,
                //                       ),
                //
                //
                //
                //
                //                   new Spacer(),
                //                   InkWell(
                //
                //                     child:       getUnderlineText(S.of(context).newAddress,
                //                         Colors.lightGreen,
                //                         1,
                //                         TextAlign.start, FontWeight.bold, getScreenPercentSize(
                //                             context, 2)),
                //
                //
                //
                //                     onTap: () {
                //                       Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) =>
                //                                   AddNewAddressPage()));
                //                     },
                //                   )
                //                 ],
                //               ),
                //             ),
                //
                //
                //             SizedBox(
                //               height:
                //               getScreenPercentSize(context, 3),
                //             ),
                //
                //             Container(
                //
                //               child: ListView.builder(
                //                   shrinkWrap: true,
                //                   physics: NeverScrollableScrollPhysics(),
                //                   itemCount: addressList.length,
                //                   itemBuilder: (context, index) {
                //                     return InkWell(
                //                       child:  Container(
                //
                //                         margin: EdgeInsets.only(bottom:getWidthPercentSize(
                //                             context,3) ),
                //                         padding: EdgeInsets.all(getPercentSize(
                //                             cellHeight,10 )),
                //
                //                         decoration: getDecoration(getPercentSize(
                //                             cellHeight,10 )),
                //
                //                         height:
                //                         cellHeight,
                //
                //                         child: Column(
                //                           mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                           crossAxisAlignment:
                //                           CrossAxisAlignment.center,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Expanded(
                //                                   child: Row(
                //                                     mainAxisAlignment:
                //                                     MainAxisAlignment.start,
                //                                     crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                     children: [
                //                                       Column(
                //                                         mainAxisAlignment:
                //                                         MainAxisAlignment
                //                                             .start,
                //                                         crossAxisAlignment:
                //                                         CrossAxisAlignment
                //                                             .start,
                //                                         children: [
                //
                //                                           getCustomTextWithoutAlign(addressList[index].name!,
                //                                               textColor, FontWeight.w500, getPercentSize(cellHeight,
                //                                                   20)),
                //
                //                                           Padding(
                //                                             padding:
                //                                             EdgeInsets.only(
                //                                                 top: (topMargin/2)),
                //
                //                                             child:getCustomTextWithoutAlign(addressList[index].location!,
                //                                                 subTextColor, FontWeight.w500, getPercentSize(cellHeight,
                //                                                     15)),
                //
                //                                           )
                //                                         ],
                //                                       ),
                //                                       new Spacer(),
                //                                       Align(
                //                                         alignment:
                //                                         Alignment.centerRight,
                //                                         child: Padding(
                //                                           padding:
                //                                           EdgeInsets.only(
                //                                               right: 3),
                //                                           child: Icon(
                //                                             (index ==
                //                                                 _selectedAddress)
                //                                                 ? Icons
                //                                                 .radio_button_checked
                //                                                 : Icons
                //                                                 .radio_button_unchecked,
                //                                             color: (index ==
                //                                                 _selectedAddress)
                //                                                 ? primaryColor
                //                                                 : subTextColor,
                //                                             size: getPercentSize(cellHeight,
                //                                                 30),
                //                                           ),
                //                                         ),
                //                                       )
                //                                     ],
                //                                   ),
                //                                   flex: 1,
                //                                 )
                //                               ],
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       onTap: () {
                //                         _selectedAddress = index;
                //                         setState(() {});
                //                       },
                //                     );
                //                   }),
                //             ),
                //
                //
                //             SizedBox(
                //               height:
                //               getScreenPercentSize(context, 3),
                //             ),
                //
                //             Container(
                //               child: Row(
                //                 children: [
                //
                //
                //                   getTextWidget(
                //                       S.of(context).paymentMethods,
                //                       textColor,
                //                     getScreenPercentSize(
                //                         context, 2.5),
                //                       FontWeight.w800, TextAlign.start,
                //
                //                     ),
                //
                //
                //
                //
                //                   new Spacer(),
                //                   InkWell(
                //
                //                     child:       getUnderlineText(S.of(context).newCard,
                //                         Colors.lightGreen,
                //                         1,
                //                         TextAlign.start, FontWeight.bold, getScreenPercentSize(
                //                             context, 2)),
                //
                //
                //
                //                     onTap: () {
                //                       Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) =>
                //                                   AddNewCardPage()));
                //                     },
                //                   )
                //                 ],
                //               ),
                //             ),
                //
                //
                //             SizedBox(
                //               height:
                //               getScreenPercentSize(context, 3),
                //             ),
                //
                //
                //
                //             ListView.builder(
                //                 shrinkWrap: true,
                //                 physics: NeverScrollableScrollPhysics(),
                //                 itemCount: paymentModelList.length,
                //                 itemBuilder: (context, index) {
                //                   return InkWell(
                //                     child: Container(
                //                       margin: EdgeInsets.only(
                //                           bottom: getWidthPercentSize(
                //                               context, 3.5)),
                //                       padding: EdgeInsets.all(
                //                           getScreenPercentSize(
                //                               context, 2)),
                //                       decoration: getDecoration(getScreenPercentSize(context,1.5 )),
                //
                //
                //
                //
                //                       child: Column(
                //                         mainAxisAlignment: MainAxisAlignment.center,
                //                         crossAxisAlignment: CrossAxisAlignment.center,
                //                         children: [
                //                           Row(
                //                             children: [
                //                               Image.asset(
                //                                assetsPath+ paymentModelList[index].image!,
                //                                 height:
                //                                 getScreenPercentSize(
                //                                     context, 4),
                //                               ),
                //                               SizedBox(
                //                                 width:
                //                                 getScreenPercentSize(
                //                                     context, 2),
                //                               ),
                //                               Expanded(
                //                                 child: Row(
                //                                   mainAxisAlignment:
                //                                   MainAxisAlignment.start,
                //                                   crossAxisAlignment:
                //                                   CrossAxisAlignment.center,
                //                                   children: [
                //                                     Column(
                //                                       mainAxisAlignment:
                //                                       MainAxisAlignment.start,
                //                                       crossAxisAlignment:
                //                                       CrossAxisAlignment.start,
                //                                       children: [
                //                                         getCustomTextWithoutAlign(
                //                                             paymentModelList[index]
                //                                                 .name!,
                //
                //                                                 textColor,
                //                                             FontWeight.w500,
                //                                             getScreenPercentSize(context, 2.3)),
                //                                         Padding(
                //                                           padding: EdgeInsets.only(
                //                                               top: getScreenPercentSize(
                //                                                   context, 0.5)),
                //                                           child: getCustomTextWithoutAlign(
                //                                               paymentModelList[index].desc!,
                //                                               subTextColor,
                //                                               FontWeight.w500,
                //                                               getScreenPercentSize(context, 1.8)),
                //                                         )
                //                                       ],
                //                                     ),
                //                                     new Spacer(),
                //                                     Align(
                //                                       alignment:
                //                                       Alignment.centerRight,
                //                                       child: Padding(
                //                                         padding:
                //                                         EdgeInsets.only(
                //                                             right: 3),
                //                                         child: Icon(
                //                                           (index ==
                //                                               _selectedCard)
                //                                               ? Icons
                //                                               .radio_button_checked
                //                                               : Icons
                //                                               .radio_button_unchecked,
                //                                           color: (index ==
                //                                               _selectedCard)
                //                                               ? primaryColor
                //                                               : subTextColor,
                //                                           size: getPercentSize(cellHeight,
                //                                               30),
                //                                         ),
                //                                       ),
                //                                     )
                //                                   ],
                //                                 ),
                //                                 flex: 1,
                //                               )
                //                             ],
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     onTap: () {
                //                       // _selectedAddress = index;
                //                       // setState(() {});
                //                     },
                //                   );
                //                 }),
                //           ],
                //         ),
                //       ),
                //
                //
                //
                //     ],
                //   ),
                // ),

                // Padding(
                //   padding:  EdgeInsets.symmetric(horizontal: leftMargin),
                //   child: getTextWithFontFamilyWidget("Your Addresses", textColor, getScreenPercentSize(context, 2),
                //       FontWeight.w500, TextAlign.center),
                // ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: (leftMargin)),
                    padding: EdgeInsets.only(left: leftMargin,right: leftMargin),



                    child: Container(

                      child: ListView(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: addressList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child:  getMaterialCell(context,widget: Container(

                                    margin: EdgeInsets.only(bottom:getWidthPercentSize(
                                        context,3) ),
                                    padding: EdgeInsets.all(getPercentSize(
                                        cellHeight,10 )),
                                    // decoration: getDecoration(getPercentSize(cellHeight,10 )),
                                    decoration: getDecorationWithRadius(getPercentSize(cellHeight,10 ),primaryColor),

                                    height:
                                    cellHeight,

                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Expanded(flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [

                                                    Row(
                                                      children: [

                                                        Icon(
                                                          (index ==
                                                              _selectedAddress)
                                                              ? Icons
                                                              .radio_button_checked
                                                              : Icons
                                                              .radio_button_unchecked,
                                                          color: (index ==
                                                              _selectedAddress)
                                                              ? primaryColor
                                                              : subTextColor,
                                                          size: getPercentSize(cellHeight,
                                                              25),
                                                        ),

                                                        SizedBox(width: getWidthPercentSize(context,2),),
                                                        Expanded(
                                                          flex: 1,
                                                          child: getCustomTextWithoutAlignWithFontFamily(
                                                              addressList[index].name!,
                                                              textColor, FontWeight.w500, getPercentSize(cellHeight, 20)),),


                                                      ],
                                                    ),

                                                    Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          top: (topMargin/2),left:(getWidthPercentSize(context,2)+getPercentSize(cellHeight,
                                                          25)) ),

                                                      child:getCustomTextWidget(addressList[index].location!,
                                                          textColor, getPercentSize(cellHeight,
                                                              15),FontWeight.w400,TextAlign.start,2),

                                                    )
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
                                                  child: InkWell(
                                                    onTap: (){
                                                      Navigator.push(context,MaterialPageRoute(builder:
                                                          (context) => EditAddressPage(),));

                                                    },
                                                    child: Image.asset(
                                                      '${assetsPath}edit.png',
                                                      height: getPercentSize(cellHeight,
                                                          20),
                                                      // (index ==
                                                      //     _selectedAddress)
                                                      //     ? Icons
                                                      //     .radio_button_checked
                                                      //     : Icons
                                                      //     .radio_button_unchecked,
                                                      // color: (index ==
                                                      //     _selectedAddress)
                                                      //     ? primaryColor
                                                      //     : subTextColor,
                                                      // size: getPercentSize(cellHeight,
                                                      //     25),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                  onTap: () {
                                    _selectedAddress = index;
                                    setState(() {});
                                  },
                                );
                              }),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,0.5)),
                            child: getAddButtonWidget(context, 'Add New Address', primaryColor, (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => AddNewAddressPage(),));
                            }),
                          )
                        ],
                      ),
                    ),
                  ),),

                Container(
                  margin: EdgeInsets.only(top: getScreenPercentSize(context,0.5)),
                  child: getButtonWidget(context, 'Next', primaryColor, (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => CheckOutPage(),));
                  }),
                )
              ],
            ),
          ),
        ));
  }
}

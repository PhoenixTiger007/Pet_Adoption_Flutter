import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'AddNewCardPage.dart';
import 'generated/l10n.dart';
import 'model/CardModel.dart';
import 'model/PaymentCardModel.dart';

class MySavedCardsPage extends StatefulWidget {
  const MySavedCardsPage({super.key});

  @override
  _MySavedCardsPage createState() {
    return _MySavedCardsPage();
  }
}

class _MySavedCardsPage extends State<MySavedCardsPage> {
  List<CardModel> cardList = DataFile.getCardList();
  List<PaymentCardModel> paymentModelList = DataFile.getPaymentCardList();



  @override
  void initState() {
    super.initState();
    cardList = DataFile.getCardList();
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            centerTitle: true,
            backgroundColor: backgroundColor,

            title: getAppBarText(context,S.of(context).mySavedCards),

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
                  bottom: MediaQuery.of(context).size.width * 0.01),
              child: Column(
                children: [

                  getAppBar(context, 'My Saved Cards',isBack: true,function: (){
_requestPop();
                  }),
                  SizedBox(height: getScreenPercentSize(context, 2),),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: getHorizontalSpace(context)),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: paymentModelList.length,
                        itemBuilder: (context, index) {
                          return getMaterialCell(context,widget: InkWell(
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: getScreenPercentSize(
                                      context, 2)),
                              padding: EdgeInsets.all(
                                  getScreenPercentSize(
                                      context, 2)),

                              decoration: getDecorationWithRadius(


                                  getScreenPercentSize(
                                      context, 1.5),primaryColor),


                              // decoration: BoxDecoration(
                              //     color: backgroundColor,
                              //     borderRadius: BorderRadius.circular(
                              //         getScreenPercentSize(
                              //             context, 1.5)),
                              //     border: Border.all(
                              //         color: subTextColor,
                              //         width: getWidthPercentSize(
                              //             context, 0.08)),
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.shade200,
                              //       )
                              //     ]),
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
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              // _selectedAddress = index;
                              // setState(() {});
                            },
                          ));
                        }),
                  ),
//
//                   getBottomText(context, S.of(context).newCard,
//                       () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AddNewCardPage(),
//                         ));
//                   })
// ,

                  Container(
                    margin: EdgeInsets.only(top: getScreenPercentSize(context,0.5)),
                    child: getButtonWidget(context, 'Add New Card', primaryColor, (){


                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewCardPage(),
                        ));

                    }),
                  )

                ],
              ),
            ),
          ),
        ));
  }
}

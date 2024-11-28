import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'generated/l10n.dart';


class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  _AddNewCardPage createState() {
    return _AddNewCardPage();
  }
}

class _AddNewCardPage extends State<AddNewCardPage> {


  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();


    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = getHorizontalSpace(context);


    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 0,
            backgroundColor: backgroundColor,
            title: getAppBarText(context,'New Card'),

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
          //     context, S.of(context).savedCards, () {
          //   Navigator.of(context).pop(true);
          //
          // }),

          body: Container(
            // margin: EdgeInsets.only(
            //    top: leftMargin),
            child: Column(
              children: [

                getAppBar(context,'Add New Card',isBack: true,function: (){
                  _requestPop();
                }),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [



                      Container(
                        padding: EdgeInsets.all(leftMargin),


                        child: Column(
                          children: [







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



                          ],
                        ),
                      )
                      ,









                    ],
                  ),
                ),



                Container(
                  margin: EdgeInsets.only(top: getScreenPercentSize(context,0.5)),
                  child: getButtonWidget(context, 'Save', primaryColor, (){
                    Navigator.of(context).pop();
                  }),
                )

              ],
            ),
          ),
        ));
  }


}

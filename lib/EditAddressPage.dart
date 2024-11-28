import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'generated/l10n.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

  @override
  _EditAddressPage createState() {
    return _EditAddressPage();
  }
}

class _EditAddressPage extends State<EditAddressPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addController = TextEditingController();

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;

    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            centerTitle: true,
            backgroundColor: backgroundColor,
            title: getAppBarText(context, S.of(context).address),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: getAppBarIcon(),
                  onPressed: _requestPop,
                );
              },
            ),
          ),
          // bottomNavigationBar: getBottomText(context, S.of(context).save, () {
          //   Navigator.of(context).pop(true);
          // }),
          body: Container(
            child: Column(
              children: [
                getAppBar(context, 'Edit Address', isBack: true,
                    function: () {
                  _requestPop();
                }),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(leftMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getDefaultTextFiledWithoutIconWidget(context,
                                S.of(context).yourName, nameController),
                            getDefaultTextFiledWithoutIconWidget(
                                context,
                                S.of(context).phoneNumber,
                                phoneNumberController),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: getDefaultTextFiledWithoutIconWidget(
                                      context,
                                      S.of(context).cityDistrict,
                                      cityController),
                                ),
                                SizedBox(
                                  width: getScreenPercentSize(context, 1),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: getDefaultTextFiledWithoutIconWidget(
                                      context,
                                      S.of(context).zip,
                                      zipController),
                                )
                              ],
                            ),
                            getPrescriptionDesc(
                                context, S.of(context).address, addController),

                            Padding(
                              padding:  EdgeInsets.only(top: getScreenPercentSize(context, 2)),
                              child: getTextWithFontFamilyWidget(
                                  'Type Address',
                                  textColor,
                                  getScreenPercentSize(context, 1.7),
                                  FontWeight.w500,
                                  TextAlign.start),
                            ),
                            Row(
                              children: [
                                getRadioButton(context, 'Home', 0),
                                SizedBox(
                                  width: (getWidthPercentSize(context, 2)),
                                ),
                                getRadioButton(context, 'Office', 1),
                              ],
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       top: topMargin, bottom: topMargin),
                            //   child: _radioView(S.of(context).houseApartment,
                            //       (_selectedRadio == 0), 0),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       top: topMargin, bottom: topMargin),
                            //   child: _radioView(S.of(context).agencyCompany,
                            //       (_selectedRadio == 1), 1),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  child: Container(
                    margin: EdgeInsets.only(

                        top: getScreenPercentSize(context, 0.5)),
                    child: getButtonWidget(context, 'Save', primaryColor, () {
                      Navigator.of(context).pop();
                    }),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  int radioPosition = 0;

  Widget getRadioButton(BuildContext context, String s, int position) {
    double cellHeight = getScreenPercentSize(context, 7);
    double fontSize = getPercentSize(cellHeight, 27);

    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          setState(() {
            radioPosition = position;
          });
        },
        child: Container(
          height: cellHeight,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              vertical: getScreenPercentSize(context, 1.2)),
          padding:
              EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 2)),
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
            color: cellColor,
            shape: SmoothRectangleBorder(
              side:
                  BorderSide(color: primaryColor.withOpacity(0.5), width: 0.3),
              borderRadius: SmoothBorderRadius(
                cornerRadius: getPercentSize(cellHeight, 20),
                cornerSmoothing: 0.8,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                (radioPosition == position)
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                size: (fontSize * 1.8),
                color:
                    (radioPosition == position) ? primaryColor : subTextColor,
              ),
              SizedBox(
                width: fontSize,
              ),
              Expanded(
                  child: getCustomTextWidget(s, textColor, fontSize,
                      FontWeight.w500, TextAlign.start, 1))
            ],
          ),
        ),
      ),
    );
  }

}

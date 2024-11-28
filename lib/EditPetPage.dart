
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/PrefData.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

class EditPetPage extends StatefulWidget {
  const EditPetPage({super.key});

  @override
  _EditPetPage createState() {
    return _EditPetPage();
  }
}

class _EditPetPage extends State<EditPetPage> {
  List<ProductModel> productList = DataFile.getProductModel();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textWeightController = TextEditingController();
  TextEditingController textDescController = TextEditingController();

  double cellHeight = 0;

  _EditPetPage();

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   textEditingController.text = "Mack";
    //   textDescController.text = loremText;
    //   textWeightController.text = "3.5 Kg";
    // });
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  void doNothing(BuildContext context) {}

  double defMargin = 0;
  double fontSize = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double margin = getWidthPercentSize(context, 2.5);
    double height = getScreenPercentSize(context, 17);
    cellHeight = getScreenPercentSize(context, 6.5);

    defMargin= getHorizontalSpace(context);
     fontSize = getPercentSize(cellHeight, 28);


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
                getAppBar(context, 'Edit New Pet', isBack: true, function: () {
                  _requestPop();
                }),
                SizedBox(
                  height: getScreenPercentSize(context, 1.5),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    shrinkWrap: true,
                    primary: true,
                    padding: EdgeInsets.symmetric(horizontal: defMargin),
                    children: [
                      SizedBox(
                        height: margin,
                      ),
                      getTextWithFontFamilyWidget(
                          'Add your new furry friends',
                          textColor,
                          getScreenPercentSize(context, 1.7),
                          FontWeight.w500,
                          TextAlign.start),
                      SizedBox(
                        height: margin,
                      ),


                      SizedBox(
                        height: height,


                        child: Stack(
                          children: [
                            Image.asset(
                              '${assetsPath}new_pet.png',
                              height: height,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: getPercentSize(height, 15),
                                width: getPercentSize(height, 15),
                                margin: EdgeInsets.all(
                                    getScreenPercentSize(context, 1.5)),
                                padding:
                                EdgeInsets.all(getPercentSize(height, 3)),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black38),
                                child: Center(
                                  child: Image.asset(
                                    '${assetsPath}edit.png',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),



                      SizedBox(
                        height: margin,
                      ),

                      getTextFiledWidget(context, 'Pet Name', textEditingController),
                      getDropDownWidget(context),
                      getDropDownWidget1(context),
                      getCalendar(),
                      Row(
                        children: [
                          getRadioButton(context, 'Male', 0),
                          SizedBox(
                            width: (margin),
                          ),
                          getRadioButton(context, 'Female', 1),
                        ],
                      ),
                      getTextFiledWidget(context, 'Weight', textWeightController),
                      getDescTextFiledWidget(context, 'Description', textDescController),
                    ],
                  ),
                ),
                getButtonWidget(context, 'Save', primaryColor, () {
                  PrefData.setIsPet(true);
                  _requestPop();
                }),
                SizedBox(
                  height: margin,
                )
              ],
            ),
          ),
        ));
  }

  getShapeDecoration() {
    double radius = getPercentSize(cellHeight, 20);

    return ShapeDecoration(
      color: cellColor,
      shape: SmoothRectangleBorder(
        side: BorderSide(color: primaryColor.withOpacity(0.5), width: 0.3),
        borderRadius: SmoothBorderRadius(
          cornerRadius: radius,
          cornerSmoothing: 0.8,
        ),
      ),
    );
  }

  Widget getDescTextFiledWidget(BuildContext context, String s,
      TextEditingController textEditingController) {
    

    return Container(
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      padding:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      alignment: Alignment.centerLeft,
      decoration: getShapeDecoration(),
      child: TextField(
        maxLines: 4,
        controller: textEditingController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            height: 1.3,
            fontWeight: FontWeight.w500,
            fontSize: fontSize),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getWidthPercentSize(context, 2)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: s,
            suffixIcon: Icon(
              Icons.add,
              color: Colors.transparent,
              size: getPercentSize(cellHeight, 40),
            ),
            isDense: true,
            hintStyle: TextStyle(
                fontFamily: fontFamily,
                color: subTextColor,
                fontWeight: FontWeight.w400,
                fontSize: fontSize)),
      ),
    );
  }

  String dropdownValue = 'Dog';
  String dropdownValue1 = 'Breed';
  int radioPosition = 0;

  Widget getCalendar() {
    

    return InkWell(
      onTap: () {},
      child: Container(
        height: cellHeight,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            vertical: getScreenPercentSize(context, 1.2)),
        padding:
            EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 2)),
        alignment: Alignment.centerLeft,
        decoration: getShapeDecoration(),
        child: Row(
          children: [
            Expanded(
                child: getTextWidget('Sep 2,2022', textColor, fontSize,
                    FontWeight.w500, TextAlign.start)),
            SizedBox(
              width: fontSize,
            ),
            Image.asset(
              '${assetsPath}calender.png',
              height: (fontSize * 1.3),
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget getRadioButton(BuildContext context, String s, int position) {
    

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
          decoration: getShapeDecoration(),
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

  Widget getDropDownWidget1(
    BuildContext context,
  ) {
    

    return Container(
      height: cellHeight,
      width: double.infinity,
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      padding:
          EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 2)),
      alignment: Alignment.centerLeft,
      decoration: getShapeDecoration(),
      child: DropdownButton<String>(
        value: dropdownValue1,
        isDense: true,
        isExpanded: true,
        icon: Image.asset('${assetsPath}down-arrow.png',color: textColor,height: fontSize,),
        // icon: Icon(
        //   Icons.keyboard_arrow_down,
        //   color: textColor,
        // ),
        elevation: 16,
        style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: fontSize),
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue1 = newValue!;
          });
        },
        items: <String>['Breed', 'Cat', 'Parrot']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: TextStyle(
                    fontFamily: fontFamily,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize)),
          );
        }).toList(),
      ),
    );
  }

  Widget getDropDownWidget(
    BuildContext context,
  ) {
    

    return Container(
      height: cellHeight,
      width: double.infinity,
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      padding:
          EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 2)),
      alignment: Alignment.centerLeft,
      decoration: getShapeDecoration(),
      child: DropdownButton<String>(
        value: dropdownValue,
        isDense: true,
        isExpanded: true,
        icon: Image.asset('${assetsPath}down-arrow.png',color: textColor,height: fontSize,),

        elevation: 16,
        style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: fontSize),
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Dog', 'Cat', 'Parrot']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: TextStyle(
                    fontFamily: fontFamily,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize)),
          );
        }).toList(),
      ),
    );
  }

  Widget getTextFiledWidget(BuildContext context, String s,
      TextEditingController textEditingController) {
    

    return Container(
      height: cellHeight,
      margin:
          EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
      alignment: Alignment.centerLeft,
      decoration: getShapeDecoration(),
      child: TextField(
        maxLines: 1,
        controller: textEditingController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: fontSize),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getWidthPercentSize(context, 2)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: s,
            suffixIcon: Icon(
              Icons.add,
              color: Colors.transparent,
              size: getPercentSize(cellHeight, 40),
            ),
            isDense: true,
            hintStyle: TextStyle(
                fontFamily: fontFamily,
                color: subTextColor,
                fontWeight: FontWeight.w400,
                fontSize: fontSize)),
      ),
    );
  }
}

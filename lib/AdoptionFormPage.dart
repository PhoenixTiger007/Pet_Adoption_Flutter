import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/MainPage.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';
import 'package:flutter_pet_shop/utils/SubmitDialog.dart';

class AdoptionFormPage extends StatefulWidget {
  final ProductModel model;

  const AdoptionFormPage(this.model, {super.key});

  @override
  _AdoptionFormPage createState() {
    return _AdoptionFormPage();
  }
}

class _AdoptionFormPage extends State<AdoptionFormPage> {
  List<ProductModel> productList = DataFile.getProductModel();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textWeightController = TextEditingController();
  TextEditingController textDescController = TextEditingController();

  double cellHeight = 0;

  _AdoptionFormPage();

  @override
  void initState() {
    super.initState();
    setState(() {
      textEditingController.text = 'Mack';
      textDescController.text = '';
      textWeightController.text = '3.5 Kg';
    });
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  void doNothing(BuildContext context) {}

  double defMargin = 0;
  double fontSize = 0;
  double radius = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    defMargin= getHorizontalSpace(context);

    double margin = getWidthPercentSize(context, 2.5);
    double height = getScreenPercentSize(context, 12);
    cellHeight = getScreenPercentSize(context, 6.5);

    fontSize = getPercentSize(cellHeight, 28);
    radius = getPercentSize(cellHeight, 20);

    double imageSize = getPercentSize(height, 90);

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
                getAppBar(context, 'Adoption Form', isBack: true, function: () {
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
                          'Fill these form for adoption...',
                          textColor,
                          getScreenPercentSize(context, 1.7),
                          FontWeight.w500,
                          TextAlign.start),
                      SizedBox(
                        height: margin,
                      ),
                      getMaterialCell(context,widget: Container(
                        height: height,
                        // decoration: getDecoration(radius),

                        decoration: ShapeDecoration(
                          color: backgroundColor,


                          shape: SmoothRectangleBorder(

                            borderRadius: SmoothBorderRadius(
                              cornerRadius: radius,
                              cornerSmoothing: 0.8,
                            ),
                          ),
                        ),

                        child: Row(
                          children: [
                            Container(
                              height: imageSize,
                              width: imageSize,
                              margin: EdgeInsets.only(
                                  right: margin,
                                  left: getPercentSize(height, 5)),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadiusDirectional.circular(
                                        radius)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  assetsPath + widget.model.image!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextWithFontFamilyWidget(
                                      widget.model.name!,
                                      textColor,
                                      getPercentSize(height, 18),
                                      FontWeight.w500,
                                      TextAlign.start,
                                      1),
                                  SizedBox(
                                    height: getPercentSize(height, 3),
                                  ),
                                  getCustomTextWidget(
                                      'Abusing Dog',
                                      textColor,
                                      getPercentSize(height, 14),
                                      FontWeight.w400,
                                      TextAlign.start,
                                      1),
                                  SizedBox(
                                    height: getPercentSize(height, 7),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            getWidthPercentSize(context, 2),
                                            vertical:
                                            getPercentSize(height, 4)),
                                        decoration: ShapeDecoration(
                                          color: alphaColor,
                                          shape: SmoothRectangleBorder(
                                            // side: BorderSide(color: iconColor, width: 0.1),
                                            borderRadius: SmoothBorderRadius(
                                              cornerRadius:
                                              getPercentSize(height, 5),
                                              cornerSmoothing: 0.8,
                                            ),
                                          ),
                                        ),
                                        child: getCustomTextWidget(
                                            '1.5 Years',
                                            primaryColor,
                                            getPercentSize(height, 14),
                                            FontWeight.w400,
                                            TextAlign.start,
                                            1),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal:
                                          getWidthPercentSize(context, 2),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            getWidthPercentSize(context, 2),
                                            vertical:
                                            getPercentSize(height, 4)),
                                        decoration: ShapeDecoration(
                                          color: alphaColor,
                                          shape: SmoothRectangleBorder(
                                            // side: BorderSide(color: iconColor, width: 0.1),
                                            borderRadius: SmoothBorderRadius(
                                              cornerRadius:
                                              getPercentSize(height, 5),
                                              cornerSmoothing: 0.8,
                                            ),
                                          ),
                                        ),
                                        child: getCustomTextWidget(
                                            'Female',
                                            primaryColor,
                                            getPercentSize(height, 14),
                                            FontWeight.w400,
                                            TextAlign.start,
                                            1),
                                      ),


                                      Container(

                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            getWidthPercentSize(context, 2),
                                            vertical:
                                            getPercentSize(height, 4)),
                                        decoration: ShapeDecoration(
                                          color: alphaColor,
                                          shape: SmoothRectangleBorder(
                                            // side: BorderSide(color: iconColor, width: 0.1),
                                            borderRadius: SmoothBorderRadius(
                                              cornerRadius:
                                              getPercentSize(height, 5),
                                              cornerSmoothing: 0.8,
                                            ),
                                          ),
                                        ),
                                        child: getCustomTextWidget(
                                            '3.5 kg',
                                            primaryColor,
                                            getPercentSize(height, 14),
                                            FontWeight.w400,
                                            TextAlign.start,
                                            1),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),

                      SizedBox(
                        height: (margin),
                      ),
                      getMaterialCell(context,widget: Container(
                        height: height,
                        margin: EdgeInsets.symmetric(vertical: margin),
                        // decoration: getDecoration(radius),
                        decoration: ShapeDecoration(
                                                  color: backgroundColor,


                                                  shape: SmoothRectangleBorder(

                                                    borderRadius: SmoothBorderRadius(
                                                      cornerRadius: radius,
                                                      cornerSmoothing: 0.8,
                                                    ),
                                                  ),
                                                ),
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getCustomTextWithFontFamilyWidget(
                                'Albert Flores',
                                textColor,
                                getPercentSize(height, 18),
                                FontWeight.w500,
                                TextAlign.start,
                                1),
                            SizedBox(
                              height: getPercentSize(height, 5),
                            ),
                            Row(
                              children: [
                                Image.asset('${assetsPath}ema3il.png',height: getPercentSize(height, 18),),
                                SizedBox(width: getWidthPercentSize(context, 1.5),),
                                Expanded(
                                  child: getCustomTextWidget(
                                      'nbghjc@gmail.com',
                                      textColor,
                                      getPercentSize(height, 15),
                                      FontWeight.w400,
                                      TextAlign.start,
                                      1),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getPercentSize(height, 8),
                            ),
                            Row(
                              children: [
                                Image.asset('${assetsPath}call.png',height: getPercentSize(height, 18),),
                                SizedBox(width: getWidthPercentSize(context, 1.5),),
                                Expanded(
                                  child: getCustomTextWidget(
                                      'Abusing Dog',
                                      textColor,
                                      getPercentSize(height, 15),
                                      FontWeight.w400,
                                      TextAlign.start,
                                      1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: (margin),
                      ),
                      getTextWithFontFamilyWidget(
                          'Living Address',
                          textColor,
                          getScreenPercentSize(context, 1.7),
                          FontWeight.w500,
                          TextAlign.start),


                      getDescTextFiledWidget(context, 'Enter Address..', textDescController),
                      SizedBox(
                        height: (margin),
                      ),

                      getTextWithFontFamilyWidget(
                          'Have you previously owned pets?',
                          textColor,
                          getScreenPercentSize(context, 1.7),
                          FontWeight.w500,
                          TextAlign.start),


                       Row(
                        children: [
                          getRadioButton(context, 'Yes', 0),
                          SizedBox(
                            width: getWidthPercentSize(context, 10),
                          ),
                          getRadioButton(context, 'No', 1),
                        ],
                      ),


                      getTextWithFontFamilyWidget(
                          'Why do you want to adopt?',
                          textColor,
                          getScreenPercentSize(context, 1.7),
                          FontWeight.w500,
                          TextAlign.start),


                      getDescTextFiledWidget(context, 'Describe your Reason..', textDescController),
                      SizedBox(
                        height: (margin),
                      ),

                    ],
                  ),
                ),
                getButtonWidget(context, 'Submit Message', primaryColor, () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SubmitDialog(

                          func: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));

                          },
                        );
                      });
                }),
                SizedBox(
                  height: margin,
                )
              ],
            ),
          ),
        ));
  }


  getTextFiledShapeDecoration({Color? color}) {
    return ShapeDecoration(
      color: cellColor,
      shape: SmoothRectangleBorder(
        side: BorderSide(color: (color==null)?borderColor:color, width: 1),
        borderRadius: SmoothBorderRadius(
          cornerRadius: radius,
          cornerSmoothing: 0.8,
        ),
      ),
    );
  }
  getShapeDecoration() {
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

    FocusNode myFocusNode=FocusNode();
    bool isAutoFocus=false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin:
              EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
          padding:
              EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
          alignment: Alignment.centerLeft,
          decoration: getTextFiledShapeDecoration(color: isAutoFocus?primaryColor:borderColor),
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
              maxLines: 4,
              focusNode: myFocusNode,
              autofocus: isAutoFocus,
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
                      EdgeInsets.only(left: getWidthPercentSize(context, 4)),
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
          ),
        );
      }
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
        margin:
            EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
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
    return InkWell(
      onTap: () {
        setState(() {
          radioPosition = position;
        });
      },
      child: Container(
        height: cellHeight,

        margin: EdgeInsets.only(
            bottom: getScreenPercentSize(context, 1.2)),
        // padding:
        //     EdgeInsets.symmetric(horizontal: getWidthPercentSize(context, 2)),
        alignment: Alignment.centerLeft,
        // decoration: getShapeDecoration(),
        child: Row(
          children: [

            Container(
              height: getPercentSize(cellHeight, 45),
              width: getPercentSize(cellHeight, 45),

              decoration: BoxDecoration(
                border: Border.all(color: primaryColor.withOpacity(0.4),width: 1),
                color: (radioPosition == position) ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(getPercentSize(cellHeight, 12)))
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  size: getPercentSize(cellHeight, 35),
                  color:
                  (radioPosition == position) ? Colors.white : Colors.transparent,
                ),
              ),
            ),

            SizedBox(
              width: fontSize,
            ),
            getCustomTextWidget(s, textColor, fontSize,
                FontWeight.w400, TextAlign.start, 1)
          ],
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
        icon: Image.asset(
          '${assetsPath}down-arrow.png',
          color: textColor,
          height: fontSize,
        ),
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
        icon: Image.asset(
          '${assetsPath}down-arrow.png',
          color: textColor,
          height: fontSize,
        ),
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
      decoration: getTextFiledShapeDecoration(),
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

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/PrefData.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'AddNewPetPage.dart';
import 'EditPetPage.dart';
import 'PetDetailPage.dart';

class MyPetPage extends StatefulWidget {
  final Function? function;

  const MyPetPage({super.key, this.function});

  @override
  _MyPetPage createState() {
    return _MyPetPage();
  }
}

class _MyPetPage extends State<MyPetPage> {
  List<ProductModel> list = DataFile.getProductModel();

  _MyPetPage();

  bool isData = false;

  @override
  void initState() {
    super.initState();
    isDataAvailable();
  }

  isDataAvailable() async {
    isData = await PrefData.getIsPet();
    setState(() {});
  }

  Future<bool> _requestPop() {
    if (widget.function != null) {
      widget.function!();
    } else {
      Navigator.of(context).pop();
    }

    return Future.value(true);
  }

  void doNothing(BuildContext context) {}

  double defMargin = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = getScreenPercentSize(context, 3);

    defMargin=getHorizontalSpace(context);
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
                getAppBar(context, 'My pets', isBack: true, function: () {
                  _requestPop();
                },
                    widget: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddNewPetPage(),
                            ));
                      },
                      child: getSubMaterialCell(context,widget: Container(

                        height: height,
                        width: height,
                        decoration: getDecorationWithColor(
                            getPercentSize(height, 25), primaryColor),
                        child: Center(
                          child: Icon(Icons.add,
                              color: Colors.white,
                              size: getPercentSize(height, 70)),
                        ),
                      ), ),
                    )),
                SizedBox(
                  height: getScreenPercentSize(context, 1.5),
                ),
                Expanded(child: isData ? sellerList() : emptyWidget())
              ],
            ),
          ),
        ));
  }

  emptyWidget() {
    double width = getWidthPercentSize(context, 45);
    double height = getScreenPercentSize(context, 7);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            '${assetsPath}drop.png',
            height: getScreenPercentSize(context, 20),
          ),
          SizedBox(
            height: getScreenPercentSize(context, 3),
          ),
          getCustomTextWithFontFamilyWidget(
              'No Pets Yet!',
              textColor,
              getScreenPercentSize(context, 2.5),
              FontWeight.w500,
              TextAlign.center,
              1),
          SizedBox(
            height: getScreenPercentSize(context, 1),
          ),
          getCustomTextWidget(
              'Explore more and shortlist some pets.',
              textColor,
              getScreenPercentSize(context, 2),
              FontWeight.w400,
              TextAlign.center,
              1),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewPetPage(),
                  )).then((value) => isDataAvailable());
            },
            child: Container(
                margin: EdgeInsets.only(top: getScreenPercentSize(context, 4)),
                width: width,
                height: height,
                decoration: ShapeDecoration(
                  color: backgroundColor,
                  shadows: [
                    BoxShadow(
                        color: primaryColor.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(0, 5))
                  ],
                  shape: SmoothRectangleBorder(
                    side: BorderSide(color: primaryColor, width: 1.5),
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: getPercentSize(height, 25),
                      cornerSmoothing: 0.8,
                    ),
                  ),
                ),
                child: Center(
                  child: getCustomTextWidget(
                      'Add New Pet',
                      primaryColor,
                      getPercentSize(width, 10),
                      FontWeight.w600,
                      TextAlign.center,
                      1),
                )),
          )
        ],
      ),
    );
  }

  sellerList() {


    double height = getScreenPercentSize(context, 11);
    // double margin = getScreenPercentSize(context, 2);

    double imageSize = getPercentSize(height, 100);
    double radius = getPercentSize(height, 15);

    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: defMargin),
      itemCount: (list.length > 3) ? 3 : list.length,
      itemBuilder: (context, index) {
        ProductModel subCategoryModel = list[index];

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PetDetailPage(subCategoryModel)));
          },
          child: getMaterialCell(context, widget: Container(
            decoration: getDecorationWithRadius(radius, primaryColor),
            margin: EdgeInsets.symmetric(vertical: getPercentSize(height, 10)),
            width: double.infinity,
            padding: EdgeInsets.all(
              getPercentSize(height, 6),
            ),
            // height: itemHeight,
            child: Row(
              children: [
                Container(
                  height: imageSize,
                  width: imageSize,
                  margin: EdgeInsets.only(right: (defMargin / 2)),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(radius)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      assetsPath + subCategoryModel.image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: getCustomTextWithFontFamilyWidget(
                                subCategoryModel.name!,
                                textColor,
                                getPercentSize(height, 18),
                                FontWeight.w500,
                                TextAlign.start,
                                1),
                          ),
                          getCustomTextWidget(
                              '25-02-2022',
                              subTextColor,
                              getPercentSize(height, 18),
                              FontWeight.w400,
                              TextAlign.start,
                              1)
                        ],
                      ),
                      SizedBox(
                        height: getPercentSize(height, 7),
                      ),
                      getCustomTextWidget(
                          subCategoryModel.subTitle!,
                          textColor,
                          getPercentSize(height, 18),
                          FontWeight.w400,
                          TextAlign.start,
                          1),
                      SizedBox(
                        height: getPercentSize(height, 9),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: getCustomTextWidget(
                                subCategoryModel.desc!,
                                primaryColor,
                                getPercentSize(height, 18),
                                FontWeight.w600,
                                TextAlign.start,
                                1),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPetPage(),
                                  ));
                            },
                            child: Container(
                              width: getPercentSize(height, 30),
                              height: getPercentSize(height, 30),
                              decoration: BoxDecoration(
                                  color: alphaColor, shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(
                                  '${assetsPath}edit.png',
                                  height: getPercentSize(height, 15),
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}

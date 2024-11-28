import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'MyPetPage.dart';
import 'PetDetailPage.dart';

class AllPetPage extends StatefulWidget {
  final Function? function;

  const AllPetPage({super.key, this.function});

  @override
  _AllPetPage createState() {
    return _AllPetPage();
  }
}

class _AllPetPage extends State<AllPetPage> {
  List<ProductModel> productList = DataFile.getAdoptModel();

  _AllPetPage();

  @override
  void initState() {
    super.initState();
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

    defMargin = getHorizontalSpace(context);
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
                getAppBar(context, 'All pets', isBack: true, function: () {
                  _requestPop();
                },widget: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPetPage(),
                        ));
                  },
                  child: getSubMaterialCell(context, widget: Container(

                    height: height,
                    width: height,
                    decoration: getDecorationWithColor(
                        getPercentSize(height, 25), primaryColor),
                    child: Center(
                      child: Icon(Icons.add,
                          color: Colors.white, size: getPercentSize(height, 70)),
                    ),
                  ),),
                )),
                SizedBox(
                  height: getScreenPercentSize(context, 1.5),
                ),
                Expanded(child: sellerList())
              ],
            ),
          ),
        ));
  }

  sellerList() {

    var height = getScreenPercentSize(context, 40);
    // var height = getScreenPercentSize(context, 35);

    double width = getWidthPercentSize(context, 40);
    double imgHeight = getPercentSize(height, 50);
    double remainHeight = height - imgHeight;

    double radius = getPercentSize(height, 5);

    double crossAxisSpacing = 0;
    var screenWidth = MediaQuery.of(context).size.width;
    var crossAxisCount = 2;
    var width0 = (screenWidth - ((crossAxisCount - 1) * crossAxisSpacing)) /
        crossAxisCount;

    var aspectRatio = width0 / height;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: (defMargin)),
      scrollDirection: Axis.vertical,
      primary: false,
      crossAxisSpacing: (defMargin),
      mainAxisSpacing: 0,
      childAspectRatio: aspectRatio,
      children: List.generate(productList.length, (index) {
        ProductModel model = productList[index];

        return InkWell(
          child: getMaterialCell(context,widget: Container(
            width: width,
            margin: EdgeInsets.symmetric(vertical: (defMargin/1.5)),
            decoration: ShapeDecoration(
              color: backgroundColor,


              shape: SmoothRectangleBorder(

                borderRadius: SmoothBorderRadius(
                  cornerRadius: radius,
                  cornerSmoothing: 0.8,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: imgHeight,
                  margin: EdgeInsets.only(top: getPercentSize(width, 6)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius),
                          child: Image.asset(
                            assetsPath + model.image!,
                            width: width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: getPercentSize(imgHeight, 14),vertical: getPercentSize(imgHeight, 6)),
                          height: getPercentSize(imgHeight, 18),
                          width: getPercentSize(imgHeight, 18),
                          decoration: ShapeDecoration(
                            color: backgroundColor,
                            shape: SmoothRectangleBorder(
                              side: BorderSide(color: iconColor, width: 0.1),
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: getPercentSize(imgHeight, 5),
                                cornerSmoothing: 0.8,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Image.asset('${assetsPath}heart.png',
                                color: primaryColor,
                                height: getPercentSize(imgHeight, 10)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: getPercentSize(width, 5),bottom: getPercentSize(width, 6),right:getPercentSize(width, 5) ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: getCustomTextWidget(
                                      model.name!,
                                      textColor,
                                      getPercentSize(remainHeight, 11),
                                      FontWeight.w900,
                                      TextAlign.start,1)),

                              getCustomTextWidget(
                                  model.price!,
                                  primaryColor,
                                  getPercentSize(remainHeight, 10),
                                  FontWeight.bold,
                                  TextAlign.start,1)
                            ],
                          ),
                          SizedBox(
                            height: getPercentSize(remainHeight, 4),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                '${assetsPath}location.png',
                                height: getPercentSize(remainHeight, 10),
                              ),
                              SizedBox(
                                width: getPercentSize(width, 2),
                              ),
                              getCustomTextWidget(
                                  model.address!,
                                  textColor,
                                  getPercentSize(remainHeight, 9.4),
                                  FontWeight.w500,
                                  TextAlign.start,1),
                              Expanded(
                                  child: getCustomTextWidget(
                                      ' (3 km)',
                                      textColor,
                                      getPercentSize(remainHeight, 8.2),
                                      FontWeight.w500,
                                      TextAlign.start,1)),
                            ],
                          ),
                          // SizedBox(
                          //   height: getPercentSize(remainHeight, 6),
                          // ),
                          Expanded(flex: 1,child: Container(),),
                          Row(
                            children: [
                              Expanded(
                                  child: getTextWidget(
                                      model.desc!,
                                      subTextColor,
                                      getPercentSize(remainHeight, 9),
                                      FontWeight.w500,
                                      TextAlign.start)),
                              SizedBox(
                                width: getPercentSize(width, 2),
                              ),
                              // getMaterialWidget(context, Container(
                              //   height: getPercentSize(remainHeight, 14),
                              //   width: getPercentSize(remainHeight, 14),
                              //   decoration: getDecorationWithColor(
                              //       getPercentSize(remainHeight, 3), primaryColor),
                              //   child: Center(
                              //     child: Icon(Icons.add,
                              //         color: Colors.white,
                              //         size: getPercentSize(remainHeight, 9)),
                              //   ),
                              // ), getPercentSize(remainHeight, 3), getPercentSize(remainHeight, 14))
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PetDetailPage(model)));
          },
        );
      }),
    );
  }
}

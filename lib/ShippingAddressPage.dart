import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/PrefData.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'AddNewAddressPage.dart';
import 'model/AddressModel.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  _ShippingAddressPage createState() {
    return _ShippingAddressPage();
  }
}

class _ShippingAddressPage extends State<ShippingAddressPage> {
  List<AddressModel> addressList = DataFile.getAddressList();

  int _selectedAddress = 0;

  @override
  void initState() {
    super.initState();
    addressList = DataFile.getAddressList();
    isDataAvailable();
    setState(() {});
  }

  bool isData = false;

  isDataAvailable() async {
    isData = await PrefData.getIsAddress();
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
    double defaultMargin = getScreenPercentSize(context, 2);
    double cellHeight = MediaQuery.of(context).size.width * 0.2;
    double topMargin = getScreenPercentSize(context, 1);
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 0,
            backgroundColor: backgroundColor,
            title: getAppBarText(context, 'Shipping Address'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getAppBar(context, 'My Address', isBack: true, function: () {
                    _requestPop();
                  }),
                  Visibility(
                    visible: isData,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: leftMargin),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: getScreenPercentSize(context, 2)),
                        child: getTextWithFontFamilyWidget(
                            'Your Addresses',
                            textColor,
                            getScreenPercentSize(context, 2),
                            FontWeight.w500,
                            TextAlign.center),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: (defaultMargin)),
                      padding:
                          EdgeInsets.symmetric(horizontal: leftMargin),
                      child: Container(
                          child: isData
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: addressList.length,
                                  itemBuilder: (context, index) {
                                    return getMaterialCell(context,widget: InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: getWidthPercentSize(
                                                context, 3)),
                                        padding: EdgeInsets.all(
                                            getPercentSize(cellHeight, 10)),

                                        decoration: getDecorationWithRadius(
                                            getPercentSize(cellHeight, 10),
                                            primaryColor),

                                        height: cellHeight,

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
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        getCustomTextWithoutAlignWithFontFamily(
                                                            addressList[index]
                                                                .name!,
                                                            textColor,
                                                            FontWeight.w500,
                                                            getPercentSize(
                                                                cellHeight,
                                                                20)),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              top:
                                                              (topMargin /
                                                                  2)),
                                                          child: getCustomTextWidget(
                                                              addressList[index]
                                                                  .location!,
                                                              textColor,
                                                              getPercentSize(
                                                                  cellHeight,
                                                                  15),
                                                              FontWeight.w400,
                                                              TextAlign.start,
                                                              2),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                    Alignment.centerRight,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 3),
                                                      child: Icon(
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
                                                        size: getPercentSize(
                                                            cellHeight, 25),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        _selectedAddress = index;
                                        setState(() {});
                                      },
                                    ));
                                  })
                              : emptyWidget()),
                    ),
                  ),
                  Visibility(
                    visible: isData,
                    child: Container(
                      margin: EdgeInsets.only(


                          top: getScreenPercentSize(context, 0.5)),
                      child: getButtonWidget(
                          context, 'Add New Address', primaryColor, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddNewAddressPage(),
                            ));
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  emptyWidget() {
    PrefData.setIsOrder(true);
    double width = getWidthPercentSize(context, 45);
    double height = getScreenPercentSize(context, 7);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            '${assetsPath}locations1.png',
            height: getScreenPercentSize(context, 20),
          ),
          SizedBox(
            height: getScreenPercentSize(context, 3),
          ),
          getCustomTextWithFontFamilyWidget(
              'No Address Yet!',
              textColor,
              getScreenPercentSize(context, 2.5),
              FontWeight.w500,
              TextAlign.center,
              1),
          SizedBox(
            height: getScreenPercentSize(context, 1),
          ),
          getCustomTextWidget(
              'Add your address and lets get started.',
              textColor,
              getScreenPercentSize(context, 2),
              FontWeight.w400,
              TextAlign.center,
              1),
          InkWell(
            onTap: () {
              PrefData.setIsAddress(true);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewAddressPage(),
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
                      'Add New Address',
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
}

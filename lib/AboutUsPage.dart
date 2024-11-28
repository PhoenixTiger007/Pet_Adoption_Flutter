import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';

import 'generated/l10n.dart';


class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  _AboutUsPage createState() {
    return _AboutUsPage();
  }
}

class _AboutUsPage extends State<AboutUsPage> {
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
    setThemePosition();

    double margin = getScreenPercentSize(context,1.5);


    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,

            toolbarHeight: 0,
            title: getAppBarText(context,S.of(context).aboutUs),

            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: getAppBarIcon(),
                  onPressed: _requestPop,
                );
              },
            ),
          ),
          body: Column(
            children: [
              getAppBar(context, S.of(context).aboutUs,function: (){
                _requestPop();
              }, isBack: true),
              Expanded(flex: 1,
                child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.all(margin),



                        child: getSpaceTextWidget(loremText,

                            textColor,TextAlign.start, FontWeight.w400, getScreenPercentSize(context, 2)),


                    )),
              ),
            ],
          ),
        ));
  }
}

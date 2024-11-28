

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pet_shop/customView/CountryCodePicker.dart';

import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';



import 'PhoneVerification.dart';
import 'SignInPage.dart';
import 'generated/l10n.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPage createState() {
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  bool isRemember = false;
  int themeMode = 0;
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textNameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();





  Future<bool> _requestPop() {
    Navigator.of(context).pop();

    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
    return Future.value(false);
  }


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      setThemePosition(context: context);
      setState(() {});
    });
  }

  FocusNode myFocusNode=FocusNode();
  bool isAutoFocus=false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double height = getScreenPercentSize(context, 7);


    double radius = getPercentSize(height, 20);


    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(

          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: backgroundColor,
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Text(''),
            leading: GestureDetector(

              onTap: (){
                _requestPop();
              },
              child: Icon(
                Icons.keyboard_backspace,
                color: textColor,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getHorizontalSpace(context)),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      // getTextWidget(
                      //     "Sign Up!",
                      //   textColor, getScreenPercentSize(context, 4.2),   FontWeight.bold,
                      //     TextAlign.left,
                      //
                      //    ),

                      SizedBox(
                        height: getScreenPercentSize(context, 3),
                      ),
                      getTextWithFontFamilyWidget(
                        'Sign Up',
                        textColor,
                        getScreenPercentSize(context, 3),
                        FontWeight.w400,
                        TextAlign.left,
                      ),


                      SizedBox(
                        height: getScreenPercentSize(context, 1),
                      ),

                      getTextWidget(
                        'Create Account for meet now Friends!',
                        textColor,
                        getScreenPercentSize(context, 1.9),
                        FontWeight.w400,
                        TextAlign.left,
                      ),



                      SizedBox(
                        height: getScreenPercentSize(context, 2.5),
                      ),

                      getDefaultTextFiledWidget(
                          context,'Phone Name',Icons.account_circle_outlined, textNameController),

                      getDefaultTextFiledWidget(
                          context,'Phone Email',Icons.mail_outline,  textEmailController),


                      Padding(
                        padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1.2)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height :height,
                              margin: EdgeInsets.only(right: 7),
                              padding: EdgeInsets.symmetric(horizontal: 5),

                              decoration: ShapeDecoration(

                                color: cellColor,

                                // shadows: [BoxShadow(
                                //     color: textColor.withOpacity(0.1),
                                //     blurRadius: 2,
                                //     spreadRadius: 1,
                                //     offset: Offset(0, 4))],
                                shape: SmoothRectangleBorder(
                                  side: BorderSide(color: borderColor,width:1),

                                  borderRadius: SmoothBorderRadius(
                                    cornerRadius: radius,
                                    cornerSmoothing: 0.8,
                                  ),
                                ),
                              ),

                              // decoration: BoxDecoration(
                              //   color: cellColor,      border: Border.all(color: subTextColor,width: 0.3),
                              //
                              //
                              //
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(radius),
                              //   ),
                              // ),
                              child: CountryCodePicker(
                                boxDecoration: BoxDecoration(
                                  color: cellColor,

                                ),
                                closeIcon: Icon(Icons.close,
                                    size: getScreenPercentSize(context, 3),
                                    color: textColor),

                                onChanged: (value) {

                                },
                                initialSelection: 'IN',
                                searchStyle: TextStyle(
                                    color: textColor,
                                    fontFamily: fontFamily),
                                searchDecoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: textColor),
                                    ),
                                    hintStyle: TextStyle(
                                        color: textColor,
                                        fontFamily: fontFamily)),
                                textStyle: TextStyle(
                                    color: subTextColor,
                                    fontFamily: fontFamily),
                                dialogTextStyle: TextStyle(
                                    color: subTextColor,
                                    fontFamily: fontFamily),

                                showFlagDialog: true,
                                hideSearch: true,
                                comparator: (a, b) => b.name!.compareTo(a.name!),


                                onInit: (code) {

                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                    height: height,
                                    padding: EdgeInsets.only(left: 7),
                                    margin: EdgeInsets.only(left: 7),
                                    alignment: Alignment.centerLeft,

                                    decoration: ShapeDecoration(

                                      color: cellColor,

                                      // shadows: [BoxShadow(
                                      //     color: textColor.withOpacity(0.1),
                                      //     blurRadius: 2,
                                      //     spreadRadius: 1,
                                      //     offset: Offset(0, 4))],
                                      shape: SmoothRectangleBorder(
                                        side: BorderSide(color: isAutoFocus?primaryColor:borderColor, width: 1),

                                        borderRadius: SmoothBorderRadius(
                                          cornerRadius: radius,
                                          cornerSmoothing: 0.8,
                                        ),
                                      ),
                                    ),

                                    // decoration: BoxDecoration(
                                    //   color: cellColor,
                                    //   border: Border.all(color: subTextColor,width: 0.3),
                                    //
                                    //
                                    //
                                    //   borderRadius: BorderRadius.all(
                                    //     Radius.circular(radius),
                                    //   ),
                                    // ),
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
                                        focusNode: myFocusNode,
                                        onChanged: (value) async {
                                          try {} catch (e) {
                                          }
                                        },
                                        decoration: InputDecoration(
                                            contentPadding:
                                            EdgeInsets.only(left: getWidthPercentSize(context, 2)),
                                            isDense: true,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            hintText: 'Phone number',
                                            hintStyle: TextStyle(
                                                fontFamily: fontFamily,
                                                color: subTextColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: getPercentSize(height, 25))),
                                        style: TextStyle(
                                            fontFamily: fontFamily,
                                            color: textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: getPercentSize(height, 25)),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ], // Only numbers can be entered
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),


                      getPasswordTextFiled(
                          context, 'Password', textPasswordController),
                      SizedBox(
                        height: getScreenPercentSize(context, 1.5),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(isTermsCondition){
                                  isTermsCondition=false;
                                }else {
                                  isTermsCondition = true;
                                }
                              });
                            },
                            child: Container(
                              height: getScreenPercentSize(context, 3),
                              width: getScreenPercentSize(context, 3),

                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor.withOpacity(0.4),width: 1),
                                  color: (isTermsCondition) ? primaryColor : Colors.transparent,
                                  borderRadius: BorderRadius.all(Radius.circular(getScreenPercentSize(context, 0.5)))
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  size: getScreenPercentSize(context, 2.5),
                                  color:
                                  (isTermsCondition) ? Colors.white : Colors.transparent,
                                ),
                              ),
                            ),
                          ), SizedBox(width: 5,),

                          getTextWidget('I agree with ', textColor,
                              getScreenPercentSize(context, 1.8),FontWeight.w600,TextAlign.center),
                          SizedBox(width: 5,),
                          getTextWidget('Terms', primaryColor,
                              getScreenPercentSize(context, 1.8),FontWeight.w600,TextAlign.center),

                          getTextWidget(' & ', textColor,
                              getScreenPercentSize(context, 1.8),FontWeight.w600,TextAlign.center),
                          getTextWidget('Condition', primaryColor,
                              getScreenPercentSize(context, 1.8),FontWeight.w600,TextAlign.center),

                          // InkWell(
                          //
                          //   child:     getTextWidget("Terms", primaryColor,
                          //       getScreenPercentSize(context, 1.8),FontWeight.w700,TextAlign.center),
                          //
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => SignInPage()));
                          //   },
                          // )
                        ],
                      ),
                      SizedBox(
                        height: getScreenPercentSize(context, 3),
                      ),

                      getButtonWithoutSpaceWidget(context,'Sign Up',
                          primaryColor, () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhoneVerification(true),
                                ));
                      }),






                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //
                      //     getTextWidget(
                      //         S.of(context).youHaveAnAlreadyAccount,
                      //         textColor, getScreenPercentSize(context, 1.8),
                      //         FontWeight.w500,
                      //         TextAlign.left,
                      //        ),
                      //
                      //     SizedBox(
                      //       width: getScreenPercentSize(context, 0.5),
                      //     ),
                      //     InkWell(
                      //       child: getTextWidget(
                      //           "Sign In",
                      //           primaryColor,getScreenPercentSize(context, 2),
                      //           FontWeight.bold, TextAlign.start,
                      //           ),onTap: (){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                      //     },
                      //     )
                      //
                      //   ],
                      // )



                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: getScreenPercentSize(context, 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getTextWidget( S.of(context).youHaveAnAlreadyAccount, textColor,
                            getScreenPercentSize(context, 2),FontWeight.w400,TextAlign.center),
                        SizedBox(width: 5,),
                        InkWell(

                          child:     getTextWidget('Sign In', primaryColor,
                              getScreenPercentSize(context, 2),FontWeight.w700,TextAlign.center),

                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          },
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ));
  }

  bool isTermsCondition=false;
}

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_pet_shop/MainPage.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/PrefData.dart';


import 'ForgotPasswordPage.dart';
import 'SignUpPage.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPage createState() {
    return _SignInPage();
  }
}

class _SignInPage extends State<SignInPage> {
  bool isRemember = false;

  TextEditingController textNameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  Future<bool> _requestPop() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => AddToCartPage(),
    //     ));
    Navigator.of(context).pop();
    return Future.value(false);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setThemePosition(context: context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    

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
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Text(''),
            leading: GestureDetector(
              onTap: () {
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

                      SizedBox(
                        height: getScreenPercentSize(context, 2),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          '${assetsPath}splash_icon.png',
                          height: getScreenPercentSize(context, 7.5),
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: getScreenPercentSize(context, 1.5),),

                      getTextWithFontFamilyWidget(
                        'Hey,\nLogin Now',
                        textColor,
                        getScreenPercentSize(context, 3),
                        FontWeight.w400,
                        TextAlign.left,
                      ),
                      SizedBox(
                        height: getScreenPercentSize(context, 1.5),
                      ),
                      getTextWidget(
                        'Glad to meet you again!',
                        textColor,
                        getScreenPercentSize(context, 1.8),
                        FontWeight.w500,
                        TextAlign.left,
                      ),

                      SizedBox(
                        height: getScreenPercentSize(context, 2.5),
                      ),
                      getDefaultTextFiledWidget(context, 'Email Address',
                          Icons.account_circle_outlined, textNameController),
                      getPasswordTextFiled(
                          context, 'Password', textPasswordController),

                      SizedBox(
                        height: getScreenPercentSize(context, 1.5),
                      ),
                      InkWell(
                        child: getTextWidget(
                          'Forgot Password?',
                          primaryColor,
                          getScreenPercentSize(context, 1.8),
                          FontWeight.w600,
                          TextAlign.end,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(),
                              ));
                        },
                      ),
                      SizedBox(
                        height: getScreenPercentSize(context, 4),
                      ),
                      getButtonWithoutSpaceWidget(context, 'Login', primaryColor, () {

                        PrefData.setIsSignIn(true);
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
                      }),


                      Padding(
                        padding:  EdgeInsets.only(bottom: getScreenPercentSize(context,4),top: getScreenPercentSize(context,2)),
                        child: getTextWidget(
                          'Login with',
                          textColor,
                          getScreenPercentSize(context, 1.8),
                          FontWeight.w400,
                          TextAlign.center,
                        ),
                      ),


                      Row(

                        children: [




                          Expanded(
                            child: InkWell(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));



                              },
                              child: Container(
                                margin: EdgeInsets.only(right: getWidthPercentSize(context,2)),
                                height: getScreenPercentSize(context,7),

                                decoration: ShapeDecoration(

                                  color: Colors.transparent,

                                  shape: SmoothRectangleBorder(
                                    side: BorderSide(color: subTextColor,width: 0.2),
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: getScreenPercentSize(context, 1.8),
                                      cornerSmoothing: 0.8,
                                    ),
                                  ),
                                ),





                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('${assetsPath}google.png',height: getScreenPercentSize(context, 3),),
                                    SizedBox(width: getWidthPercentSize(context, 2),),
                                    getTextWidget('Google', textColor, getScreenPercentSize(context, 1.8),
                                        FontWeight.w600, TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          Expanded(
                            child: InkWell(
                              onTap: (){


                              },
                              child: Container(
                                margin: EdgeInsets.only(left: getWidthPercentSize(context,2)),
                                height: getScreenPercentSize(context,7),

                                decoration: ShapeDecoration(

                                  color: Colors.transparent,

                                  shape: SmoothRectangleBorder(
                                    side: BorderSide(color: subTextColor,width: 0.2),
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: getScreenPercentSize(context, 1.8),
                                      cornerSmoothing: 0.8,
                                    ),
                                  ),
                                ),





                                child:   Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('${assetsPath}facebook.png',height: getScreenPercentSize(context, 3),),
                                  SizedBox(width: getWidthPercentSize(context, 2),),
                                  getTextWidget('Facebook', textColor, getScreenPercentSize(context, 1.8),
                                      FontWeight.w600, TextAlign.center),
                                ],
                              ),
                              ),
                            ),
                          )
                        ],
                      ),

                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: getScreenPercentSize(context, .5)),
                      //   child: Center(
                      //     child: getTextWidget(
                      //       "OR",
                      //       textColor,
                      //       getScreenPercentSize(context, 1.8),
                      //       FontWeight.w300,
                      //       TextAlign.center,
                      //     ),
                      //   ),
                      // ),
                      // getButtonWidget(context, "Sign Up", primaryColor, () {
                      //
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => SignUpPage(),
                      //       ));
                      // }),



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
                        getTextWidget("Don't have an account?", textColor,
                            getScreenPercentSize(context, 2),FontWeight.w400,TextAlign.center),
                        SizedBox(width: 5,),
                        InkWell(

                          child:     getTextWidget('Sign Up', primaryColor,
                              getScreenPercentSize(context, 2),FontWeight.w500,TextAlign.center),

                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
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
}

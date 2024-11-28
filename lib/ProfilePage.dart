import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/EditProfilePage.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';
import 'package:image_picker/image_picker.dart';


import 'model/AddressModel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePage createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  List<AddressModel> addressList = DataFile.getAddressList();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  void initState() {
    super.initState();
    addressList = DataFile.getAddressList();

    firstNameController.text = 'harry';
    lastNameController.text = 'harry';
    mailController.text = 'fd@gamil.com';
    genderController.text = 'Male';
    phoneController.text = '326598659';

    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  XFile? _image;
  final picker = ImagePicker();




  getProfileImage() {

    if (_image != null && _image!.path.isNotEmpty) {
      return Image.file(
        File(_image!.path),
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        '${assetsPath}hugh.png',
        fit: BoxFit.cover,
      );
    }

  }double defaultMargin=0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);




    double profileHeight = getScreenPercentSize(context, 12);
     defaultMargin = getHorizontalSpace(context);




    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            centerTitle: true,
            backgroundColor: backgroundColor,
            // title: getAppBarText(context,S.of(context).editProfiles),
            // leading: Builder(
            //   builder: (BuildContext context) {
            //     return IconButton(
            //       icon: getAppBarIcon(),
            //       onPressed: _requestPop,
            //     );
            //   },
            // ),
          ),



          //
          // bottomNavigationBar: getBottomText(
          //     context, S.of(context).save, () {
          //   Navigator.of(context).pop(true);
          // }),

          body: Container(
            child: Column(
              children: [

                getAppBar(context, 'Profile',isBack: true,function: (){
                  _requestPop();
                }),

                SizedBox(height: getScreenPercentSize(context, 2),),
                Expanded(
                  flex: 1,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    children: [
                      SizedBox(
                          height: profileHeight + (profileHeight / 5),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: <Widget>[




                                Align(
                                  alignment: Alignment.topCenter,
                                    child: Container(
                                      margin: EdgeInsets.only(top: defaultMargin),
                                    height: profileHeight,
                                    width: profileHeight,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle,

                                    ),
                                    child: ClipOval(
                                      child: Material(
                                        color: primaryColor,
                                        child: getProfileImage(),
                                      ),
                                    ),
                                  ),
                                ),
                                // Align(
                                //   alignment: Alignment.bottomCenter,
                                //   child: InkWell(
                                //     child: Container(
                                //       margin: EdgeInsets.only(
                                //           left: getScreenPercentSize(
                                //               context, 9),
                                //           bottom:
                                //           getScreenPercentSize(
                                //               context, 1.6)),
                                //       height: editSize,
                                //       width: editSize,
                                //       child: Container(
                                //         decoration: BoxDecoration(
                                //           shape: BoxShape.circle,
                                //           color: Colors.white,
                                //           boxShadow: [
                                //             BoxShadow(
                                //                 color: primaryColor.withOpacity(0.1),
                                //                 blurRadius: 4,
                                //                 spreadRadius: 3,
                                //                 offset: Offset(0, 3))
                                //           ],
                                //         ),
                                //         child: Center(
                                //           child: Image.asset(
                                //             assetsPath+"edit.png",
                                //             color: primaryColor,
                                //             height: getPercentSize(
                                //                 editSize, 55),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     onTap: () async {
                                //       _imgFromGallery();
                                //     },
                                //   ),
                                // )
                              ],
                            ),
                          )),


                      SizedBox(height: (defaultMargin*2),),


                      getTitle('First Name'),
                      getEditProfileTextFiledWidget(context, 'First Name',
                          firstNameController),

                      getTitle('Last Name'),
                      getEditProfileTextFiledWidget(context, 'Last Name',
                          lastNameController),

                      getTitle('Email'),

                      getEditProfileTextFiledWidget(context, 'Email',
                          mailController),

                      getTitle('Phone Number'),
                      getEditProfileTextFiledWidget(context, 'Phone Number',
                          phoneController),







                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top
                      : (defaultMargin/2)),
                  child: getButtonWidget(context, 'Edit profile',primaryColor, (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfilePage(),));
                  }),
                )
                
              ],
            ),
          ),
        ));
  }


  Widget getEditProfileTextFiledWidget(BuildContext context, String s,
      TextEditingController textEditingController) {
    double height = getScreenPercentSize(context, 7);

    double fontSize = getPercentSize(height, 27);

    return Container(

      height: getScreenPercentSize(context, 6),

      alignment: Alignment.centerLeft,

      // decoration: ShapeDecoration(
      //   color: cellColor,
      //
      //   // shadows: [BoxShadow(
      //   //     color: textColor.withOpacity(0.1),
      //   //     blurRadius: 2,
      //   //     spreadRadius: 1,
      //   //     offset: Offset(0, 4))],
      //   shape: SmoothRectangleBorder(
      //     side: BorderSide(color: primaryColor.withOpacity(0.5), width: 0.3),
      //     borderRadius: SmoothBorderRadius(
      //       cornerRadius: radius,
      //       cornerSmoothing: 0.8,
      //     ),
      //   ),
      // ),



      child: TextField(
        maxLines: 1,
        controller: textEditingController,
        textAlign: TextAlign.start,
        enabled: false,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: fontSize),
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.zero,
            // border: InputBorder.none,
            // focusedBorder: InputBorder.none,
            // enabledBorder: InputBorder.none,
            // errorBorder: InputBorder.none,
            // disabledBorder: InputBorder.none,

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor,width: 0.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor,width: 0.5),
            ),


            hintText: s,
            suffixIcon: Icon(
              Icons.add,
              color: Colors.transparent,
              size: getPercentSize(height, 40),
            ),
            hintStyle: TextStyle(
                fontFamily: fontFamily,
                color: subTextColor,
                fontWeight: FontWeight.w400,
                fontSize: fontSize)),
      ),
    );
  }



  getTitle(String string){
    return Container(
      margin: EdgeInsets.only(top: getScreenPercentSize(context,3)),
      child: getTextWidget(string, textColor,getScreenPercentSize(context, 1.8),
          FontWeight.w600, TextAlign.start),
    );
  }

}

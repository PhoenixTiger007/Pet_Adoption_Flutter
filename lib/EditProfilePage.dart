import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/DataFile.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';
import 'package:image_picker/image_picker.dart';


import 'model/AddressModel.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePage createState() {
    return _EditProfilePage();
  }
}

class _EditProfilePage extends State<EditProfilePage> {
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

  _imgFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print(image!.path);
    setState(() {
      _image = image;
    });


  }


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

  }

  double defaultMargin=0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);



    double profileHeight = getScreenPercentSize(context, 12);
     defaultMargin = getHorizontalSpace(context);
    double editSize = getPercentSize(profileHeight, 26);




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

          body: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Container(
              child: Column(
                children: [

                  getAppBar(context, 'Edit Profile',isBack: true,function: (){
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
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: getScreenPercentSize(
                                                context, 9),
                                            bottom:
                                            getScreenPercentSize(
                                                context, 1.6)),
                                        height: editSize,
                                        width: editSize,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: primaryColor.withOpacity(0.1),
                                                  blurRadius: 4,
                                                  spreadRadius: 3,
                                                  offset: Offset(0, 3))
                                            ],
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              '${assetsPath}edit.png',
                                              color: primaryColor,
                                              height: getPercentSize(
                                                  editSize, 55),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        _imgFromGallery();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )),


                        SizedBox(height: (defaultMargin*2),),


                        getEditProfileTextFiledWidget(context, 'First Name',
                            firstNameController),

                        getEditProfileTextFiledWidget(context, 'Last Name',
                            lastNameController),


                        getEditProfileTextFiledWidget(context, 'Email',
                            mailController),

                        getEditProfileTextFiledWidget(context, 'Phone Number',
                            phoneController),







                      ],
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(top
                        : (defaultMargin/2)),
                    child: getButtonWidget(context, 'Save',primaryColor, (){
                      Navigator.of(context).pop(true);
                    }),
                  )

                ],
              ),
            ),
          ),
        ));
  }





  getTitle(String string){
    return Container(
      margin: EdgeInsets.only(top: getScreenPercentSize(context,3)),
      child: getTextWidget(string, textColor,getScreenPercentSize(context, 1.8),
          FontWeight.w600, TextAlign.start),
    );
  }


}

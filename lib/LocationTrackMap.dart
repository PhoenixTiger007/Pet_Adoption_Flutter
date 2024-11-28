import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/model/ProductModel.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';



class LocationTrackMap extends StatefulWidget {

  final ProductModel model;
  const LocationTrackMap(this.model, {super.key});
  @override
  _LocationTrackMap createState() => _LocationTrackMap();
}

class _LocationTrackMap extends State<LocationTrackMap> {
  // GoogleMapController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {});
  }
  //
  // void _onMapCreated(GoogleMapController controllers) {
  //   controller = controllers;
  // }

  FocusNode myFocusNode=FocusNode();
  bool isAutoFocus=false;
  double   defMargin=0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // PolylineId polylineId = PolylineId("area");
    // PolylineId polylineId2 = PolylineId("area2");

    double height = getScreenPercentSize(context, 6);
       defMargin = getHorizontalSpace(context);
    double radius = getScreenPercentSize(context, 1.5);


    return WillPopScope(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            toolbarHeight: 0,
            leading: IconButton(
              onPressed: () {
                finish();
              },
              icon: Icon(
                Icons.keyboard_backspace_outlined,
                color: textColor,
              ),
            ),
            backgroundColor: backgroundColor,
            title: getAppBarText(context,'Track Order'),

          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                getAppBar(context, 'Location', isBack: true, function: () {
                  finish();
                }),

                Row(
                  children: [
                    SizedBox(
                      width: defMargin,
                    ),
                    Expanded(
                      child: StatefulBuilder(
                          builder: (context, setState) {
                          return Container(
                            height: height,
                            margin: EdgeInsets.symmetric(vertical: defMargin),
                            decoration: getDecorationWithBorder(radius,color: isAutoFocus?primaryColor:borderColor),
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
                                autofocus: false,
                                focusNode: myFocusNode,
                                style: TextStyle(
                                  fontFamily: fontFamily,
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getScreenPercentSize(context, 1.7),
                                ),
                                onChanged: (string) {},
                                maxLines: 1,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: defMargin),
                                    hintText: 'Search...',
                                    prefixIcon: Icon(
                                      CupertinoIcons.search,
                                      color: subTextColor,
                                      size: getPercentSize(height, 50),
                                    ),
                                    hintStyle: TextStyle(
                                      color: subTextColor,
                                      fontFamily: fontFamily,
                                      fontSize: getScreenPercentSize(context, 1.7),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    disabledBorder: getOutLineBorder(radius),
                                    enabledBorder: getOutLineBorder(radius),
                                    focusedBorder: getOutLineBorder(radius),
                                    isDense: true),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                    SizedBox(
                      width: (defMargin / 2),
                    ),

                    getMaterialWidget(context, Container(
                      height: height,
                      width: height,
                      decoration: getDecorationWithColor(radius, primaryColor),
                      child: Center(
                        child: Image.asset('${assetsPath}filter bold.png',
                            color: Colors.white,
                            height: getPercentSize(height, 55)),
                      ),
                    ), radius, height)
                    ,
                    SizedBox(
                      width: (defMargin),
                    ),
                  ],
                ),

                // Expanded(
                //   flex: 1,
                //   child: Stack(
                //     children: [
                //       GoogleMap(
                //         onMapCreated: _onMapCreated,
                //         myLocationEnabled: true,
                //         myLocationButtonEnabled: false,
                //
                //         zoomGesturesEnabled: true,
                //
                //         rotateGesturesEnabled: false,
                //         scrollGesturesEnabled: true,
                //         tiltGesturesEnabled: false,
                //         initialCameraPosition: CameraPosition(
                //           target: LatLng(
                //               40.91163687464769 + 30, -74.52864461445306 + 30),
                //
                //           // target: LatLng(21.2117, 72.8858),
                //
                //           zoom: 7,
                //         ),
                //
                //         markers: Set<Marker>.of(<Marker>[
                //           Marker(
                //               markerId: MarkerId("Ey"),
                //               position: LatLng(40.91163687464769 + 30, -74.52864461445306 + 30),
                //               visible: true,
                //               flat: false,
                //               infoWindow: InfoWindow(
                //                 title: "Estimated Time",
                //                 snippet: "5-10 min",
                //               )),
                //         ]),
                //         polylines: Set<Polyline>.of(<Polyline>[
                //           Polyline(
                //               polylineId: polylineId,
                //               points: getPoints(),
                //               width: 5,
                //               color: Colors.green,
                //               visible: true),
                //           Polyline(
                //               polylineId: polylineId2,
                //               points: getPoint2(),
                //               width: 5,
                //               color: Colors.grey,
                //               visible: true)
                //         ]),
                //         polygons: Set<Polygon>.of(<Polygon>[
                //           Polygon(
                //               polygonId: PolygonId('area'),
                //               points: getPoints(),
                //               strokeColor: Colors.pink,
                //               strokeWidth: 5,
                //               fillColor: Colors.transparent,
                //               visible: true),
                //         ]),
                //       ),
                //       Align(
                //         alignment: Alignment.bottomCenter,
                //         child: getCell(),
                //
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          finish();
          return false;
        });
  }


  getCell(){
    double height = getScreenPercentSize(context, 12);
    double radius = getPercentSize(height, 12);
    double imageSize = getPercentSize(height, 90);
    double margin = getWidthPercentSize(context, 2.5);

    return  getMaterialCell(context,widget: Container(
      height: height,
      decoration: getDecoration(radius),
      margin: EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 2.5),horizontal: defMargin),
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
                  height: getPercentSize(height, 5),
                ),
                Row(
                  children: [
                    Image.asset(
                      '${assetsPath}location.png',
                      height: getPercentSize(height, 14),
                    ),
                    SizedBox(
                      width: getWidthPercentSize(context, 2),
                    ),
                    Expanded(flex: 1,
                      child: getCustomTextWidget(
                          'Abstain Dog',
                          textColor,
                          getPercentSize(height, 14),
                          FontWeight.w400,
                          TextAlign.start,
                          1),
                    ),
                  ],
                ),
                SizedBox(
                  height: getPercentSize(height, 10),
                ),

                getCustomTextWidget(
                    widget.model.desc!,
                    subTextColor,
                    getPercentSize(height, 14),
                    FontWeight.w400,
                    TextAlign.start,
                    1)

              ],
            ),
          ),
        ],
      ),
    ));
  }



  // getPoints() {
  //   return [
  //     LatLng(40.91163687464769, -74.52864461445306),
  //     // LatLng(21.2117 - 15, 72.8858 - 15),
  //     LatLng(40.91163687464769 + 30, -74.52864461445306 + 30),
  //   ];
  // }

  // getPoint2() {
  //   return [
  //     // LatLng(21.2089, 72.8907),
  //     // LatLng(21.2089 + 20, 72.8907 + 20),
  //
  //     LatLng(40.91163687464769 + 30, -74.52864461445306 + 30),
  //     LatLng(40.91163687464769 + 50, -74.52864461445306 + 50),
  //
  //     // LatLng(21.2084, 72.8990),
  //   ];
  // }

  void finish() {
    Navigator.of(context).pop();
  }
}

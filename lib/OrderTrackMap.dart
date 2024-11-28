import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';
import 'package:flutter_pet_shop/utils/SizeConfig.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


class OrderTrackMap extends StatefulWidget {
  const OrderTrackMap({super.key});

  @override
  _OrderTrackMap createState() => _OrderTrackMap();
}

class _OrderTrackMap extends State<OrderTrackMap> {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // PolylineId polylineId = PolylineId("area");
    // PolylineId polylineId2 = PolylineId("area2");
    double bottomHeight = SizeConfig.safeBlockVertical! * 20;
    double bottomImageHeight = getPercentSize(bottomHeight, 50);
    return WillPopScope(
        onWillPop: () { return Future.value(false); },
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                // finish();
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
    ),
        ));


        //     child: Column(
        //       children: [
        //         Expanded(
        //           flex: 1,
        //           child: GoogleMap(
        //             onMapCreated: _onMapCreated,
        //             myLocationEnabled: true,
        //             // consumeTapEvents: true,
        //             myLocationButtonEnabled: false,
        //
        //             zoomGesturesEnabled: true,
        //             // mapType: MapType.none,
        //             rotateGesturesEnabled: false,
        //             scrollGesturesEnabled: true,
        //             tiltGesturesEnabled: false,
        //             // myLocationEnabled: true,
        //             // initialCameraPosition: CameraPosition(
        //             //   // target: LatLng(21.2089, 72.8907),
        //             //   target: LatLng(
        //             //       40.91163687464769 + 30, -74.52864461445306 + 30),
        //
        //               // target: LatLng(21.2117, 72.8858),
        //
        //               zoom: 7,
        //             ),
        //
        //             markers: Set<Marker>.of(<Marker>[
        //               Marker(
        //                   markerId: MarkerId("Ey"),
        //                   position: LatLng(40.91163687464769 + 30, -74.52864461445306 + 30),
        //                   visible: true,
        //                   flat: false,
        //                   infoWindow: InfoWindow(
        //                     title: "Estimated Time",
        //                     snippet: "5-10 min",
        //                   )),
        //             ]),
        //             polylines: Set<Polyline>.of(<Polyline>[
        //               Polyline(
        //                   polylineId: polylineId,
        //                   points: getPoints(),
        //                   width: 5,
        //                   color: Colors.green,
        //                   visible: true),
        //               Polyline(
        //                   polylineId: polylineId2,
        //                   points: getPoint2(),
        //                   width: 5,
        //                   color: Colors.grey,
        //                   visible: true)
        //             ]),
        //             polygons: Set<Polygon>.of(<Polygon>[
        //               Polygon(
        //                   polygonId: PolygonId('area'),
        //                   points: getPoints(),
        //                   strokeColor: Colors.pink,
        //                   strokeWidth: 5,
        //                   fillColor: Colors.transparent,
        //                   visible: true),
        //             ]),
        //           ),
        //         ),
        //         Container(
        //           width: double.infinity,
        //           height: SizeConfig.safeBlockVertical! * 20,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.only(
        //                   topLeft: Radius.circular(40),
        //                   topRight: Radius.circular(40)),
        //               color: backgroundColor),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               getHorizonSpace(
        //                   SizeConfig.safeBlockHorizontal! * 4),
        //               ClipRRect(
        //                 borderRadius: BorderRadius.all(Radius.circular(
        //                     getPercentSize(
        //                         bottomImageHeight, 12))),
        //                 child: Image.asset(
        //                   assetsPath + "hugh.png",
        //                   fit: BoxFit.cover,
        //                   width: bottomImageHeight,
        //                   height: bottomImageHeight,
        //                 ),
        //               ),
        //               getHorizonSpace(
        //                   SizeConfig.safeBlockHorizontal! * 1.5),
        //               Expanded(
        //                   child: InkWell(
        //                 onTap: () {
        //                   Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (context) => OrderTrackingPage(),
        //                   ));
        //                 },
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     getCustomTextWidget(
        //                         "James King",
        //                         textColor,
        //                         getPercentSize(
        //                             bottomHeight, 15),
        //
        //                         FontWeight.w500,
        //                         TextAlign.start,
        //                         1),
        //                     Row(
        //                       children: [
        //                         Icon(
        //                           Icons.check_circle,
        //                           color: primaryColor,
        //                           size: getPercentSize(
        //                               bottomHeight, 15),
        //                         ),
        //                         getHorizonSpace(
        //                             SizeConfig.safeBlockHorizontal! * 1.2),
        //                         getCustomTextWidget(
        //                             "ID 2445556",
        //                             subTextColor,
        //                             getPercentSize(
        //                                 bottomHeight, 12),
        //
        //                             FontWeight.normal,
        //                             TextAlign.start,
        //                             1)
        //                       ],
        //                     )
        //                   ],
        //                 ),
        //               )),
        //               IconButton(
        //                   icon: Icon(
        //                     Icons.call,
        //                     color: primaryColor,
        //                     size:
        //                         getPercentSize(bottomHeight, 20),
        //                   ),
        //                   onPressed: () {
        //
        //                   }),
        //               IconButton(
        //                   icon: Icon(
        //                     CupertinoIcons.chat_bubble_text_fill,
        //                     color: primaryColor,
        //                     size:
        //                         getPercentSize(bottomHeight, 20),
        //                   ),
        //                   onPressed: () {
        //                     // Navigator.of(context).push(MaterialPageRoute(
        //                     //   builder: (context) =>
        //                     //       ChatScreen(user: chats[0].sender),
        //                     // ));
        //                   }),
        //               getHorizonSpace(
        //                   SizeConfig.safeBlockHorizontal! * 4),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // onWillPop: () async {
        //   finish();
        //   return false;
        // });
  // }
  //   ))


  // getPoints() {
  //   return [
  //     LatLng(40.91163687464769, -74.52864461445306),
  //     // LatLng(21.2117 - 15, 72.8858 - 15),
  //     LatLng(40.91163687464769 + 30, -74.52864461445306 + 30),
  //   ];
  // }
  //
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

  // void finish() {
  //   Navigator.of(context).pop();
  // }
}
  }

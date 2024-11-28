import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../utils/Constant.dart';
import '../utils/CustomWidget.dart';
import '../utils/SizeConfig.dart';

typedef OnChange = void Function(int index);

class ReviewSlider extends StatefulWidget {
  const ReviewSlider(
      {super.key,
      @required this.onChange,
      this.initialValue,
      this.options = const ['Terrible', 'Bad', 'Okay', 'Good', 'Great'],
      this.optionStyle,
      this.width,
      this.isCash,
      this.circleDiameter = 30});

  final OnChange? onChange;
  final int? initialValue;
  final List<String>? options;
  final TextStyle? optionStyle;
  final double? width;
  final double? circleDiameter;
  final bool? isCash;

  @override
  _ReviewSliderState createState() => _ReviewSliderState();
}

class _ReviewSliderState extends State<ReviewSlider>
    with SingleTickerProviderStateMixin {
  var initValue;

  @override
  void initState() {
    super.initState();

    initValue = widget.initialValue!.toDouble();

    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  _afterLayout(_) {
    widget.onChange!(widget.initialValue!);
  }

  void handleTap(int state) {
    widget.onChange!(state);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    print('initialValue---$initValue');

    return Stack(
      children: <Widget>[
        MeasureLine(
          states: widget.options!,
          handleTap: handleTap,
          animationValue: initValue,
          width: getWidthPercentSize(context, 80),
          options: widget.options!,
          isCash: widget.isCash!,
          oValue: widget.initialValue,
          optionStyle: widget.optionStyle!,
          circleDiameter: widget.circleDiameter!,
        ),
      ],
    );
  }
}

const double paddingSize = 10;

class MeasureLine extends StatelessWidget {
  const MeasureLine(
      {super.key,
      this.handleTap,
      this.animationValue,
      this.states,
      this.width,
      this.isCash,
      this.initValue,
      this.options,
      this.oValue,
      this.optionStyle,
      this.circleDiameter});

  final double? animationValue;
  final Function? handleTap;
  final List<String>? options;
  final bool? isCash;
  final int? oValue;
  final int? initValue;
  final List<String>? states;
  final double? width;
  final TextStyle? optionStyle;
  final double? circleDiameter;

  List<Widget> _buildUnits(BuildContext context) {
    double size = getPercentSize(circleDiameter!, 55);

    var res = <Widget>[];

    int lastPosition = oValue!;
    print('oValue-----$oValue');

    states!.asMap().forEach((index, text) {
      print('index-----$index-------$lastPosition');
      res.add(Expanded(
          child: Container(
        margin: EdgeInsets.only(top: getPercentSize(circleDiameter!, 24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ((index <= oValue!))
                ? Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_sharp,
                      size: size,
                      color: primaryColor,
                    ),
                  )
                : Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      '${assetsPath}un_selected_check.png',
                      height: size,
                      width: size,
                      color: subTextColor,
                    ),
                  ),
            SizedBox(
              height: getPercentSize(circleDiameter!, 15),
            ),
            Text(
              text,
              style: TextStyle(
                  color: (index <= oValue!) ? textColor : subTextColor,
                  fontFamily: fontFamily,
                  fontSize: getScreenPercentSize(context, 1.8),
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      )));
    });

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: circleDiameter! / 2,
                left: getScreenPercentSize(context, 8),
                right: getScreenPercentSize(context, 8)),
            child: Row(
              children: [
                getLine(0),
                getLine(1),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildUnits(
              context,
            ),
          ),
        ],
      ),
    );
  }

  getLine(int i) {
    return Expanded(
      child: SizedBox(
        height: 1.2,
        child: DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1.2,
          dashLength: 2.0,
          dashColor: primaryColor,
          dashRadius: 0.0,
          dashGapLength: 2.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
      ),
    );
  }
}

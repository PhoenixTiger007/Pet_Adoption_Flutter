import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import 'package:flutter_pet_shop/utils/CustomWidget.dart';

class CustomAnimatedBottomBar extends StatelessWidget {

  const CustomAnimatedBottomBar({
    super.key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  }) : assert(items.length >= 2 && items.length <= 5);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).primaryColorLight;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
             BoxShadow(
              color: iconColor.withOpacity(0.5),

               offset: const Offset(
                 5.0,
                 5.0,
               ),
               blurRadius: 0.7,
               spreadRadius: 5.0,
             ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: containerHeight,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  containerHeight: containerHeight,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final double containerHeight;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.containerHeight,
    required this.iconSize,
    this.curve = Curves.linear,
  });

  @override
  Widget build(BuildContext context) {

    double width= (getWidthPercentSize(context, 100)/5);
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(

        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,

        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: width,
            color: backgroundColor,


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: getPercentSize(width, 45),
                  width: getPercentSize(width, 45),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color:isSelected? primaryColor.withOpacity(0.1):Colors.transparent,
                            blurRadius: 3,
                            spreadRadius: 2,
                            offset: Offset(0, 6))
                      ],
                    color: isSelected?item.activeColor:Colors.transparent
                  ),
                  child: Center(
                    child: Image.asset(assetsPath+item.imageName!,height: isSelected?item.iconSize!:(item.iconSize!*1.4),color: isSelected?Colors.white:item.inactiveColor,),
                  ),
                ),

                // SizedBox(height:  getPercentSize(height, 20),),
                // getCustomTextWidget(item.title!,  isSelected? item ad.activeColor:item.inactiveColor!,
                //     textSize, FontWeight.w500, TextAlign.center,1)

              ],
            ),

          ),
        ),
      ),
    );
  }
}
class BottomNavyBarItem {

  BottomNavyBarItem({
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
    this.imageName,
    this.iconSize,
    this.title,
  });

  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
  final String? imageName;
  final String? title;
  final double? iconSize;

}

import 'package:country_code_picker/country_code_picker.dart' as picker;
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/utils/Constant.dart';
import '../utils/CustomWidget.dart';

/// selection dialog used for selection of the country code
class SelectionDialog extends StatefulWidget {
  final List<picker.CountryCode> elements;
  final bool? showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final WidgetBuilder? emptySearchBuilder;
  final bool? showFlag;
  final double flagWidth;
  final Decoration? flagDecoration;
  final Size? size;
  final bool hideSearch;
  final Icon? closeIcon;

  /// Background color of SelectionDialog
  final Color? backgroundColor;

  final Color? barrierColor;

  /// elements passed as favorite
  final List<picker.CountryCode> favoriteElements;

  SelectionDialog(
    this.elements,
    this.favoriteElements, {
    super.key,
    this.showCountryOnly,
    this.emptySearchBuilder,
    InputDecoration searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.textStyle,
    this.boxDecoration,
    this.showFlag,
    this.flagDecoration,
    this.flagWidth = 32,
    this.size,
    this.backgroundColor,
    this.barrierColor,
    this.hideSearch = false,
    this.closeIcon,
  }) : searchDecoration = searchDecoration.prefixIcon == null
            ? searchDecoration.copyWith(prefixIcon: const Icon(Icons.search))
            : searchDecoration;

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  /// this is useful for filtering purpose
  late List<picker.CountryCode> filteredElements;

  @override
  Widget build(BuildContext context) {
    double defMargin = getScreenPercentSize(context, 2);
    double radius = getScreenPercentSize(context, 1.5);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            getAppBar(context, 'Select a Country', function: () {
              Navigator.of(context).pop();
            }, isBack: true),
            Container(
              margin: EdgeInsets.all(defMargin),
              decoration: ShapeDecoration(
                color: backgroundColor,
                shape: SmoothRectangleBorder(
                  side: BorderSide(color: subTextColor, width: 0.5),
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: radius,
                    cornerSmoothing: 0.8,
                  ),
                ),
              ),
              child: TextField(
                onChanged: _filterElements,
                style: TextStyle(
                  fontFamily: fontFamily,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: getScreenPercentSize(context, 1.7),
                ),
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: defMargin),
                  hintText: 'Search country...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: subTextColor,
                    size: getScreenPercentSize(context, 3),
                  ),
                  hintStyle: TextStyle(
                    color: subTextColor,
                    fontFamily: fontFamily,
                    fontSize: getScreenPercentSize(context, 1.7),
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  isDense: true,
                  fillColor: Colors.transparent,
                  disabledBorder: getOutLineBorder(radius),
                  enabledBorder: getOutLineBorder(radius),
                  focusedBorder: getOutLineBorder(radius),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  widget.favoriteElements.isEmpty
                      ? const DecoratedBox(decoration: BoxDecoration())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...widget.favoriteElements.map(
                              (f) => SimpleDialogOption(
                                padding: EdgeInsets.zero,
                                child: _buildOption(f),
                                onPressed: () {
                                  _selectItem(f);
                                },
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                  if (filteredElements.isEmpty)
                    _buildEmptySearchWidget(context)
                  else
                    ...filteredElements.map(
                      (e) => SimpleDialogOption(
                        padding: EdgeInsets.zero,
                        child: _buildOption(e),
                        onPressed: () {
                          _selectItem(e);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(picker.CountryCode e) {
    double defMargin = getScreenPercentSize(context, 2);
    double height = getScreenPercentSize(context, 8);

    return getMaterialCell(
      context,
      widget: Container(
        margin: EdgeInsets.symmetric(
            horizontal: defMargin, vertical: (defMargin / 2)),
        padding: EdgeInsets.symmetric(horizontal: defMargin),
        height: height,
        width: double.infinity,
        decoration: getDecorationWithRadius(
            getScreenPercentSize(context, 1.5), primaryColor),
        child: Row(
          children: <Widget>[
            if (widget.showFlag!)
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                decoration: widget.flagDecoration,
                clipBehavior:
                    widget.flagDecoration == null ? Clip.none : Clip.hardEdge,
                child: Image.asset(
                  e.flagUri!,
                  package: 'country_code_picker',
                  width: widget.flagWidth,
                ),
              ),
            Expanded(
              flex: 1,
              child: getTextWidget(
                e.toCountryStringOnly(),
                textColor,
                getPercentSize(height, 25),
                FontWeight.w600,
                TextAlign.start,
              ),
            ),
            getTextWidget(
              e.dialCode!.toString(),
              textColor,
              getPercentSize(height, 25),
              FontWeight.w600,
              TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder!(context);
    }

    return Center(
      child: Text(
          picker.CountryLocalizations.of(context)?.translate('no_country') ??
              'No country found'),
    );
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) =>
              e.code!.contains(s) ||
              e.dialCode!.contains(s) ||
              e.name!.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(picker.CountryCode e) {
    Navigator.pop(context, e);
  }
}

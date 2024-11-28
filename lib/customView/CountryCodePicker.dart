library;

import 'package:collection/collection.dart' show IterableExtension;
import 'package:country_code_picker/country_code_picker.dart' as picker;
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'SelectionDialog.dart';

class CountryCodePicker extends StatefulWidget {
  final ValueChanged<picker.CountryCode>? onChanged;
  final ValueChanged<picker.CountryCode?>? onInit;
  final String? initialSelection;
  final List<String> favorite;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? dialogTextStyle;
  final WidgetBuilder? emptySearchBuilder;
  final Function(picker.CountryCode?)? builder;
  final bool enabled;
  final TextOverflow textOverflow;
  final Icon closeIcon;
  final Color? barrierColor;
  final Color? backgroundColor;
  final BoxDecoration? boxDecoration;
  final Size? dialogSize;
  final Color? dialogBackgroundColor;
  final List<String>? countryFilter;
  final bool showOnlyCountryWhenClosed;
  final bool alignLeft;
  final bool showFlag;
  final bool hideMainText;
  final bool? showFlagMain;
  final bool? showFlagDialog;
  final double flagWidth;
  final Comparator<picker.CountryCode>? comparator;
  final bool hideSearch;
  final bool showDropDownButton;
  final Decoration? flagDecoration;
  final List<Map<String, String>> countryList;

  const CountryCodePicker({
    super.key,
    this.onChanged,
    this.onInit,
    this.initialSelection,
    this.favorite = const [],
    this.textStyle,
    this.padding = const EdgeInsets.all(8.0),
    this.showCountryOnly = false,
    this.searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.dialogTextStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = false,
    this.alignLeft = false,
    this.showFlag = true,
    this.showFlagDialog,
    this.hideMainText = false,
    this.showFlagMain,
    this.flagDecoration,
    this.builder,
    this.flagWidth = 32.0,
    this.enabled = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.barrierColor,
    this.backgroundColor,
    this.boxDecoration,
    this.comparator,
    this.countryFilter,
    this.hideSearch = false,
    this.showDropDownButton = false,
    this.dialogSize,
    this.dialogBackgroundColor,
    this.closeIcon = const Icon(Icons.close),
    this.countryList = picker.codes,
  });

  @override
  State<StatefulWidget> createState() {
    List<Map<String, String>> jsonList = countryList;

    List<picker.CountryCode> elements =
        jsonList.map((json) => picker.CountryCode.fromJson(json)).toList();

    if (comparator != null) {
      elements.sort(comparator);
    }

    if (countryFilter != null && countryFilter!.isNotEmpty) {
      final uppercaseCustomList =
          countryFilter!.map((c) => c.toUpperCase()).toList();
      elements = elements
          .where((c) =>
              uppercaseCustomList.contains(c.code) ||
              uppercaseCustomList.contains(c.name) ||
              uppercaseCustomList.contains(c.dialCode))
          .toList();
    }

    return CountryCodePickerState(elements);
  }
}

class CountryCodePickerState extends State<CountryCodePicker> {
  picker.CountryCode? selectedItem;
  List<picker.CountryCode> elements = [];
  List<picker.CountryCode> favoriteElements = [];

  CountryCodePickerState(this.elements);

  @override
  Widget build(BuildContext context) {
    Widget mainButton;
    if (widget.builder != null) {
      mainButton = InkWell(
        onTap: showCountryCodePickerDialog,
        child: widget.builder!(selectedItem),
      );
    } else {
      mainButton = TextButton(
        onPressed: widget.enabled ? showCountryCodePickerDialog : null,
        child: Padding(
          padding: widget.padding,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (widget.showFlagMain != null
                  ? widget.showFlagMain!
                  : widget.showFlag)
                Flexible(
                  flex: widget.alignLeft ? 0 : 1,
                  fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
                  child: Container(
                    clipBehavior: widget.flagDecoration == null
                        ? Clip.none
                        : Clip.hardEdge,
                    decoration: widget.flagDecoration,
                    margin: widget.alignLeft
                        ? const EdgeInsets.only(right: 16.0, left: 8.0)
                        : const EdgeInsets.only(right: 16.0),
                    child: Image.asset(
                      selectedItem!.flagUri!,
                      package: 'country_code_picker',
                      width: widget.flagWidth,
                    ),
                  ),
                ),
              if (!widget.hideMainText)
                Flexible(
                  fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
                  child: Text(
                    widget.showOnlyCountryWhenClosed
                        ? selectedItem!.toCountryStringOnly()
                        : selectedItem.toString(),
                    style: widget.textStyle ??
                        Theme.of(context).textTheme.bodyMedium,
                    overflow: widget.textOverflow,
                  ),
                ),
              if (widget.showDropDownButton)
                Flexible(
                  flex: widget.alignLeft ? 0 : 1,
                  fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
                  child: Padding(
                    padding: widget.alignLeft
                        ? const EdgeInsets.only(right: 16.0, left: 8.0)
                        : const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                      size: widget.flagWidth,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return mainButton;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    elements = elements.map((e) => e.localize(context)).toList();
    _onInit(selectedItem);
  }

  @override
  void didUpdateWidget(CountryCodePicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialSelection != widget.initialSelection) {
      if (widget.initialSelection != null) {
        selectedItem = elements.firstWhere(
            (e) =>
                (e.code!.toUpperCase() ==
                    widget.initialSelection!.toUpperCase()) ||
                (e.dialCode == widget.initialSelection) ||
                (e.name!.toUpperCase() ==
                    widget.initialSelection!.toUpperCase()),
            orElse: () => elements[0]);
      } else {
        selectedItem = elements[0];
      }
      _onInit(selectedItem);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.code!.toUpperCase() ==
                  widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection) ||
              (e.name!.toUpperCase() == widget.initialSelection!.toUpperCase()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    favoriteElements = elements
        .where((e) =>
            widget.favorite.firstWhereOrNull((f) =>
                e.code!.toUpperCase() == f.toUpperCase() ||
                e.dialCode == f ||
                e.name!.toUpperCase() == f.toUpperCase()) !=
            null)
        .toList();
  }

  void showCountryCodePickerDialog() {
    if (!UniversalPlatform.isAndroid && !UniversalPlatform.isIOS) {
      showDialog(
        barrierColor: widget.barrierColor ?? Colors.grey.withOpacity(0.5),
        context: context,
        builder: (context) => Center(
          child: Container(
            constraints: const BoxConstraints(maxHeight: 500, maxWidth: 400),
            child: Dialog(
              child: SelectionDialog(
                elements,
                favoriteElements,
                showCountryOnly: widget.showCountryOnly,
                emptySearchBuilder: widget.emptySearchBuilder,
                searchDecoration: widget.searchDecoration,
                searchStyle: widget.searchStyle,
                textStyle: widget.dialogTextStyle,
                boxDecoration: widget.boxDecoration,
                showFlag: widget.showFlagDialog ?? widget.showFlag,
                flagWidth: widget.flagWidth,
                size: widget.dialogSize,
                backgroundColor: widget.dialogBackgroundColor,
                barrierColor: widget.barrierColor,
                hideSearch: widget.hideSearch,
                closeIcon: widget.closeIcon,
                flagDecoration: widget.flagDecoration,
              ),
            ),
          ),
        ),
      ).then((e) {
        if (e != null) {
          setState(() {
            selectedItem = e as picker.CountryCode;
          });

          _publishSelection(e as picker.CountryCode);
        }
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectionDialog(
            elements,
            favoriteElements,
            showCountryOnly: widget.showCountryOnly,
            emptySearchBuilder: widget.emptySearchBuilder,
            searchDecoration: widget.searchDecoration,
            searchStyle: widget.searchStyle,
            textStyle: widget.dialogTextStyle,
            boxDecoration: widget.boxDecoration,
            showFlag: widget.showFlagDialog ?? widget.showFlag,
            flagWidth: widget.flagWidth,
            flagDecoration: widget.flagDecoration,
            size: widget.dialogSize,
            backgroundColor: widget.dialogBackgroundColor,
            barrierColor: widget.barrierColor,
            hideSearch: widget.hideSearch,
            closeIcon: widget.closeIcon,
          ),
        ),
      ).then((e) {
        if (e != null) {
          setState(() {
            selectedItem = e as picker.CountryCode;
          });

          _publishSelection(e as picker.CountryCode);
        }
      });
    }
  }

  void _publishSelection(picker.CountryCode e) {
    if (widget.onChanged != null) {
      widget.onChanged!(e);
    }
  }

  void _onInit(picker.CountryCode? e) {
    if (widget.onInit != null) {
      widget.onInit!(e);
    }
  }
}

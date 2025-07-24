import 'package:dropdown_button2/dropdown_button2.dart'
    show ButtonStyleData, DropdownButtonFormField2, DropdownStyleData, IconStyleData, MenuItemStyleData;
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_fonts.dart';
import '../constants/image_resource.dart';
import '../theme/color_schemes.dart';

// Equatable class for dropdown items
class DropdownItem extends Equatable {
  final String value;
  final String label;
  final Widget? icon;

  const DropdownItem({required this.value, required this.label, this.icon});

  @override
  List<Object?> get props => [value, label, icon];
}

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownItem> items;
  final String? selectedValue;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsets contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? listItemStyle;
  final Widget? icon;
  final Color? iconColor;
  final double iconSize;
  final EdgeInsets? iconPadding;
  final EdgeInsets? menuItemPadding;
  final double? dropdownWidth;
  final double? dropdownMaxHeight;
  final bool isExpanded;
  final bool isDense;
  final double? buttonHeight;
  final Color? selectedItemColor;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.onSaved,
    this.validator,
    this.hintText = 'Select an option',
    this.borderRadius = 15.0,
    this.borderWidth = 1.0,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 16),
    this.hintStyle,
    this.textStyle,
    this.listItemStyle,
    this.icon,
    this.iconColor,
    this.iconSize = 24.0,
    this.iconPadding,
    this.menuItemPadding,
    this.dropdownWidth,
    this.dropdownMaxHeight,
    this.isExpanded = true,
    this.isDense = false,
    this.buttonHeight,
    this.selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget dropdownField = DropdownButtonFormField2<String>(
      isExpanded: isExpanded,
      isDense: isDense,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        fillColor: Colors.transparent,
        filled: false,
      ),
      hint: Padding(
        padding: EdgeInsets.only(left: 16.w, bottom: 3.h),
        child: Text(
          hintText,
          style:
              hintStyle ??
              TextStyle(
                color: AppColorSchemes.whiteColor,
                fontFamily: AppFonts.degular,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                height: 1.0,
              ),
        ),
      ),
      value: selectedValue,
      style:
          textStyle ??
          TextStyle(
            color: AppColorSchemes.whiteColor,
            fontFamily: AppFonts.degular,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            height: 1.0,
          ),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((DropdownItem item) {
          return Row(
            children: [
              SizedBox(width: 16.w),
              if (item.icon != null) ...[item.icon!, const SizedBox(width: 8)],
              Expanded(
                child: Padding(padding: EdgeInsets.only(bottom: 3.h),child:Text(
                  item.label,
                  style:
                      textStyle ??
                      TextStyle(
                        color: AppColorSchemes.whiteColor,
                        fontFamily: AppFonts.degular,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        height: 1.0,
                      ),
                  overflow: TextOverflow.ellipsis,
                )),
              ),
            ],
          );
        }).toList();
      },
      items:
          items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item.value,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          selectedValue == item.value
                              ? selectedItemColor ?? Colors.white
                              : Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16.w),
                        if (item.icon != null) ...[
                          item.icon!,
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Padding(padding: EdgeInsets.only(top: 4.h),child:Text(
                            item.label,
                            style:
                                listItemStyle ??
                                TextStyle(
                                  color: AppColorSchemes.blackColor,
                                  fontFamily: AppFonts.degular,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  height: 1.0,
                                ),
                            overflow: TextOverflow.ellipsis,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
      validator: validator,
      onChanged: (value) {
        onChanged?.call(value);
      },
      onSaved: onSaved,
      buttonStyleData: ButtonStyleData(
        height: buttonHeight ?? 50.h,
        padding: iconPadding,
      ),
      iconStyleData: IconStyleData(
        icon:
            icon ??
            Icon(Icons.arrow_drop_down, color: iconColor ?? Colors.black45),
        iconSize: iconSize,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: dropdownWidth,
        maxHeight: dropdownMaxHeight,
        padding: EdgeInsets.zero, // Remove padding from view
        offset: Offset(0, -5),
      ),
      menuItemStyleData: MenuItemStyleData(padding: menuItemPadding),
    );
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.fill,
          image: AssetImage(ImageResource.gradientDropdownBgIc),
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: dropdownField,
    );
  }
}

// Helper class for creating dropdown items easily
class DropdownHelper {
  static List<DropdownItem> createItems(List<String> values) {
    return values
        .map((value) => DropdownItem(value: value, label: value))
        .toList();
  }

  static List<DropdownItem> createItemsWithIcons(
    List<String> values,
    List<Widget> icons,
  ) {
    assert(
      values.length == icons.length,
      'Values and icons lists must have the same length',
    );

    return List.generate(
      values.length,
      (index) => DropdownItem(
        value: values[index],
        label: values[index],
        icon: icons[index],
      ),
    );
  }

  static List<DropdownItem> createItemsWithCustomLabels(
    Map<String, String> valueToLabel,
  ) {
    return valueToLabel.entries
        .map((entry) => DropdownItem(value: entry.key, label: entry.value))
        .toList();
  }
}

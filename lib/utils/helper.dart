import 'package:elibrary/constants/colors.dart';
import 'package:flutter/material.dart';

Widget sText(String? word,
    {double size = 15,
    FontWeight weight = FontWeight.w400,
    Color color = ProjectColors.black,
    TextAlign align = TextAlign.left,
    int maxLines = 5,
    double? lHeight = 1.2,
    String family = 'Poppins',
    FontStyle style = FontStyle.normal,
    int shadow = 0}) {
  return Text(
    word ?? '...',
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: align,
    style: TextStyle(
      height: lHeight,
      fontStyle: style,
      color: color,
      fontFamily: family,
      fontSize: size,
      fontWeight: weight,
      shadows:
          shadow > 0 ? elevation(color: Colors.black38, elevation: shadow) : [],
    ),
  );
}

List<BoxShadow> elevation({required Color color, required int elevation}) {
  return [
    BoxShadow(
        color: color.withOpacity(0.6),
        offset: Offset(0.0, 4.0),
        blurRadius: 3.0 * elevation,
        spreadRadius: -1.0 * elevation),
    BoxShadow(
        color: color.withOpacity(0.44),
        offset: Offset(0.0, 1.0),
        blurRadius: 2.2 * elevation,
        spreadRadius: 1.5),
    BoxShadow(
        color: color.withOpacity(0.12),
        offset: Offset(0.0, 1.0),
        blurRadius: 4.6 * elevation,
        spreadRadius: 0.0),
  ];
}

Widget sOutlineButton({
  required Widget content,
  required Function onPressed,
  textColor = Colors.white,
  double z = 16,
  double radius = 5,
  int shadowStrength = 1,
  double borderWidth = 1,
  double height = 60,
  EdgeInsetsGeometry? padding,
  Color outlineColor = const Color(0xFFf2f2f2),
  Color backgroundColor = Colors.white,
  String family = 'ProximaRegular',
}) {
  return Container(
    height: height,
    decoration: shadowStrength > 0
        ? BoxDecoration(
            boxShadow: elevation(
                color: ProjectColors.black, elevation: shadowStrength),
            borderRadius: BorderRadius.circular(radius),
          )
        : BoxDecoration(borderRadius: BorderRadius.circular(radius)),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: outlineColor, width: borderWidth)),
      ),
      onPressed: () => onPressed(),
      child: content,
    ),
  );
}

TextStyle appStyle(
    {double size = 16,
    Color? color = ProjectColors.black,
    FontWeight weight = FontWeight.w400,
    TextAlign align = TextAlign.justify,
    String family = "Poppins"}) {
  return TextStyle(
    fontFamily: family,
    fontWeight: weight,
    fontSize: size,
    color: color,
  );
}

InputDecoration textDecor(
    {String hint = '',
    Widget? icon,
    String prefix = '',
    Widget? suffix,
    Widget? suffixIcon,
    bool enabled = true,
    Color? hintColor = ProjectColors.white,
    double hintSize = 16,
    bool showBorder = true,
    double radius = 4,
    String label = '',
    EdgeInsetsGeometry padding =
        const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0)}) {
  return InputDecoration(
    prefixIcon: icon,
    prefixText: prefix,
    suffix: suffix,
    suffixIcon: suffixIcon,
    hintText: hint,
    floatingLabelBehavior: (label.isNotEmpty && hint.isNotEmpty)
        ? FloatingLabelBehavior.never
        : FloatingLabelBehavior.auto,
    hintStyle: appStyle(size: hintSize, color: hintColor),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[100]!, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[100]!, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    labelText: label,
    labelStyle: appStyle(size: hintSize, color: hintColor),
    contentPadding: padding,
  );
}

InputDecoration textDecorNoBorder(
    {String? hint,
    String prefix = '',
    Widget? suffix,
    Widget? prefixIcon,
    bool enabled = true,
    double hintSize = 16,
    Color? hintColor,
    String labelText = '',
    String family = "Poppins",
    FontWeight hintWeight: FontWeight.normal,
    Color? fill,
    Color borderColor = Colors.black,
    double radius = 4,
    EdgeInsetsGeometry padding =
        const EdgeInsets.fromLTRB(20.0, 10, 20.0, 0)}) {
  return InputDecoration(
    prefixText: prefix,
    suffix: suffix,
    prefixIcon: prefixIcon,
    hintText: hint,
    labelText: labelText,
    hintStyle: appStyle(
      size: hintSize,
      color: hintColor,
      weight: hintWeight,
      family: family,
    ),
    alignLabelWithHint: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusColor: ProjectColors.white,
    enabled: enabled,
    labelStyle: appStyle(size: hintSize, color: hintColor),
    filled: true,
    fillColor: fill,
    contentPadding: padding,
  );
}

appWidth(context) {
  return MediaQuery.of(context).size.width;
}

appHeight(context) {
  return MediaQuery.of(context).size.height;
}

appSize(context) {
  return MediaQuery.of(context).size;
}

EdgeInsets noPadding() {
  return EdgeInsets.zero;
}

EdgeInsets appPadding(double size) {
  return EdgeInsets.all(size);
}

EdgeInsets appPaddingHorizontal(double size) {
  return EdgeInsets.symmetric(horizontal: size);
}

EdgeInsets appPaddingVertical(double size) {
  return EdgeInsets.symmetric(vertical: size);
}

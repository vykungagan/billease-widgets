import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/widgets.dart' as pw;

import '../extension/hex_color.dart';
import 'colors.dart';

///text styles

const TextStyle g12 = TextStyle(color: AppColors.accent);
const TextStyle hintStyle = TextStyle(color: AppColors.hintText);

const BorderRadius radius_20 = BorderRadius.all(Radius.circular(20));
const BorderRadius radius_15 = BorderRadius.all(Radius.circular(15));

class TextDecor {
  static final TextDecor _ui = TextDecor._internal();

  factory TextDecor() {
    return _ui;
  }

  TextDecor._internal();

  ///Search bar input text style
  TextStyle inputTextStyle() {
    return const TextStyle(
      color: AppColors.secondary,
      fontSize: 16,
    );
  }

  TextStyle buttonTextStyle() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w100, color: AppColors.accent);
  }

  TextStyle headerTextStyle() {
    return const TextStyle(
        fontSize: 25, fontWeight: FontWeight.w400, color: AppColors.secondary);
  }

  TextStyle homebuttonTextStyle() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondary);
  }

  TextStyle inputH1Light() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54);
  }

  TextStyle inputH1dark() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  }

  ///Chips text style
  TextStyle chipLabelStyle() {
    return const TextStyle(
        color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold);
  }

  ///Chips text style
  TextStyle chipLabelWhite() {
    return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  }

  ///Color full Text
  TextStyle setFonts(String font, String fontColor) {
    return GoogleFonts.getFont(font,
        textStyle: TextStyle(
            color: HexColor.fromHex(fontColor),
            fontSize: 50.0,
            fontWeight: FontWeight.bold));
  }
}

class Decor {
  static final Decor _ui = Decor._internal();

  factory Decor() {
    return _ui;
  }

  Decor._internal();

  ///Search bar input decoration
  InputDecoration inputDecor(String hint,
      {IconData prefix = Icons.search,
      String prefixString = '',
      bool showPrefix = false,
      IconData suffix = Icons.search,
      bool showSuffix = false}) {
    return InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        prefix: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(prefixString),
        ),
        prefixIcon: showPrefix == true
            ? Icon(
                prefix,
                size: 25,
                color: AppColors.secondary,
              )
            : null,
        suffixIcon: showSuffix == true
            ? Icon(
                suffix,
                size: 25,
                color: AppColors.secondary,
              )
            : null);
  }

  Divider dividerHorizontal() {
    return const Divider(
      height: 1,
      color: AppColors.main,
      thickness: 0.75,
      indent: 1,
      endIndent: 1,
    );
  }

  ///pinPut decoration
  BoxDecoration pinPutDecoration() {
    return BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.secondary));
  }

  BoxDecoration pinThemeSubmitDecoration() {
    return BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.secondary));
  }

  PinTheme pinThemeFollow() {
    return PinTheme(
        padding: const EdgeInsets.all(5),
        height: 55,
        width: 40,
        textStyle: const TextStyle(fontSize: 20.0, color: AppColors.secondary),
        decoration: pinPutDecoration());
  }

  PinTheme pinThemeError() {
    return PinTheme(
        padding: const EdgeInsets.all(5),
        height: 55,
        width: 40,
        textStyle: const TextStyle(fontSize: 20.0, color: AppColors.error),
        decoration: BoxDecoration(
            color: AppColors.error,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.error)));
  }

  PinTheme pinThemeSubmit() {
    return PinTheme(
        padding: const EdgeInsets.all(5),
        height: 55,
        width: 40,
        textStyle: const TextStyle(fontSize: 20.0, color: AppColors.main),
        decoration: pinThemeSubmitDecoration());
  }

  ///title decoration
  Widget titleDecor(String title,
      {double width = 260, bool isProfilePage = false}) {
    return SizedBox(
      width: width,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: isProfilePage
            ? TextDecor().inputH1dark()
            : TextDecor().inputH1Light(),
      ),
    );
  }

  ///sub title decoration
  Widget subTitleDecor(String subtitle) {
    return Text(
      subtitle,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: g12,
    );
  }

  ///Button decoration
  RoundedRectangleBorder buttonDecor() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }

  ///Chips decoration
  RoundedRectangleBorder chipsDecor() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)));
  }

  ///Comment Panel decoration
  RoundedRectangleBorder defaultDecor() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: Colors.grey.withOpacity(.1),
        width: 0.5,
      ),
    );
  }

  ///Color full Box
  BoxDecoration colorBoxDecor(String background) {
    return BoxDecoration(
      borderRadius: radius_20,
      color: HexColor.fromHex(background),
    );
  }

  //Input decoration
  BoxDecoration onlyBorder() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.secondary, width: 1));
  }

  //icon button decoration
  BoxDecoration iconButtonDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.secondary, width: 1),
        color: AppColors.secondary);
  }

  //Input decoration
  BoxDecoration onlyBorderError() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.error, width: 1));
  }

  //Button Decoration..
  BoxDecoration buttonDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondary,
        border: Border.all(color: AppColors.accent, width: 1));
  }
}

///All PDF decoration stored here
class PwDecor {
  static final PwDecor _ui = PwDecor._internal();

  factory PwDecor() {
    return _ui;
  }

  PwDecor._internal();

  static final colurBlue = colorToInt(46, 48, 142, 1);
  static final colurWhite = colorToInt(248, 244, 251, 1);

  //table border
  pw.TableBorder pwTableBorder() {
    return pw.TableBorder(
      verticalInside:
          pw.BorderSide(width: 0.20, color: PdfColors.black), // Vertical lines
      top: pw.BorderSide(width: 0.75, color: PdfColors.black), // No top border
      bottom: pw.BorderSide(
          width: 0.75, color: PdfColors.black), // No bottom border
      left:
          pw.BorderSide(width: 0.75, color: PdfColors.black), // No left border
      right:
          pw.BorderSide(width: 0.75, color: PdfColors.black), // No right border
      horizontalInside: pw.BorderSide(
          width: 0.20, color: PdfColors.black), // No horizontal lines
    );
  }

  ///table no border
  pw.TableBorder pwTableNoBorder() {
    return pw.TableBorder.symmetric(
        inside: pw.BorderSide.none, outside: pw.BorderSide.none);
  }

  pwDivider() {
    return pw.Divider(color: PdfColor.fromInt(colurBlue),thickness: 1);
  }

//table Cell
  pw.TextStyle tableCellTS(pw.Font fontRegular) {
    return pw.TextStyle(fontSize: 7, font: fontRegular);
  }

  //tableHeader
  pw.TextStyle tableHeaderTS([pw.Font? fontBold]) {
    // Load the custom font from assets
    return pw.TextStyle(
        fontSize: 8,
        fontWeight: pw.FontWeight.bold,
        font: fontBold);
  }

  //tableHeader
  pw.TextStyle headerTS([pw.Font? fontBold]) {
    // Load the custom font from assets
    return pw.TextStyle(
        fontSize: 8,
        fontWeight: pw.FontWeight.bold,
        font: fontBold,
        color: PdfColor.fromInt(colurBlue));
  }


  pw.Padding pwTableHeader(String title, pw.Font fontBold) {
    return pw.Padding(
        padding: pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: pw.Text(title, style: PwDecor().tableHeaderTS(fontBold)));
  }

  pwTableCell(String title, pw.Font fontRegular) {
    return pw.Padding(
        padding: pw.EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: pw.Text(title, style: PwDecor().tableCellTS(fontRegular)));
  }
}

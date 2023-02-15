import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text({
  required String text,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

Widget latoText({
  required String text,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.center,
    style: GoogleFonts.lato(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

Widget textBtn({
  required Color bgClr,
  required double? height,
  required Function() function,
  required String text,
  required Color color,
  double? width,
  double? radius,
}) {
  return TextButton(
    style: TextButton.styleFrom(
      fixedSize: Size(width ?? 300, height ?? 50),
      backgroundColor: bgClr,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
    ),
    onPressed: function,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: color,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget inputTextField({
  required String hintTxt,
  Color? textClr,
  TextEditingController? controller,
}) {
  return TextFormField(
    textInputAction: TextInputAction.next,
    validator: (value) {
      if (value != null && value.isEmpty) {
        return "Can't be empty";
      } else {
        return null;
      }
    },
    controller: controller,
    keyboardType: TextInputType.name,
    style: GoogleFonts.poppins(
      color: textClr ?? Colors.black,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFFe14c61),
        ),
      ),
      hintText: hintTxt,
      hintStyle: GoogleFonts.poppins(),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    ),
  );
}

Widget autoSizeTextV({
  required String text,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
  required int maxLines,
}) {
  return AutoSizeText(
    text,
    maxLines: maxLines,
    style: GoogleFonts.lato(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

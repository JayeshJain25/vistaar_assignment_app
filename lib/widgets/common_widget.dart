import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vistaar_assignment_app/model/movie_data.dart';

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

Widget movieCard(MovieData movieData) {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(
        color: Colors.grey,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                "https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkwNTgxMjkxNjk3NDQ4ODI4/marveldisney.jpg"),
          ),
          const SizedBox(
            height: 2,
          ),
          autoSizeTextV(
            text: movieData.title ?? "None",
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            maxLines: 2,
          ),
          const SizedBox(
            height: 12,
          ),
          text(
            text: "Release Date:",
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          text(
            text: "${movieData.month}, ${movieData.year}",
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 12,
          ),
          text(
            text: "Run Time:",
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          text(
            text: "${movieData.runtime.toString()} mins",
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    ),
  );
}

Widget filterContainer({required String textV, required bool value}) {
  return Container(
    width: 85,
    height: 35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        25,
      ),
      color: const Color(0xFFd9d9d9),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text(
          text: textV,
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        value
            ? const Icon(
                Icons.arrow_upward_outlined,
              )
            : const Icon(
                Icons.arrow_downward_outlined,
              )
      ],
    ),
  );
}

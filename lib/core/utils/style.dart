import 'package:flutter/cupertino.dart';


abstract class Styles {
  static const textStylemeduim = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const textStyleGT = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    // fontFamily: strings.fontname
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    // fontFamily: strings.fontname,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

const TextStyle textStyle = TextStyle();
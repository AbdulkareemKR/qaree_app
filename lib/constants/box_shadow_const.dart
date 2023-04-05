import 'package:Qaree/constants/colors_const.dart';
import 'package:flutter/material.dart';

class BoxShadowConst {
  static final allSidesBoxShadow = BoxShadow(
    color: ColorsConst.black.withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 6,
    offset: Offset(0, 4),
  );

  static final rightBottomBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(3, 3), // changes position of shadow
  );
}

import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  /// height in [Sizer]
  final double height;

  /// width in [Sizer]
  final double width;
  const LoadingContainer({
    Key? key,
    this.height = 7,
    this.width = 85,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(seconds: 1),
        baseColor: ColorsConst.disableGrey,
        highlightColor: Colors.grey.shade200,
        enabled: true,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadiusConst.smallBorderRadius,
          ),
        ));
  }
}

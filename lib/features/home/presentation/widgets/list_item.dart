import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/constants/spacing_const.dart';
import 'package:Naqaa/features/home/presentation/widgets/bounce.dart';
import 'package:Naqaa/utils/theme/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem extends StatelessWidget {
  final String name;
  final String svgPath;
  final Color color;

  const ListItem({
    super.key,
    required this.name,
    required this.svgPath,
    this.color = ColorsConst.dartGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 20.h),
        child: GestureDetector(
          child: Row(
            children: [
              SvgPicture.asset(svgPath),
              SpacingConst.hSpacing16,
              Text(name,
                  style: context.textThemes.bodyMedium
                      ?.copyWith(color: color, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:Naqaa/constants/border_radius_const.dart';
import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/constants/spacing_const.dart';
import 'package:Naqaa/features/home/presentation/widgets/list_item.dart';
import 'package:Naqaa/utils/theme/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Naqaa/features/home/presentation/widgets/bounce.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      color: ColorsConst.white,
      child: Column(
        children: [
          SpacingConst.vSpacing20,
          const ListItem(
            name: "Dashboard",
            svgPath: "assets/svg/home.svg",
          ),
          const ListItem(
            name: "Reports",
            svgPath: "assets/svg/reports.svg",
          ),
          const ListItem(
            name: "Calendar",
            svgPath: "assets/svg/calendar.svg",
          ),
          const ListItem(
            name: "Profile",
            svgPath: "assets/svg/profile.svg",
          ),
          SpacingConst.vSpacing40,
          SizedBox(
            width: 124.w,
            child: const Divider(
              color: ColorsConst.lightGrey,
            ),
          ),
          SpacingConst.vSpacing40,
          const ListItem(
            name: "Dark Mode",
            svgPath: "assets/svg/toggle.svg",
          ),
          const ListItem(
            name: "Settings",
            svgPath: "assets/svg/setting.svg",
          ),
          const ListItem(
            name: "Logout",
            svgPath: "assets/svg/logout.svg",
            color: ColorsConst.redOne,
          ),
          SpacingConst.vSpacing40,
          SizedBox(
            width: 124.w,
            child: const Divider(
              color: ColorsConst.lightGrey,
            ),
          ),
          SpacingConst.vSpacing40,
          Bounce(
            onTap: () {},
            child: Container(
              width: 166.w,
              height: 161.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsConst.gradientRedOne,
                    ColorsConst.gradientRedTwo,
                  ],
                ),
                borderRadius: BorderRadiusConst.mediumBorderRadius,
              ),
              child: Column(children: [
                SpacingConst.vSpacing20,
                const Image(
                  image: AssetImage('assets/images/pen_and_paper.png'),
                ),
                SpacingConst.vSpacing8,
                Text(
                  "Report",
                  style: context.textThemes.headlineMedium?.copyWith(
                    color: ColorsConst.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

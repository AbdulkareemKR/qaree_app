import 'package:Naqaa/constants/border_radius_const.dart';
import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/constants/spacing_const.dart';
import 'package:Naqaa/utils/theme/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Naqaa/features/home/presentation/widgets/bounce.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsConst.white,
      shadowColor: Colors.white,
      flexibleSpace: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            children: [
              Bounce(
                onTap: () {},
                child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              SpacingConst.hSpacing60,
              Bounce(
                onTap: () {
                  // TODO
                },
                child: Container(
                  width: 558.w,
                  height: 85,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorsConst.gradientGreenOne,
                        ColorsConst.gradientGreenTwo,
                      ],
                    ),
                    borderRadius: BorderRadiusConst.smallBorderRadius,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone_in_talk,
                          color: ColorsConst.white,
                          size: 60.w,
                        ),
                        SpacingConst.hSpacing120,
                        Text(
                          "Call Center",
                          style: context.textThemes.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SpacingConst.hSpacing60,
              // TODO: add messages numbers
              Bounce(
                  onTap: () {},
                  child: SvgPicture.asset("assets/svg/message.svg")),
              SpacingConst.hSpacing80,
              // TODO: add notifcations numbers
              Bounce(
                  onTap: () {},
                  child: SvgPicture.asset("assets/svg/notification.svg")),
              SpacingConst.hSpacing40,
              Bounce(
                onTap: () {},
                child: const Image(
                  image: AssetImage('assets/images/user_profile.png'),
                ),
              ),
              SpacingConst.hSpacing20,
              Text(
                "Truck Driver's Name",
                style: context.textThemes.titleMedium?.medium
                    .copyWith(color: ColorsConst.dartGrey),
              )
            ],
          ),
        ),
      ),
    );
  }
}

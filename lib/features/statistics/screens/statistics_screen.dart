import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/statistics/controllers/statistics_controller.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key});

  @override
  ConsumerState<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  late final StatisticsController _controller;

  @override
  void didChangeDependencies() {
    _controller = StatisticsController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);
    return user.when(
      data: (user) => Scaffold(
        backgroundColor: ColorsConst.lightGrey,
        appBar: AppBar(
          backgroundColor: ColorsConst.primaryBlack,
          title: Text(
            'Statistics',
            style: context.textThemes.displayMedium?.copyWith(
              fontFamily: "JosefinSans",
              color: ColorsConst.white,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SpacingConst.vSpacing16,
                ListView(
                  shrinkWrap: true,
                  children: [
                    SpacingConst.vSpacing20,
                    Text(
                      'Daily',
                      style: context.textThemes.displaySmall?.copyWith(
                        color: ColorsConst.darkGrey,
                      ),
                    ),
                    SpacingConst.vSpacing16,
                    StatisticsItem(
                      title: 'Pages Read',
                      value: '0',
                      average: '0',
                    ),
                    SpacingConst.vSpacing20,
                    StatisticsItem(
                      title: 'Pages Read',
                      value: '0',
                      average: '0',
                    ),
                    SpacingConst.vSpacing20,
                    StatisticsItem(
                      title: 'Pages Read',
                      value: '0',
                      average: '0',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}

class StatisticsItem extends StatelessWidget {
  final String title;
  final String value;
  final String average;

  const StatisticsItem({
    Key? key,
    required this.title,
    required this.value,
    required this.average,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161.h,
      decoration: BoxDecoration(
        color: ColorsConst.white,
        borderRadius: BorderRadiusConst.smallBorderRadius,
        boxShadow: [BoxShadowConst.allSidesBoxShadow],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textThemes.bodyMedium?.copyWith(
                    fontFamily: "JosefinSans",
                    color: ColorsConst.grey,
                  ),
                ),
                Icon(
                  Icons.timer,
                  size: 20.sp,
                )
              ],
            ),
            SpacingConst.vSpacing16,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: context.textThemes.displayLarge?.copyWith(
                      fontFamily: "JosefinSans",
                      color: ColorsConst.primaryBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 27.w,
                    lineWidth: 10.w,
                    animation: true,
                    percent: 0.7,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: ColorsConst.primaryBlack,
                    backgroundColor: ColorsConst.primaryPurple,
                  ),
                ],
              ),
            ),
            Divider(color: ColorsConst.grey, thickness: 0.5.sp),
            SpacingConst.vSpacing8,
            RichText(
              text: TextSpan(
                text: 'Avg: ',
                style: context.textThemes.titleMedium?.copyWith(
                  color: ColorsConst.primaryPurple,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: average,
                    style: context.textThemes.titleMedium?.copyWith(
                      color: ColorsConst.primaryBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

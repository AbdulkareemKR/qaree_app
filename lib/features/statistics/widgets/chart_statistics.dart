import 'dart:async';
import 'dart:developer';

import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/models/session/session.dart';
import 'package:Qaree/repos/reader_repo.dart';
import 'package:Qaree/repos/session_repo.dart';
import 'package:Qaree/services/date_time_services.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

List<Color> flutterColors = [
  Color(0xffF2BF09),
  Color(0xff602BF8),
  Color(0xff39A6A3),
  Color(0xffF83D60),
  Color(0xffF39C12),
  Color(0xffB33A3A),
  Color(0xff51B044),
  Color(0xffF53283),
  Color(0xff3E75FF),
  Color(0xffF158AF),
  Color(0xff1E8BC3),
  Color(0xffFF5E3A),
  Color(0xff31A166),
  Color(0xffF43E23),
  Color(0xff7356BF),
  Color(0xffFF9832),
  Color(0xff2FCC71),
  Color(0xffE84575),
  Color(0xff0076FF),
  Color(0xffFFC312),
  Color(0xff3BAAFF),
  Color(0xffFBBB1D),
  Color(0xff0EAC69),
  Color(0xffF64394),
  Color(0xff4388A6),
  Color(0xffFF4F00),
  Color(0xff27AE60),
  Color(0xffE12C80),
  Color(0xff14639A),
  Color(0xffFF8C00),
  Color(0xff1ABC9C),
];

final lineChartProvider = StateProvider<List<LineChartBarData>>((ref) {
  return [];
});

final maximumReadingTimeProvider = StateProvider.autoDispose<double>((ref) {
  return 1;
});

final totalReadingTimeProvider = StateProvider.autoDispose<double>((ref) {
  return 0;
});

final bestReaderProvider = StateProvider<String>((ref) {
  return "";
});

class _LineChart extends ConsumerStatefulWidget {
  @override
  ConsumerState<_LineChart> createState() => _LineChartState();
}

class _LineChartState extends ConsumerState<_LineChart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: ref.watch(lineChartProvider),
        minX: 0,
        maxX: 7, // number of days in the week (index 0 is the first day)
        maxY: ref.watch(maximumReadingTimeProvider).toDouble(),
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double yAxisStep, TitleMeta meta) {
    yAxisStep = yAxisStep == 0
        ? 0
        : yAxisStep / (ref.watch(maximumReadingTimeProvider).toDouble() / 4);
    final maxReadingTime = ref.watch(maximumReadingTimeProvider).toDouble();
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    double yAxisValue;
    switch ((yAxisStep).toInt()) {
      case 1:
        yAxisValue = 1 / 4 * maxReadingTime;
        break;
      case 2:
        yAxisValue = 1 / 2 * maxReadingTime;
        break;
      case 3:
        yAxisValue = 3 / 4 * maxReadingTime;
        break;
      case 4:
        yAxisValue = maxReadingTime;
        break;
      default:
        return Container();
    }

    return Text(DateTimeServices.LettersTimerFormatter(yAxisValue.round()),
        style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: ref.watch(maximumReadingTimeProvider).toDouble() / 4,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('');
        break;
      case 1:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Tue', style: style);
        break;
      case 4:
        text = const Text('Wed', style: style);
        break;
      case 5:
        text = const Text('Tha', style: style);
        break;
      case 6:
        text = const Text('Fri', style: style);
        break;
      case 7:
        text = const Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1, // 1 day
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
        horizontalInterval:
            ref.watch(maximumReadingTimeProvider).toDouble() / 4,
        verticalInterval: 1,
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
        border: Border(
          bottom: const BorderSide(color: Colors.grey),
          left: const BorderSide(color: Colors.grey),
          right: const BorderSide(color: Colors.grey),
          top: const BorderSide(color: Colors.grey),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Color(0xffF2BF09),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Color(0xff602BF8),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.cyan,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(12, 2.5),
        ],
      );
}

class GroupStatisticsScreen extends ConsumerStatefulWidget {
  final String userId;

  const GroupStatisticsScreen({super.key, required this.userId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ChartsStatistics();
}

class ChartsStatistics extends ConsumerState<GroupStatisticsScreen> {
  void createChartData(String userId) {
    final lineChartProviderState = ref.read(lineChartProvider.notifier).state;
    double totalRadingTime = 0;
    double maxReadingTime = 0;

    int index = 0;

    final sessionStream =
        ref.watch(SessionRepo.getWeeksSessionByUserIdProvider(userId).stream);

    StreamSubscription<List<Session>> _sessionSubscription =
        sessionStream.listen((memberSessions) {
      double memberReadingTime = 0;
      List<FlSpot> flSpotSessions = [];

      DateTime today = DateTime.now();
      DateTime startOfWeek = today.subtract(Duration(days: today.weekday % 7));

      // If today is Sunday, start a new week with today's date as the first day
      if (startOfWeek.weekday == DateTime.sunday) {
        startOfWeek = today;
      }

      for (DateTime date = startOfWeek;
          date.isBefore(today.add(Duration(days: 1)));
          date = date.add(Duration(days: 1))) {
        int totalReadingTimeForDay = 0;

        final DaySessions = memberSessions.where((session) {
          return session.startDate!.day == date.day &&
              session.startDate!.month == date.month &&
              session.startDate!.year == date.year;
        });

        DaySessions.forEach((session) {
          totalReadingTimeForDay += session.totalReadingTime!;
        });

        memberReadingTime += totalReadingTimeForDay.toDouble();
        totalRadingTime += totalReadingTimeForDay.toDouble();
        flSpotSessions.add(FlSpot(
          (date.weekday % 7 + 1).toDouble(),
          totalReadingTimeForDay.toDouble(),
        ));
      }

      if (memberReadingTime > maxReadingTime) {
        maxReadingTime = memberReadingTime;
        ref.read(bestReaderProvider.notifier).state = userId;
      }

      if (flSpotSessions.isNotEmpty) {
        ref.read(lineChartProvider.notifier).state =
            ref.read(lineChartProvider) +
                [
                  LineChartBarData(
                    show: true,
                    isCurved: true,
                    color: flutterColors[index],
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: true),
                    spots: flSpotSessions,
                  ),
                ];
      }
      index++;
      // Print the maximum reading time among all members
      log('Max Reading Time: $maxReadingTime');
      log('Total Reading Time: $totalRadingTime');
      ref.read(maximumReadingTimeProvider.notifier).state = maxReadingTime;
      ref.read(totalReadingTimeProvider.notifier).state = totalRadingTime;
    }, onError: (error, stackTrace) {
      // Handle error if needed
    });
  }

  @override
  void initState() {
    super.initState();
    // createChartData(widget.groupMembers);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createChartData(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          SpacingConst.vSpacing16,
          Container(
            decoration: BoxDecoration(
              color: ColorsConst.white,
              boxShadow: [BoxShadowConst.allSidesBoxShadow],
              borderRadius: BorderRadiusConst.smallBorderRadius,
            ),
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateTimeServices.LettersTimerFormatter(
                                ref.watch(totalReadingTimeProvider).toInt()),
                            style: context.textThemes.displayMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorsConst.darkGrey,
                            ),
                          ),
                          Text(
                            'Total Reading Time',
                            style: context.textThemes.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorsConst.primaryPurple,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.timer,
                        size: 30.sp,
                      )
                    ],
                  ),
                  SpacingConst.vSpacing20,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) =>
                              SpacingConst.vSpacing8,
                          shrinkWrap: true,
                          itemCount: widget.userId?.length ?? 0,
                          itemBuilder: (context, index) {
                            final memberId = widget.userId![index];
                            return ref
                                .watch(ReaderRepo.getUserByIdProvider(memberId))
                                .when(
                                  data: (reader) => Indicator(
                                    color: flutterColors[index],
                                    text: reader?.name ?? "Unknown",
                                    isSquare: true,
                                  ),
                                  error: (error, stackTrace) => Indicator(
                                    color: flutterColors[index],
                                    text: "Unknown",
                                    isSquare: true,
                                  ),
                                  loading: () => LoadingContainer(
                                    width: 10.w,
                                    height: 20.h,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                  SpacingConst.vSpacing30,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, left: 6),
                      child: _LineChart(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SpacingConst.vSpacing30,
          InfoItem(
            title: 'Best Reader',
            value: ref
                .watch(ReaderRepo.getUserByIdProvider(
                    ref.watch(bestReaderProvider)))
                .when(
                  data: (reader) => reader?.name ?? "Unknown",
                  error: ((error, stackTrace) => "Unknown"),
                  loading: () => "",
                ),
            average: DateTimeServices.LettersTimerFormatter(
                ref.watch(maximumReadingTimeProvider).toInt()),
            icon: Icons.timer,
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        )
      ],
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final String average;
  final IconData icon;

  const InfoItem({
    Key? key,
    required this.title,
    required this.value,
    required this.average,
    required this.icon,
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
                  icon,
                  size: 20.sp,
                )
              ],
            ),
            SpacingConst.vSpacing16,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: context.textThemes.headlineLarge?.copyWith(
                      fontFamily: "JosefinSans",
                      color: ColorsConst.primaryBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircularPercentIndicator(
                    restartAnimation: true,
                    animation: true,
                    animationDuration: 2000,
                    radius: 27.w,
                    lineWidth: 10.w,
                    percent: 0.3,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: ColorsConst.primaryPurple,
                    backgroundColor: ColorsConst.primaryBlack,
                  ),
                ],
              ),
            ),
            Divider(color: ColorsConst.grey, thickness: 0.5.sp),
            SpacingConst.vSpacing8,
            RichText(
              text: TextSpan(
                text: 'Total: ',
                style: context.textThemes.titleMedium?.copyWith(
                  color: ColorsConst.primaryPurple,
                  fontWeight: FontWeight.w800,
                ),
                children: [
                  TextSpan(
                    text: average,
                    style: context.textThemes.titleMedium?.copyWith(
                      color: ColorsConst.primaryBlack,
                      fontWeight: FontWeight.w800,
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

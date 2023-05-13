import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/statistics/screens/statistics_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

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
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 12,
        maxY: 4,
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

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1h';
        break;
      case 2:
        text = '2h';
        break;
      case 3:
        text = '3h';
        break;
      case 4:
        text = '5h';
        break;
      case 5:
        text = '6h';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 20,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 4:
        text = const Text('Tue', style: style);
        break;
      case 6:
        text = const Text('Wed', style: style);
        break;
      case 8:
        text = const Text('Tha', style: style);
        break;
      case 10:
        text = const Text('Fri', style: style);
        break;
      case 12:
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
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
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

class GroupStatisticsScreen extends StatefulWidget {
  const GroupStatisticsScreen({super.key});

  @override
  State<StatefulWidget> createState() => GroupStatisticsScreenState();
}

class GroupStatisticsScreenState extends State<GroupStatisticsScreen> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
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
                            '15h 53m',
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
                        Indicator(
                          color: Color(0xff602BF8),
                          text: 'Abdulkareem Alramlawi',
                          isSquare: true,
                        ),
                        SpacingConst.vSpacing8,
                        Indicator(
                          color: Color(0xffF2BF09),
                          text: 'Bashar Alhayes',
                          isSquare: true,
                        ),
                        SpacingConst.vSpacing8,
                        Indicator(
                          color: Colors.cyan,
                          text: 'Ali Abu Rub',
                          isSquare: true,
                        ),
                      ],
                    ),
                  ),
                  SpacingConst.vSpacing30,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, left: 6),
                      child: _LineChart(isShowingMainData: isShowingMainData),
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
            value: "Ahmed",
            average: "1h 34m - day",
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

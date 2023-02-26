import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../constants/border_radius_const.dart';
import '../../constants/colors_const.dart';
import '../../constants/fonts_const.dart';
import '../../constants/spacing_const.dart';

class ReadingSession extends StatefulWidget {
  const ReadingSession({super.key});

  @override
  State<ReadingSession> createState() => _ReadingSessionState();
}

class _ReadingSessionState extends State<ReadingSession> {
  void Pause() {}
  void Done() {}

  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';

      started = false;
    });
  }

  void addLaps() {
    String lap = '$digitHours:$digitMinutes:$digitSeconds';
    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? '$seconds' : '0$seconds';
        digitMinutes = (minutes >= 10) ? '$minutes' : '0$minutes';
        digitHours = (hours >= 10) ? '$hours' : '0$hours';
      });
    });
  }

  @override
  void initState() {
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpacingConst.vSpacing6,
          Center(
            child: Text(
              'Reading Session',
              style: TextStyle(
                color: Color(0xFF4D506C),
                fontFamily: FontConst.fontFamily,
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: 200.6.w,
                  height: 250.02.h,
                  decoration: BoxDecoration(
                    color: ColorsConst.lightGrey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(360),
                      bottomRight: Radius.circular(360),
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SpacingConst.vSpacing40,
                      SpacingConst.hSpacing16,
                      Image.asset('assets/images/book.png'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacingConst.vSpacing40,
                      Row(
                        children: [
                          SpacingConst.hSpacing16,
                          Text(
                            'The Midnight Library',
                            style: TextStyle(
                              fontFamily: FontConst.fontFamily,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: ColorsConst.primaryBlack,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SpacingConst.hSpacing16,
                          Text(
                            'Matt Haig',
                            style: TextStyle(
                              fontFamily: FontConst.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                              color: Color(0xFF9D9D9D),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SpacingConst.hSpacing120,
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 14.0,
                            percent: 0.25,
                            center: new Text(
                              "30%",
                              style: TextStyle(
                                color: Color(0xFF4D506C),
                              ),
                            ),
                            progressColor: Color(0xFF685BFB),
                            backgroundColor: Color(0xFF333333),
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF685BFB),
                borderRadius: BorderRadiusConst.smallBorderRadius,
              ),
              width: 252.h,
              height: 61.w,
              child: Center(
                child: Text(
                  '$digitHours:$digitMinutes:$digitSeconds',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontFamily: FontConst.fontFamily,
                    fontSize: 38,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 129.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: ColorsConst.primaryBlack,
                  borderRadius: BorderRadiusConst.verySmallBorderRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SpacingConst.hSpacing6,
                        SvgPicture.asset('assets/svg/iconAlternateFeather.svg'),
                        SpacingConst.hSpacing6,
                        Text(
                          'Take Notes',
                          style: TextStyle(
                            color: ColorsConst.white,
                            fontFamily: FontConst.fontFamily,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  (!started) ? start() : stop();
                },
                child: Container(
                  width: 94.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: ColorsConst.primaryBlack,
                  ),
                  child: Center(
                    child: Text(
                      (!started) ? 'Resume' : 'Pause',
                      style: TextStyle(
                        color: ColorsConst.white,
                        fontFamily: FontConst.fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: Done,
                child: Container(
                  width: 94.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: ColorsConst.primaryPurple,
                  ),
                  child: Center(
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: ColorsConst.white,
                        fontFamily: FontConst.fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

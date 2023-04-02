import 'dart:async';
import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/fonts_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/reading_session/controllers/reading_session_controller.dart';
import 'package:Qaree/features/reading_session/providers/reading_session_providers.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class ReadingSessionScreen extends ConsumerStatefulWidget {
  final Book book;
  const ReadingSessionScreen({required this.book, super.key});

  @override
  ConsumerState<ReadingSessionScreen> createState() => _ReadingSessionState();
}

class _ReadingSessionState extends ConsumerState<ReadingSessionScreen> {
  late final ReadingSessionController _controller;

  @override
  void didChangeDependencies() {
    _controller = ReadingSessionController(context: context, ref: ref);
    super.didChangeDependencies();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      appBar: CustomAppBar(context: context, title: 'Reading Session'),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpacingConst.vSpacing40,
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 40.h,
                  bottom: 40.h,
                  right: 55.w,
                ),
                width: 200.6.w,
                height: 250.02.h,
                decoration: BoxDecoration(
                  color: ColorsConst.lightGrey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(360),
                    bottomRight: Radius.circular(360),
                  ),
                ),
                child: BookImage(
                  book: widget.book,
                ),
              ),
              SizedBox(
                width: 210.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacingConst.vSpacing40,
                    Text(
                      widget.book.name ?? 'unknown',
                      style: context.textThemes.titleMedium?.copyWith(
                        fontFamily: FontConst.mainFontFamily,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.book.authors?.first ?? 'unknown',
                      style: context.textThemes.bodyMedium?.copyWith(
                        fontFamily: FontConst.mainFontFamily,
                        fontWeight: FontWeight.w300,
                        color: ColorsConst.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SpacingConst.vSpacing16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 16.0,
                          percent: 0.25,
                          center: new Text(
                            "30%",
                            style: TextStyle(
                              color: Color(0xFF4D506C),
                            ),
                          ),
                          progressColor: ColorsConst.primaryPurple,
                          backgroundColor: ColorsConst.primaryBlack,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        SpacingConst.hSpacing20,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SpacingConst.vSpacing40,
          Consumer(builder: (context, ref, child) {
            final readingTimeSeconds = ref.watch(readingTimeProvider);
            return Container(
              decoration: BoxDecoration(
                color: ColorsConst.primaryPurple,
                borderRadius: BorderRadiusConst.smallBorderRadius,
              ),
              width: 252.h,
              height: 61.w,
              child: Center(
                child: Text(
                  _controller.formatTimer(readingTimeSeconds),
                  style: TextStyle(
                    color: ColorsConst.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontConst.mainFontFamily,
                    fontSize: 38,
                  ),
                ),
              ),
            );
          }),
          SpacingConst.vSpacing40,
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 129.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: ColorsConst.primaryBlack,
                  borderRadius: BorderRadiusConst.smallBorderRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SpacingConst.hSpacing6,
                        Icon(
                          CupertinoIcons.pen,
                          size: 22.sp,
                          color: ColorsConst.white,
                        ),
                        SpacingConst.hSpacing8,
                        Text(
                          'Take Notes',
                          style: TextStyle(
                            color: ColorsConst.white,
                            fontFamily: FontConst.mainFontFamily,
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
          SpacingConst.vSpacing40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.start();
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
                        fontFamily: FontConst.mainFontFamily,
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
                        fontFamily: FontConst.mainFontFamily,
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

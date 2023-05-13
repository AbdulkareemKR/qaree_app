import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/fonts_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/reading_session/controllers/reading_session_controller.dart';
import 'package:Qaree/features/reading_session/providers/reading_session_providers.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/services/date_time_services.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
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

  @override
  Widget build(BuildContext context) {
    final isTakingNotes =
        ref.watch(ReadingSessionProviders.isTakingNotesProvider);

    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      appBar: CustomAppBar(context: context, title: 'Reading Session'),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpacingConst.vSpacing20,
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
                          animation: true,
                          animationDuration: 2000,
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
            final readingTimeSeconds =
                ref.watch(ReadingSessionProviders.readingTimeSecondsProvider);
            return Container(
              decoration: BoxDecoration(
                color: ColorsConst.primaryPurple,
                borderRadius: BorderRadiusConst.smallBorderRadius,
              ),
              width: 252.h,
              height: 61.w,
              child: Center(
                child: Text(
                  DateTimeServices.digitalTimerFormatter(readingTimeSeconds),
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
          isTakingNotes
              ? Column(
                  children: [
                    SizedBox(
                      width: 350.w,
                      height: 160.h,
                      child: TextField(
                        controller: _controller.notesController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadiusConst.smallBorderRadius,
                            borderSide: BorderSide(
                                width: 1, color: ColorsConst.lightGrey),
                          ),
                          hintText: "write Down your thoughts",
                          hintStyle: context.textThemes.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: ColorsConst.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadiusConst.smallBorderRadius,
                            borderSide: BorderSide(
                                width: 1, color: ColorsConst.primaryPurple),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadiusConst.smallBorderRadius,
                            borderSide: BorderSide(
                                width: 1, color: ColorsConst.lightGrey),
                          ),
                          fillColor: ColorsConst.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          width: 110.w,
                          height: 50.h,
                          label: "Cancel",
                          onPressed: _controller.onCancelNotePressed,
                          color: ColorsConst.primaryBlack,
                          textStyle: context.textThemes.bodyMedium?.copyWith(
                            color: ColorsConst.white,
                          ),
                        ),
                        CustomButton(
                          width: 110.w,
                          height: 50.h,
                          label: "Save",
                          onPressed: () async => await _controller
                              .onSaveNotePressed(widget.book.id!),
                          style: CustomButtonStyle.primary,
                          textStyle: context.textThemes.bodyMedium?.copyWith(
                            color: ColorsConst.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : BounceAnimation(
                  onTap: _controller.onTakeNotesPressed,
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
          !isTakingNotes
              ? Column(
                  children: [
                    SpacingConst.vSpacing40,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BounceAnimation(
                          onTap: _controller.onTimerButtonTap,
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
                                _controller.getTimerButtonText(),
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
                        BounceAnimation(
                          onTap: () async =>
                              await _controller.onStopTap(widget.book.id!),
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
                )
              : SizedBox.shrink(),
        ],
      )),
    );
  }
}

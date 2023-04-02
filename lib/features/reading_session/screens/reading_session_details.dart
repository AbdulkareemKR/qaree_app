import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_size.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../constants/border_radius_const.dart';
import '../../../constants/colors_const.dart';
import '../../../constants/fonts_const.dart';
import '../../../constants/spacing_const.dart';

class ReadingSessionDetails extends StatefulWidget {
  const ReadingSessionDetails({super.key});

  @override
  State<ReadingSessionDetails> createState() => _ReadingSessionDetailsState();
}

class _ReadingSessionDetailsState extends State<ReadingSessionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpacingConst.vSpacing6,
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacingConst.hSpacing16,
                Icon(Icons.arrow_back_outlined),
                SpacingConst.hSpacing16,
                Text(
                  'Reading Session',
                  style: TextStyle(
                    color: Color(0xFF4D506C),
                    fontFamily: FontConst.mainFontFamily,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: 200.6.w,
                  height: 250.02.h,
                  decoration: BoxDecoration(
                    color: ColorsConst.veryLightGrey,
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
                  SpacingConst.hSpacing16,
                  Column(
                    children: [
                      SpacingConst.vSpacing40,
                      Image.asset('assets/images/book.png'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacingConst.vSpacing40,
                      Row(
                        children: [
                          SpacingConst.hSpacing8,
                          Text(
                            'The Midnight Library',
                            style: TextStyle(
                              fontFamily: FontConst.mainFontFamily,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: ColorsConst.primaryBlack,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SpacingConst.hSpacing8,
                          Text(
                            'Matt Haig',
                            style: TextStyle(
                              fontFamily: FontConst.mainFontFamily,
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
          Row(
            children: [
              SpacingConst.hSpacing16,
              Text(
                'Pages',
                style: TextStyle(
                  color: ColorsConst.primaryBlack,
                  fontFamily: FontConst.mainFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorsConst.white,
                  borderRadius: BorderRadiusConst.verySmallBorderRadius,
                ),
                width: 88.w,
                height: 30.h,
                child: DropdownButton(
                  underline: SizedBox(),
                  items: const [],
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'From',
                      style: TextStyle(
                        fontFamily: FontConst.mainFontFamily,
                        fontWeight: FontWeight.w400,
                        color: ColorsConst.veryLightGrey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onChanged: (ss) {},
                ),
              ),
              SpacingConst.hSpacing40,
              Text(
                '-',
                style: TextStyle(
                  fontFamily: FontConst.mainFontFamily,
                  fontWeight: FontWeight.w900,
                  color: ColorsConst.veryLightGrey,
                  fontSize: 20,
                ),
              ),
              SpacingConst.hSpacing40,
              Container(
                width: 88.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: ColorsConst.white,
                  borderRadius: BorderRadiusConst.verySmallBorderRadius,
                ),
                child: DropdownButton(
                  underline: SizedBox(),
                  items: const [],
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'To',
                      style: TextStyle(
                        fontFamily: FontConst.mainFontFamily,
                        fontWeight: FontWeight.w400,
                        color: ColorsConst.veryLightGrey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onChanged: (ss) {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              SpacingConst.hSpacing16,
              Text(
                'Note',
                style: TextStyle(
                  color: ColorsConst.primaryBlack,
                  fontFamily: FontConst.mainFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 335.w,
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusConst.verySmallBorderRadius,
                  color: ColorsConst.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9091A0),
                        fontFamily: FontConst.mainFontFamily,
                      ),
                      hintText: 'Write Down Your Thoughts'),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                onPressed: () {},
                label: 'Cancel',
                size: ButtonSize.small,
                textStyle: context.textThemes.bodyMedium?.copyWith(
                  color: ColorsConst.white,
                ),
              ),
              CustomButton(
                onPressed: () {},
                label: 'Save',
                size: ButtonSize.small,
                style: CustomButtonStyle.primary,
                textStyle: context.textThemes.bodyMedium?.copyWith(
                  color: ColorsConst.white,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

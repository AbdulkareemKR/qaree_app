import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/fonts_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/reading_session/controllers/reading_session_controller.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class AddNoteScreen extends ConsumerStatefulWidget {
  final Book book;
  const AddNoteScreen({required this.book, super.key});

  @override
  ConsumerState<AddNoteScreen> createState() => _ReadingSessionState();
}

class _ReadingSessionState extends ConsumerState<AddNoteScreen> {
  late final ReadingSessionController _controller;

  @override
  void didChangeDependencies() {
    _controller = ReadingSessionController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      appBar: CustomAppBar(context: context, title: 'Note'),
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
                  ],
                ),
              ),
            ],
          ),
          SpacingConst.vSpacing40,
          Column(
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
                      borderSide:
                          BorderSide(width: 1, color: ColorsConst.lightGrey),
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
                      borderSide:
                          BorderSide(width: 1, color: ColorsConst.lightGrey),
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
                    onPressed: _controller.popScreen,
                    color: ColorsConst.primaryBlack,
                    textStyle: context.textThemes.bodyMedium?.copyWith(
                      color: ColorsConst.white,
                    ),
                  ),
                  CustomButton(
                    width: 110.w,
                    height: 50.h,
                    label: "Save",
                    onPressed: () async =>
                        await _controller.onSaveAndPop(widget.book.id!),
                    style: CustomButtonStyle.primary,
                    textStyle: context.textThemes.bodyMedium?.copyWith(
                      color: ColorsConst.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}

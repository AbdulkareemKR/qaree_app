import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/groups/controllers/groups_controller.dart';
import 'package:Qaree/models/group_book/group_book.dart';
import 'package:Qaree/repos/book_repo.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupBooksScreen extends ConsumerStatefulWidget {
  final List<GroupBook>? groupBook;
  const GroupBooksScreen({required this.groupBook, super.key});

  @override
  ConsumerState<GroupBooksScreen> createState() => _GroupBooksScreenState();
}

class _GroupBooksScreenState extends ConsumerState<GroupBooksScreen> {
  late final GroupsScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = GroupsScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      body: Column(
        children: [
          SpacingConst.vSpacing20,
          ListView.separated(
            separatorBuilder: (context, index) => SpacingConst.vSpacing20,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.groupBook?.length ?? 0,
            itemBuilder: (context, index) {
              return Consumer(
                builder: ((context, ref, child) => ref
                    .watch(BookRepo.getBookByIdProvider(
                        widget.groupBook![index].bookId))
                    .when(
                      data: (book) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.w),
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        width: 370.w,
                        height: 206.h,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadowConst.rightBottomBoxShadow],
                          color: ColorsConst.veryLightGrey,
                          borderRadius: BorderRadiusConst.mediumBorderRadius,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 113.0,
                              height: 168.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadowConst.rightBottomBoxShadow
                                ],
                              ),
                              child: book?.image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadiusConst
                                          .verySmallBorderRadius,
                                      child: Image.network(
                                        book!.image!,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Text(book?.name ?? "Unknown"),
                            ),
                            SpacingConst.hSpacing20,
                            Container(
                              width: 170.w,
                              child: Column(
                                children: [
                                  SpacingConst.vSpacing30,
                                  Text(
                                    book?.name ?? "Unknown",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style:
                                        context.textThemes.titleSmall?.copyWith(
                                      fontFamily: "JosefinSans",
                                      color: ColorsConst.darkGrey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SpacingConst.vSpacing16,
                                  Text(
                                    book?.description ?? "Unknown",
                                    style:
                                        context.textThemes.bodyMedium?.copyWith(
                                      fontFamily: "JosefinSans",
                                      color: ColorsConst.grey,
                                    ),
                                    maxLines: 7,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SpacingConst.vSpacing16,
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      error: (error, stack) => Text("An Error Ocurred"),
                      loading: () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: LoadingContainer(
                          width: 180.w,
                          height: 270.h,
                        ),
                      ),
                    )),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: ColorsConst.primaryPurple,
            foregroundColor: Colors.white,
            splashColor: Colors.yellow,
            onPressed: _controller.onAddGroupBookPressed,
            child: Icon(Icons.add),
          ),
          SpacingConst.vSpacing40,
        ],
      ),
    );
  }
}

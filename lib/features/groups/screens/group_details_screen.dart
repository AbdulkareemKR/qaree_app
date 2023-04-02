import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/groups/controllers/groups_controller.dart';
import 'package:Qaree/features/groups/screens/group_books_screen.dart';
import 'package:Qaree/features/groups/screens/group_messages_screen.dart';
import 'package:Qaree/features/groups/screens/group_statistics_screen.dart';
import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupDetailsScreen extends ConsumerStatefulWidget {
  final Group? group;
  const GroupDetailsScreen({required this.group, super.key});

  @override
  ConsumerState<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends ConsumerState<GroupDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final GroupsScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = GroupsScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);
    return user.when(
      data: (user) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: ColorsConst.veryLightGrey,
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            backgroundColor: ColorsConst.primaryBlack,
            bottom: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              indicator: BoxDecoration(
                borderRadius:
                    BorderRadiusConst.smallBorderRadius, // Creates border
                color: ColorsConst.primaryPurple,
              ),
              tabs: [
                Tab(text: "Messages"),
                Tab(text: "Statistics"),
                Tab(text: "Books"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GroupMessagesScreen(messages: widget.group?.messages),
              GroupStatisticsScreen(),
              GroupBooksScreen(groupBook: widget.group?.groupBooks),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}

class GroupItem extends StatelessWidget {
  final String name;
  final String members;

  const GroupItem({
    Key? key,
    required this.name,
    required this.members,
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
                  'Pages Read',
                  style: context.textThemes.bodyMedium?.copyWith(
                    fontFamily: "JosefinSans",
                    color: ColorsConst.grey,
                  ),
                ),
                Icon(
                  Icons.group,
                  size: 20.sp,
                )
              ],
            ),
            SpacingConst.vSpacing16,
            Text(
              name,
              style: context.textThemes.displayMedium?.copyWith(
                fontFamily: "JosefinSans",
                color: ColorsConst.primaryBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: ColorsConst.grey, thickness: 0.5.sp),
            SpacingConst.vSpacing8,
            RichText(
              text: TextSpan(
                text: 'Members: ',
                style: context.textThemes.bodyMedium?.copyWith(
                  color: ColorsConst.primaryPurple,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: members,
                    style: context.textThemes.bodyMedium?.copyWith(
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

import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/groups/controllers/groups_controller.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/group_repo.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupsScreen extends ConsumerStatefulWidget {
  const GroupsScreen({super.key});

  @override
  ConsumerState<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends ConsumerState<GroupsScreen> {
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
      data: (user) => Scaffold(
        backgroundColor: ColorsConst.lightGrey,
        appBar: AppBar(
          backgroundColor: ColorsConst.primaryBlack,
          title: Text(
            'Groups',
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
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SpacingConst.vSpacing8,
                  itemCount: user.groups?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Consumer(
                      builder: (context, ref, child) {
                        final group = ref.watch(GroupRepo.getGroupByIdProvider(
                            user.groups![index]));
                        return group.when(
                            data: (group) => GroupItem(
                                name: group?.name,
                                members: group?.members?.length),
                            error: (error, stack) => Text("An error Occurred"),
                            loading: () => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.h),
                                  child: LoadingContainer(height: 161.h),
                                ));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Text("An error Occurred"),
      loading: () => LoadingContainer(),
    );
  }
}

class GroupItem extends StatelessWidget {
  final String? name;
  final int? members;

  const GroupItem({
    Key? key,
    this.name,
    this.members,
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
              name ?? "",
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
                    text: members.toString(),
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

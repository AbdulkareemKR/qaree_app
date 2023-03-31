import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/groups/controllers/groups_controller.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupMessagesScreen extends ConsumerStatefulWidget {
  final List<String>? messages;
  const GroupMessagesScreen({required this.messages, super.key});

  @override
  ConsumerState<GroupMessagesScreen> createState() =>
      _GroupMessagesScreenState();
}

class _GroupMessagesScreenState extends ConsumerState<GroupMessagesScreen> {
  late final GroupsScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = GroupsScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingConst.vSpacing20,
        ListView.separated(
            shrinkWrap: true,
            itemCount: widget.messages?.length ?? 0,
            separatorBuilder: ((context, index) => SpacingConst.vSpacing20),
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: ColorsConst.lightPurple.withOpacity(0.80),
                    borderRadius: BorderRadiusConst.smallBorderRadius,
                    boxShadow: [BoxShadowConst.allSidesBoxShadow],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Text(
                      widget.messages![index],
                      style: context.textThemes.bodyMedium?.copyWith(
                        fontFamily: "JosefinSans",
                        color: ColorsConst.primaryBlack,
                      ),
                    ),
                  ),
                )),
      ],
    );
  }
}

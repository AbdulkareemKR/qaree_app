import 'package:Qaree/features/groups/screens/group_details_screen.dart';
import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupsScreenController {
  BuildContext context;
  WidgetRef ref;

  GroupsScreenController({
    required this.context,
    required this.ref,
  });

  void onGroupCardTap(Group? group) {
    EasyNavigator.openPage(
        context: context, page: GroupDetailsScreen(group: group));
  }
}

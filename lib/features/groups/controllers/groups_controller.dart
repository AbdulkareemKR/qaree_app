import 'package:Qaree/features/book_search/screens/book_search_screen.dart';
import 'package:Qaree/features/groups/groups_providers/groups_provider.dart';
import 'package:Qaree/features/groups/screens/create_group_screen.dart';
import 'package:Qaree/features/groups/screens/group_details_screen.dart';
import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/group_repo.dart';
import 'package:Qaree/repos/reader_repo.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class GroupsScreenController {
  BuildContext context;
  WidgetRef ref;

  GroupsScreenController({
    required this.context,
    required this.ref,
  });

  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupDescriptionController = TextEditingController();

  void onGroupCardTap(Group? group) {
    ref.read(currentGroupIdProvider.notifier).state = group!.id;

    EasyNavigator.openPage(
      context: context,
      page: GroupDetailsScreen(group: group),
      isBottomSheet: true,
    );
  }

  void onCreateGroupTap() {
    EasyNavigator.openPage(
      context: context,
      page: CreateGroupScreen(),
    );
  }

  Future<void> createGroup() async {
    final user = await ref.read(readerProvider.future);
    final groupId = Uuid().v4();
    final Group group = Group(
      id: groupId,
      name: groupNameController.text,
      description: groupDescriptionController.text,
      members: [user.id],
      admins: [user.id],
      createdAt: DateTime.now(),
    );

    await GroupRepo.createGroup(group: group);
    await ReaderRepo.addGroupToUser(userId: user.id, groupId: groupId);
    EasyNavigator.popPage(context);
  }

  void onAddGroupBookPressed() {
    ref.read(isGroupBookAddedProvider.notifier).state = true;
    EasyNavigator.openPage(context: context, page: BookSearchScreen());
  }
}

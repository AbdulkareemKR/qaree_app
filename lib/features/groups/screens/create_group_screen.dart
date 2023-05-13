import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/features/groups/controllers/groups_controller.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:flutter/material.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateGroupScreen extends ConsumerStatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends ConsumerState<CreateGroupScreen> {
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
      appBar: CustomAppBar(context: context, title: 'Create Group'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller.groupNameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controller.groupDescriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            // TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Group Members',
            //   ),
            // ),
            SizedBox(height: 16.0),
            CustomButton(
              label: "Create Group",
              onPressed: () async => await _controller.createGroup(),
              style: CustomButtonStyle.primary,
              textStyle: context.textThemes.bodyMedium?.copyWith(
                color: ColorsConst.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

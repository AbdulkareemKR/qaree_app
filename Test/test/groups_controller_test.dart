import 'package:Qaree/features/groups/controllers/groups_controller.dart';
import 'package:Qaree/features/groups/screens/group_details_screen.dart';
import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('GroupsScreenController', () {
    late BuildContext context;
    late WidgetRef ref;
    late GroupsScreenController controller;

    setUp(() {
      context = MockBuildContext();
      ref = MockWidgetRef();
      controller = GroupsScreenController(context: context, ref: ref);
    });

    test('onGroupCardTap opens GroupDetailsScreen with valid group', () {
      
      final group = Group(id: '1', name: 'Test Group');
      GroupDetailsScreen? capturedPage;

      
      when(EasyNavigator.openPage(
        context: any,
        page: any,
      )).thenAnswer((_) {
        capturedPage = _.positionalArguments[1] as GroupDetailsScreen?;
      });

      controller.onGroupCardTap(group);

      
      expect(capturedPage, isA<GroupDetailsScreen>());
      expect(capturedPage!.group, equals(group));
    });

    test('onGroupCardTap does nothing with null group', () {
      
      final group = null;

      
      controller.onGroupCardTap(group);

      
      verifyNever(EasyNavigator.openPage(
        context: any,
        page: any,
      ));
    });
  });
}


class MockBuildContext extends Mock implements BuildContext {}

class MockWidgetRef extends Mock implements WidgetRef {}

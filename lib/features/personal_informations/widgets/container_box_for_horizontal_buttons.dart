import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/features/personal_informations/widgets/horizontal_button_used_in_list.dart';
import 'package:flutter/material.dart';

class ContainerBoxForHorizontalButtons extends StatelessWidget {
  const ContainerBoxForHorizontalButtons({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConst.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(0, 1),
              color: ColorsConst.lightGrey,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          child: Column(
            children: this.children,
          ),
        ),
      ),
    );
  }
}

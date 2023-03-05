import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/fonts_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:flutter/material.dart';

class HorizontalButtonUsedInList extends StatelessWidget {
  const HorizontalButtonUsedInList({
    required this.onTap,
    required this.buttonIcon,
    required this.buttonText,
    super.key,
  });

  final void Function() onTap;
  final IconData buttonIcon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  buttonIcon,
                ),
                SpacingConst.hSpacing20,
                Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsConst.darkGrey,
                    fontFamily: FontConst.fontFamily,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.navigate_next,
            )
          ],
        ),
      ),
    );
  }
}

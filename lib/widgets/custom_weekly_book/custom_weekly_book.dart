import 'package:flutter/material.dart';
import 'package:Qaree/constants/colors_const.dart';

class CustomWeeklyBook extends StatelessWidget {
  const CustomWeeklyBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: MediaQuery.of(context).size.width * .4,
        child: Image(
          image: AssetImage("assets/images/book.png"),
        ),
      ),
      Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("The midnight library",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("Matt Haig"),
              ],
            ),
            GestureDetector(
              onTap: () {
                const snackBar =
                    SnackBar(content: Text('navigate between pages'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text(
                "Read Now >",
                style: TextStyle(
                    fontSize: 20,
                    color: ColorsConst.primaryPurple,
                    decoration: TextDecoration.underline),
              ),
            ),
          ])),
    ]);
  }
}

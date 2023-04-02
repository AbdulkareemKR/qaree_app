import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Qaree/constants/colors_const.dart';

class CustomBookGenre extends StatefulWidget {
  final String genre;
  const CustomBookGenre({Key? key, required this.genre}) : super(key: key);

  @override
  _CustomBookGenreState createState() => _CustomBookGenreState();
}

class _CustomBookGenreState extends State<CustomBookGenre> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var snackBar = SnackBar(content: Text('${widget.genre}'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
          margin: const EdgeInsets.all(2),
          width: 80.w,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
            color: ColorsConst.primaryPurple,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${widget.genre}',
              style: (TextStyle(color: ColorsConst.white)),
            ),
          )),
    );
  }
}

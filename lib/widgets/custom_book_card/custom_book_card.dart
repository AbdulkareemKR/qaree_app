import 'package:flutter/material.dart';

import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';

class CustomBookCard extends StatefulWidget {
  final book;
  const CustomBookCard({super.key, required this.book});

  @override
  State<CustomBookCard> createState() => _CustomBookCardState();
}

class _CustomBookCardState extends State<CustomBookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Image(
                  image: NetworkImage(
                      "http://books.google.com/books/content?id=-16OzgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Text(
              widget.book["name"],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: Text(
              widget.book["author"],
              style: TextStyle(
                fontSize: 12,
                color: ColorsConst.grey,
              ),
            ),
          ),
          SpacingConst.vSpacing20
        ],
      ),
    ));
  }
}

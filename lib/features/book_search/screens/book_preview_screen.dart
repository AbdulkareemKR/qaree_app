import 'package:flutter/material.dart';

class BookPreviewScreen extends StatefulWidget {
  const BookPreviewScreen({Key? key}) : super(key: key);

  @override
  _BookPreviewScreenState createState() => _BookPreviewScreenState();
}

class _BookPreviewScreenState extends State<BookPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Book Preview"));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/screens/home_screen.dart';

class BookPreviewController {
  BuildContext context;
  WidgetRef ref;

  BookPreviewController({
    required this.context,
    required this.ref,
  });
}

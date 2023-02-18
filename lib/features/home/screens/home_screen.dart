import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);
    return Container(
      color: ColorsConst.white,
      child: Center(
        child: Text('Home Screen', style: context.textThemes.displayMedium),
      ),
    );
  }
}

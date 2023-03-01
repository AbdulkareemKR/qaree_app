import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/services/google_books_api.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);
    return user.when(
      data: (user) => Container(
        color: ColorsConst.lightGrey,
        child: SafeArea(
          child: Column(
            children: [
              SpacingConst.vSpacing16,
              Text(
                'Book Shelf',
                style: context.textThemes.displayLarge?.copyWith(
                  fontFamily: "JosefinSans",
                  color: ColorsConst.darkGrey,
                ),
              ),
              SpacingConst.vSpacing60,
              SizedBox(
                height: 300.h,
                child: ListView(
                  shrinkWrap: true,
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          width: 160.0,
                          child: Image(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/I/81bGKUa1e0L._AC_UF1000,1000_QL80_.jpg"),
                          ),
                        ),
                        SpacingConst.vSpacing16,
                        Text(
                          "The Psychology of Money",
                          style: context.textThemes.bodySmall,
                        )
                      ],
                    ),
                    SpacingConst.hSpacing20,
                    Column(
                      children: [
                        Container(
                          width: 160.0,
                          child: Image(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/I/417KWv-EtEL._SY344_BO1,204,203,200_QL70_ML2_.jpg"),
                          ),
                        ),
                        SpacingConst.vSpacing16,
                        Text(
                          "The Psychology of Money",
                          style: context.textThemes.bodySmall,
                        )
                      ],
                    ),
                    SpacingConst.hSpacing20,
                    Column(
                      children: [
                        Container(
                          width: 160.0,
                          child: Image(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/I/81bGKUa1e0L._AC_UF1000,1000_QL80_.jpg"),
                          ),
                        ),
                        SpacingConst.vSpacing16,
                        Text(
                          "The Psychology of Money",
                          style: context.textThemes.bodySmall,
                        )
                      ],
                    ),
                    SpacingConst.hSpacing20,
                    Column(
                      children: [
                        Container(
                          width: 160.0,
                          child: Image(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/I/81bGKUa1e0L._AC_UF1000,1000_QL80_.jpg"),
                          ),
                        ),
                        SpacingConst.vSpacing16,
                        Text(
                          "The Psychology of Money",
                          style: context.textThemes.bodySmall,
                        )
                      ],
                    ),
                    SpacingConst.hSpacing20,
                    Column(
                      children: [
                        Container(
                          width: 160.0,
                          child: Image(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/I/81bGKUa1e0L._AC_UF1000,1000_QL80_.jpg"),
                          ),
                        ),
                        SpacingConst.vSpacing16,
                        Text(
                          "The Psychology of Money",
                          style: context.textThemes.bodySmall,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SpacingConst.vSpacing80,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                width: 385.w,
                height: 231.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorsConst.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  color: ColorsConst.white,
                  borderRadius: BorderRadiusConst.mediumBorderRadius,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 113.0,
                      child: Image(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/417KWv-EtEL._SY344_BO1,204,203,200_QL70_ML2_.jpg"),
                      ),
                    ),
                    SpacingConst.hSpacing20,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Psychology of Money",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: context.textThemes.titleSmall?.copyWith(
                              fontFamily: "JosefinSans",
                              color: ColorsConst.darkGrey,
                            ),
                          ),
                          SpacingConst.vSpacing16,
                          SizedBox(
                            width: 180.w,
                            child: Text(
                              "The psychology of money is the study of our behavior with money. Success with money isn't about knowledge, IQ or how good you are at math. It's about behavior, and everyone.",
                              style: context.textThemes.bodyMedium?.copyWith(
                                fontFamily: "JosefinSans",
                                color: ColorsConst.darkGrey,
                              ),
                              maxLines: 7,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}

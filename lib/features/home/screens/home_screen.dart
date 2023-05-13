import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/home/controllers/home_screen_controller.dart';
import 'package:Qaree/features/home/providers/home_screen_providers.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/book_repo.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:Qaree/widgets/start_session_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final HomeScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = HomeScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);
    return user.when(
      data: (user) => Scaffold(
        appBar: CustomAppBar(context: context, title: 'Book Shelf'),
        backgroundColor: ColorsConst.veryLightGrey,
        body: SafeArea(
          child: Column(
            children: [
              SpacingConst.vSpacing60,
              Container(
                height: 310.h,
                child: (user.books == null || user.books?.isEmpty == true)
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/search_error.svg",
                            width: 270.w,
                          ),
                          SpacingConst.vSpacing20,
                          Text(
                            "There is no Books",
                            style: context.textThemes.headlineLarge?.copyWith(
                              color: ColorsConst.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: user.books?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Consumer(
                              builder: ((context, ref, child) => ref
                                  .watch(BookRepo.getBookByIdProvider(
                                      user.books![index]))
                                  .when(
                                      data: (book) => FadeInUp(
                                            duration:
                                                Duration(milliseconds: 500),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: BounceAnimation(
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                onTap: () => _controller
                                                    .onBookTap(index),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 180.w,
                                                      height: 270.h,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadowConst
                                                              .rightBottomBoxShadow
                                                        ],
                                                      ),
                                                      child: book?.image != null
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadiusConst
                                                                      .verySmallBorderRadius,
                                                              child:
                                                                  Image.network(
                                                                book!.image!,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            )
                                                          : Text(book?.name ??
                                                              "Unknown"),
                                                    ),
                                                    SpacingConst.vSpacing16,
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        book?.name ?? "Unknown",
                                                        style: context
                                                            .textThemes
                                                            .bodyLarge
                                                            ?.copyWith(
                                                          fontFamily:
                                                              "JosefinSans",
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      error: (error, stack) =>
                                          Text("An Error Ocurred"),
                                      loading: () => Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w),
                                            child: LoadingContainer(
                                              width: 180.w,
                                              height: 270.h,
                                            ),
                                          ))));
                        },
                      ),
              ),
              SpacingConst.vSpacing60,
              Consumer(builder: ((context, ref, child) {
                final selectedBook = ref.watch(selectedBookIndexProvider);
                return user.books == null
                    ? Container()
                    : ref
                        .watch(BookRepo.getBookByIdProvider(
                            user.books![selectedBook]))
                        .when(
                            data: (book) => FadeInUp(
                                  duration: Duration(milliseconds: 500),
                                  child: BounceAnimation(
                                    onTap: () => _controller.onBookCardTap(
                                        book,
                                        user.notes
                                            ?.where((note) =>
                                                note.bookId == book.id)
                                            .toList()),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      width: 385.w,
                                      height: 250.h,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadowConst.rightBottomBoxShadow
                                        ],
                                        color: ColorsConst.white,
                                        borderRadius: BorderRadiusConst
                                            .mediumBorderRadius,
                                      ),
                                      child: Row(
                                        children: [
                                          BookImage(
                                            width: 113.0,
                                            height: 168.h,
                                            book: book!,
                                          ),
                                          SpacingConst.hSpacing20,
                                          Container(
                                            width: 180.w,
                                            child: Column(
                                              children: [
                                                SpacingConst.vSpacing30,
                                                Text(
                                                  book.name ?? "Unknown",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: context
                                                      .textThemes.titleSmall
                                                      ?.copyWith(
                                                    fontFamily: "JosefinSans",
                                                    color: ColorsConst.darkGrey,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SpacingConst.vSpacing16,
                                                Text(
                                                  book.description ?? "Unknown",
                                                  style: context
                                                      .textThemes.bodyMedium
                                                      ?.copyWith(
                                                    fontFamily: "JosefinSans",
                                                    color: ColorsConst.grey,
                                                  ),
                                                  maxLines: 6,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Spacer(),
                                                StartSessionWidget(
                                                  onTap: () => _controller
                                                      .onStartSessionTap(book),
                                                ),
                                                SpacingConst.vSpacing30,
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            error: (error, stack) => Text("An Error Ocurred"),
                            loading: () => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: LoadingContainer(
                                    width: 385.w,
                                    height: 231.h,
                                  ),
                                ));
              })),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}

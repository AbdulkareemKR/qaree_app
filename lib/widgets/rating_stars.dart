import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/features/review/providers/review_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingStars extends ConsumerStatefulWidget {
  final double rating;
  final Function(double)? onRatingChanged;
  final double size;
  final isEditable;

  RatingStars({
    required this.rating,
    this.onRatingChanged,
    this.size = 25,
    this.isEditable = false,
  });

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends ConsumerState<RatingStars> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    final fullStars = _rating.floor();
    final halfStars = ((_rating - fullStars)).round();
    final starsCount = 5;

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          starsCount,
          (index) {
            if (index < fullStars)
              return buildStar(
                  Icons.star_rounded, ColorsConst.warningYellow, index);
            else if (index < fullStars + halfStars)
              return buildStar(
                  Icons.star_half_rounded, ColorsConst.warningYellow, index);
            else
              return buildStar(
                  Icons.star_border_rounded, ColorsConst.grey, index);
          },
        ));
  }

  Widget buildStar(IconData icon, Color color, int IconIndex) {
    return GestureDetector(
      onTap: () => onStarTapped(icon, IconIndex),
      child: Icon(
        icon,
        color: color,
        size: widget.size,
      ),
    );
  }

  void onStarTapped(IconData icon, int IconIndex) {
    if (widget.isEditable) {
      final newRating = (IconIndex + 1).toDouble();
      ref.read(ReviewProvider.bookRatingProvider.notifier).state = newRating;
      setState(() {
        _rating = newRating;
      });
    }
  }
}

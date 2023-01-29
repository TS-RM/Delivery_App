import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/review_rating_meal_controllers.dart';

class RatingBarReview extends StatefulWidget {
  const RatingBarReview({Key? key, this.initialRating}) : super(key: key);
  final double? initialRating;
  @override
  _RatingBarReview createState() => _RatingBarReview();
}

class _RatingBarReview extends State<RatingBarReview> {
  final reviewController = Get.find<PreviewRatingMealController>();

  double _initialRating = 4.0;
  bool _isVertical = false;
  IconData? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      glowColor: Colors.grey.shade500,
      initialRating: widget.initialRating ?? _initialRating,
      minRating: 1,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      // allowHalfRating: true, // تقيمم مع الفواصل
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 40.0,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        _selectedIcon ?? Icons.star,
        color: const Color.fromRGBO(245, 201, 99, 1),
      ),
      onRatingUpdate: (rating) {
        setState(() {
          reviewController.rating = rating;
          print(reviewController.rating);
        });
      },
      updateOnDrag: true,
    );
  }
}

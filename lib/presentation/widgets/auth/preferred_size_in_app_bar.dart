import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class PreferredSizeInAppBar extends StatelessWidget with PreferredSizeWidget {
  const PreferredSizeInAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(4.0);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(4.0),
      child: Container(
        height: .5,
        color: appBarPreferredSizeColor.withOpacity(.8),
      ),
    );
  }
}

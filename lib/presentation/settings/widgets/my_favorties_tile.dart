import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../pages/my_favorites.dart';

class MyFavortiesTile extends StatelessWidget {
  const MyFavortiesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, const MyFavoritesPage());
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10)
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Favorites',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded
            )
          ],
        ),
      ),
    );
  }
}
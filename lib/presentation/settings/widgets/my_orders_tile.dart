import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyOrdersTile extends StatelessWidget {
  const MyOrdersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'My Orders',
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
    );
  }
}
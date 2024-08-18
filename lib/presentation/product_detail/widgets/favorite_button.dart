import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:ecommerce/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_colors.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity productEntity;
  const FavoriteButton({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconCubit>().onTap(productEntity);
      },
      icon: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.secondBackground,
            shape: BoxShape.circle
          ),
          child: BlocBuilder<FavoriteIconCubit,bool>(
            builder: (context,state) => Icon(
             state ? Icons.favorite : Icons.favorite_outline,
              size: 15,
              color: Colors.white
            ),
          ),
      ),
    );
  }
}
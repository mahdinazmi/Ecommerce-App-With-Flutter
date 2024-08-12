import 'package:ecommerce/common/helper/product/product_price.dart';
import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/button/basic_app_button.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
        child: BasicAppButton(
          onPressed: () {},
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit,int>(
                builder: (context, state) {
                var price = ProductPriceHelper.provideCurrentPrice(productEntity) * state;
                return Text(
                 "\$${price.toString()}",
                 style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14
                ),
               );
              }, 
            ),
            const Text(
               'Add to Bag',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 14
              ),
            ),
          ],
        )
    ),
  );
 }
}
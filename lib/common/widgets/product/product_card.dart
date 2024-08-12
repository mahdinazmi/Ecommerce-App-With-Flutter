import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:ecommerce/presentation/product_detail/pages/product_detail.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../helper/images/image_display.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({
    required this.productEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, ProductDetailPage(productEntity: productEntity,));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      ImageDisplayHelper.generateProductImageURL(
                        productEntity.images[0]
                      )
                    )
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                  )
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.title,
                        style: const TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            productEntity.discountedPrice == 0 ? "${productEntity.price}\$" :
                            "${productEntity.discountedPrice}\$",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 10, ),
                            Text(
                              productEntity.discountedPrice == 0 ? '' :
                              "${productEntity.price}\$",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
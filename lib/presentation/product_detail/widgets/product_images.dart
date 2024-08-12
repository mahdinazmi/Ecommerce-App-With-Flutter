import 'package:ecommerce/common/helper/images/image_display.dart';
import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({
    required this.productEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  ImageDisplayHelper.generateProductImageURL(productEntity.images[index])
                )
              )
            ),
          );
        }, 
        separatorBuilder: (context,index) => const SizedBox(width: 10,),
        itemCount: productEntity.images.length
      ),
    );
  }
}
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/presentation/home/bloc/top_selling_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/images/image_display.dart';
import '../../../domain/product/entities/product.dart';
import '../bloc/top_selling_display_state.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopSellingDisplayCubit()..displayProducts(),
      child: BlocBuilder < TopSellingDisplayCubit, TopSellingDisplayState > (
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _topSelling(),
                const SizedBox(height: 20, ),
                _products(state.products)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

   Widget _topSelling() {
    return const Padding(
      padding: EdgeInsets.symmetric(
         horizontal: 16,
       ),
      child: Text(
        'Top Selling',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
         horizontal: 16,
       ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return Container(
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
                            products[index].images[0]
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
                          products[index].title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                             products[index].discountedPrice == 0 ? "${products[index].price}\$" :
                             "${products[index].discountedPrice}\$", 
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Text(
                            products[index].discountedPrice == 0 ?  '' :
                             "${products[index].price}\$",
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
          );
        },
        separatorBuilder: (context,index) => const SizedBox(width: 10,),
        itemCount: products.length
        ),
    );
  }
}
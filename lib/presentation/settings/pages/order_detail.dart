import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/order/entities/order.dart';
import 'package:ecommerce/presentation/settings/pages/order_items.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity orderEntity;
  const OrderDetailPage({
    required this.orderEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Order #${orderEntity.code}'
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _status(),
            const SizedBox(height: 50,),
            _items(context),
            const SizedBox(height: 30,),
            _shipping()
          ],
        ),
      )
    );
  }

  Widget _status() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: orderEntity.orderStatus[index].done ? 
                    AppColors.primary :
                    Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: orderEntity.orderStatus[index].done ? const Icon(
                    Icons.check
                  )  : Container(),
                ),
                const SizedBox(width: 15,),
                Text(
                  orderEntity.orderStatus[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: orderEntity.orderStatus[index].done ? Colors.white : Colors.grey
                  ),
                )
              ],
            ),
            Text(
              orderEntity.orderStatus[index].createdDate.toDate().toString().split(' ')[0],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: orderEntity.orderStatus[index].done ? Colors.white : Colors.grey
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 50,), 
      reverse: true,
      itemCount: orderEntity.orderStatus.length
    );
  }

  Widget _items(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            'Order Items',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          const SizedBox(height: 15, ),
           GestureDetector(
            onTap: (){
              AppNavigator.push(context, OrderItemsPage(products: orderEntity.products));
            },
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.secondBackground,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.receipt_rounded
                          ),
                          const SizedBox(width: 20, ),
                          Text(
                            '${orderEntity.products.length} Items',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.primary
                        ),
                      )
                    ],
                  ),
              ),
            )
      ],
    );
  }

  Widget _shipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            'Shipping details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          const SizedBox(height: 15, ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  orderEntity.shippingAddress
                )
            )
      ],
    );
  }
}
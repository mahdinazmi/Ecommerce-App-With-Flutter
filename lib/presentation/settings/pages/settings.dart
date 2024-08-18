import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/presentation/settings/widgets/my_orders_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/my_favorties_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Settings'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            MyFavortiesTile(),
            SizedBox(height: 15,),
            MyOrdersTile()
          ],
        ),
      ),
    );
  }
}
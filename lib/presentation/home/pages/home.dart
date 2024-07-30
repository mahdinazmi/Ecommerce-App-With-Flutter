import 'package:ecommerce/presentation/home/widgets/header.dart';
import 'package:flutter/material.dart';

import '../widgets/categories.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16
        ),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24,),
            SearchField(),
            SizedBox(height: 24,),
            Categories()
          ],
        ),
      ),
    );
  }
}
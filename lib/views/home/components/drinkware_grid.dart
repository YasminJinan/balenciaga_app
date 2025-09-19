import 'package:balenciaga_ecommerce/data/products_data.dart';
import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/views/home/components/items_card.dart';
import 'package:flutter/material.dart';

class DrinkwareGrid extends StatelessWidget {
  const DrinkwareGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding,
          childAspectRatio: 0.75
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ItemsCard(
          product: products[index],
          press: () {},
        ),
      ),
    );
  }
}
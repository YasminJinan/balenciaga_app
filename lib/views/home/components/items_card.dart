import 'package:balenciaga_ecommerce/models/products_model.dart';
import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:flutter/material.dart';


class ItemsCard extends StatelessWidget {
  final ProductsModel product;
  final VoidCallback press; 

  const ItemsCard({super.key, required this.product, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            product.title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 5),
          Text(
            product.getFormattedPrice()
          )
        ],
      ),
    );
  }
}
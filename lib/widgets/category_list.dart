import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: 'Combo Meal',
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: 'SeaFood',
            press: () {},
          ),
          CategoryItem(
            title: 'Beverages',
            press: () {},
          ),
          CategoryItem(
            title: 'Snacks & Sides',
            press: () {},
          ),
        ],
      ),
    );
  }
}

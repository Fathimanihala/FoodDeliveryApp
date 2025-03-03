import 'package:flutter/material.dart';

import '../model/food.dart';

class MyFoodTile extends StatelessWidget {
  const MyFoodTile({super.key, required this.food, required this.onTap});

  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '\$' + food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(food.description, style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),),
                    ],
                  ),
                ),
                SizedBox(width: 15,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagepath,
                    height: 120,
                    width: 120,

                  ),
                )
              ],
            ),
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.tertiary,
        indent: 25,
        endIndent: 25,)
      ],
    );
  }
}

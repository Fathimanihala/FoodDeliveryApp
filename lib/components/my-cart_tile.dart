import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_quantity_selector.dart';
import 'package:fooddeliveryapp/model/Restaurant.dart';
import 'package:fooddeliveryapp/model/cart_item.dart';
import 'package:provider/provider.dart';

class MycartTile extends StatelessWidget {
  const MycartTile({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cartItem.food.imagepath,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //food name
                            Text(cartItem.food.name),
                            //food price
                            Text(
                              '\$' + cartItem.food.price.toString(),
                              style: TextStyle(color: Theme.of(context).colorScheme.primary),
                            ),
                            SizedBox(height: 15,),

                            MyQuantitySelector(
                              quantity: cartItem.quantity,
                              food: cartItem.food,
                              onIncrement: () {
                                restaurant.addToCart(
                                    cartItem.food, cartItem.selectedAddons);
                              },
                              onDecrement: () {
                                restaurant.removeFromCart(cartItem);
                              },
                            ),
                          ],
                        ),


                        Spacer(),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 10,bottom: 10,right: 10),
                        children: cartItem.selectedAddons
                            .map(
                              (addon) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  label: Row(
                                    children: [
                                      Text(addon.name),
                                      Text('(\$${addon.price})'),
                                    ],
                                  ),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  onSelected: (value) {},
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                                  fontSize: 12),
                                ),
                              ),
                            )
                            .toList()),
                  )
                ],
              ),
            ));
  }
}

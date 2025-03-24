import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my-cart_tile.dart';
import 'package:fooddeliveryapp/components/my_button.dart';
import 'package:fooddeliveryapp/model/Restaurant.dart';
import 'package:fooddeliveryapp/pages/payment-page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;
      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Are You sure want to clear the cart",
                    ),
                    actions: [
                      // cancelbutton
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                        child: Text("yes"),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child:  Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(child: Center(child: Text("Cart is Empty..")))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item

                                final cartItem = userCart[index];
                                //return cart tile ui
                                return MycartTile(cartItem: cartItem);
                              }),
                        ),
                  MyButton(onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Paymentpage())), text: 'Checkout',),


                ],
              ),

            ),
            SizedBox(height: 25,)
          ],
        ),
      );
    });
  }
}

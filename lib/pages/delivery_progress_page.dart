import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my-cart_tile.dart';
import 'package:fooddeliveryapp/components/my_receipt.dart';
import 'package:fooddeliveryapp/model/Restaurant.dart';
import 'package:fooddeliveryapp/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  FirestoreServie db =FirestoreServie();
  @override
  void initState() {

    super.initState();
     String receipt =context.read<Restaurant>().displayCartReceipt();
  db.saveOrderToDatabase(receipt);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ),
          SizedBox(
            width: 10,
          ),
          //driver detail
          Column(
            children: [
              Text(
                "Mitch koko",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text(
                "Driver",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
          Spacer(),
          Row(
            children: [],
          ),
          //message  button
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
          SizedBox(width: 10,),

          //call button

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Colors.green,
                )),
          ),
        ],
      ),
    );
  }
}

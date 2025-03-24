import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fooddeliveryapp/components/my_button.dart';

import 'delivery_progress_page.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder name: $cardHolderName"),
                Text("Cvv: $cvvCode"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),


              child: Text("cancel"),
            ),
            // Yes Button
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  )),
              child: Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Checkout"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardWidget(
                      cardNumber: cardNumber,
                      chipColor: Colors.amber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      onCreditCardWidgetChange: (p0) {},
                    ),

                    CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: (data) {
                          setState(() {
                            cardNumber = data.cardNumber;
                            expiryDate = data.expiryDate;
                            cardHolderName = data.cardHolderName;
                            cvvCode = data.cvvCode;
                          });
                        },
                        formKey: formKey),

                    //
                  ],
                ),
              ),
            ),
            MyButton(
              text: 'Pay now',
              onTap: userTappedPay,
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}

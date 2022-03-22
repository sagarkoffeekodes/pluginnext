import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class Pay_gateWay extends StatefulWidget {
  const Pay_gateWay({Key? key}) : super(key: key);

  @override
  _Pay_gateWayState createState() => _Pay_gateWayState();
}

class _Pay_gateWayState extends State<Pay_gateWay> {

   final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

   void onGooglePayResult(paymentResult) {
     debugPrint(paymentResult.toString());
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        GooglePayButton(
          paymentConfigurationAsset:"googlepay.json",
          width: 100,
          paymentItems: _paymentItems,
          style: GooglePayButtonStyle.black,
          type: GooglePayButtonType.pay,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: onGooglePayResult,
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),


      ],),
    );
  }
}

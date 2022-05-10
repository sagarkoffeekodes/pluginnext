
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pluginnext/plugin/utils/razor/sucessfull.dart';
import 'package:pluginnext/plugin/utils/razor/unsucessfull.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class Payment_Razor extends StatefulWidget {
  const Payment_Razor({Key? key}) : super(key: key);

  @override
  _Payment_RazorState createState() => _Payment_RazorState();
}

class _Payment_RazorState extends State<Payment_Razor> {
  static const platform = const MethodChannel("razorpay_flutter");
  TextEditingController amountController =TextEditingController();

  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: const Text('Razorpay Sample App'),
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Center(child: Text("Enter a Amount",style:TextStyle(fontWeight: FontWeight.w100,fontSize: 20))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: TextField(
                  controller: amountController,
style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blue,),
                  keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  decoration: InputDecoration(

                      hintText: "0",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 5.0),
                      )
                  ),
                ),
              ),
              Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(onPressed: openCheckout, child: Text('Pay'))
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_YPJu0Z0fo0lQSU',
      'amount': int.parse(amountController.text)*100,
      'name': 'Koffee Kodes Corp.',
      'description': 'IT company',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9265187923', 'email': 'sagarlr1998@gmail.com'},
      'external': {

        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }



  void _handlePaymentSuccess(PaymentSuccessResponse response) {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Successfull()));

    Fluttertoast.showToast(
        msg: "SUCCESS Payment:",
            // + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
        print("Pament success");

  }

  void _handlePaymentError(PaymentFailureResponse response) {
  //  Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Unsucessful()));

    print("Pament error");
    Fluttertoast.showToast(
        msg: "Payment Invalid : " ,
      //      + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Successfull()));
  }



}
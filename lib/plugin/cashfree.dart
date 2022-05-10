import 'dart:convert';
import 'dart:io';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluginnext/api.dart';


class Cash_free_paymentgateway extends StatefulWidget {
  const Cash_free_paymentgateway({Key? key}) : super(key: key);

  @override
  State<Cash_free_paymentgateway> createState() => _Cash_free_paymentgatewayState();
}

class _Cash_free_paymentgatewayState extends State<Cash_free_paymentgateway> {
  var tokenpass;

  bool isLoading = false;


  final TextEditingController _orderNumber = TextEditingController();
  final TextEditingController _orderId = TextEditingController();


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cash Free",style: TextStyle(color: Colors.white,fontSize: 15)),
      ),
      body: Padding(

        padding: const EdgeInsets.only(top: 80,left: 20,right: 20),
        child: Container(
          height: 500,
          child: Card(

            elevation: 10,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black,),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    child: TextField(
                      controller: _orderNumber,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue,),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(

                          hintText: "0",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 5.0),
                          )
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 230,top: 20),
                    child: Text("Order Id", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black,),),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    child: TextFormField(
                      controller: _orderId,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue,),

                      decoration: InputDecoration(

                          hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 5.0),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: RaisedButton(
                      child: const Text('CashFree Payment',
                          style: TextStyle(
                              color: Colors.black,fontSize: 12)),
                      onPressed: () async {
                        return upiFetch(_orderId.text,_orderNumber.text);
                        setState(() {
                          _orderId.clear();
                          _orderNumber.clear();
                        });

                      },
                    ),
                  ),

                  SizedBox(height: 30,),
                  Center(
                    child: RaisedButton(
                      child: const Text('SEAMLESS PAYPAL Payment',
                          style: TextStyle(
                              color: Colors.black,fontSize: 12)),
                      onPressed: () =>  upiFetch1(_orderId.text,_orderNumber.text),
                    ),
                  ),

                  Center(
                    child: RaisedButton(
                      child: Text('SEAMLESS UPI INTENT'),
                      onPressed: () => seamlessUPIIntent1
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // SEAMLESS UPI Intent
  Future<void> seamlessUPIIntent(String token,String oid, String oAmount) async {
    //Replace with actual values
    String orderId = oid;
    String stage = "TEST";
    String orderAmount = oAmount;
    // String tokenData = "";
    String customerName = "rahul";
    String orderNote = "This is optional field";
    String orderCurrency = "INR";
    String appId = "156264b46d25ab43390104f368462651";
    String customerPhone = "8908908901";
    String customerEmail = "rahul.codesmith@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";


    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": token,
      "notifyUrl": notifyUrl,
    };

    print(inputParams);
    print("test input");

    await CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }






  // SEAMLESS UPI Intent
  Future<void> seamlessUPIIntent1(String token,String oid, String oAmount) async {
    //Replace with actual values
    String orderId = oid;
    String stage = "PROD";
    String orderAmount = oAmount;
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";


    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": token,
      "notifyUrl": notifyUrl,


      // For seamless UPI Intent
    //  "appName": _selectedApp["id"]
    };

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }




  // SEAMLESS - Paypal
  Future<void> seamlessPayPalPayment(String token,String oid, String oAmount) async {
    String orderId = oid;
    String stage = "PROD";
    String orderAmount = oAmount;
    // String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": token,
      "notifyUrl": notifyUrl,

      // EXTRA THINGS THAT NEEDS TO BE ADDED
      "paymentOption": "paypal"
    };

  await  CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("$key : $value");
      //Do something with the result
    }));
  }




  upiFetch(String oid,String orderAmount)async{

    setState(() {
      isLoading = true;
    });

    var data = {
      "orderId": oid,
      "orderAmount": orderAmount,
      "orderCurrency":"INR"
    };
    print(data);

    print("check data");


    var response = await CallApi().postData(data,"v2/cftoken/order");
    print(response.statusCode);
    print("check");

    if (response.statusCode == 200) {

      var body = json.decode(response.body);
      // print("body-->$body");

      tokenpass = body['cftoken'];

      print(tokenpass);
      print("pass token");

      await seamlessUPIIntent(tokenpass,oid,orderAmount);
      setState(() {
        _orderId.clear();
        _orderNumber.clear();
      });


      print("seamless");

      setState(() {
        isLoading= false;
      });

      // Navigator.pop(context,'refresh');
    }
    else {
      setState(() {
        isLoading= false;

      });

      throw Exception('Failed to load ');
    }
  }

  upiFetch1(String oid,String orderAmount)async{

    setState(() {
      isLoading = true;
    });

    var data = {
      "orderId": oid,
      "orderAmount": orderAmount,
      "orderCurrency":"INR"
    };
    print(data);

    print("check data");


    var response = await CallApi().postData(data,"v2/cftoken/order");
    print(response.statusCode);
    print("check");

    if (response.statusCode == 200) {

      var body = json.decode(response.body);
      // print("body-->$body");

      tokenpass = body['cftoken'];

      print(tokenpass);
      print("pass token");

      await seamlessPayPalPayment(tokenpass,oid,orderAmount);

      print("seamless");

      setState(() {
        isLoading= false;
      });

      // Navigator.pop(context,'refresh');
    }
    else {
      setState(() {
        isLoading= false;
      });

      throw Exception('Failed to load ');
    }
  }

}




import 'package:flutter/material.dart';
import 'package:pluginnext/plugin/utils/razor/razorpayment.dart';

class Unsucessful extends StatefulWidget {
  const Unsucessful({Key? key}) : super(key: key);

  @override
  State<Unsucessful> createState() => _UnsucessfulState();
}

class _UnsucessfulState extends State<Unsucessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UNSucessfull"),
        centerTitle: true,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Row(
      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Razor()));

            } , child: Text('GoTo Payment'))
          ]),

        ],
      ),
    );
  }
}

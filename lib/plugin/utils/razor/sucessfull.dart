import 'package:flutter/material.dart';
import 'package:pluginnext/plugin/utils/razor/razorpayment.dart';

class Successfull extends StatefulWidget {
  const Successfull({Key? key}) : super(key: key);

  @override
  State<Successfull> createState() => _SuccessfullState();
}

class _SuccessfullState extends State<Successfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
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

                } , child: Text('Goto Payment'))
              ]),

        ],
      ),
    );
  }
}

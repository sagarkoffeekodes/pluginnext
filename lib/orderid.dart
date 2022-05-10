import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OrderId extends StatefulWidget {
  const OrderId({Key? key}) : super(key: key);

  @override
  State<OrderId> createState() => _OrderIdState();
}

class _OrderIdState extends State<OrderId> {
  late Future future;
  late List demo=['a','b','c','d','e'];

  @override
  void initState() {
    future = Future.delayed(Duration(seconds: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        Center(
          child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? ListView.builder(
                shrinkWrap: true,
                itemCount: demo.length,
                itemBuilder:(context,index){
                  return Center(child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Text("Albhabets      ${demo[index]}"),
                  ));
            })
                : CircularProgressIndicator();
          },

      ),
        )

      ],),
    );
  }
}

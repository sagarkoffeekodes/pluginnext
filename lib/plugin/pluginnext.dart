import 'package:flutter/material.dart';
import 'package:pluginnext/plugin/SharedAxsTransition.dart';
import 'package:pluginnext/plugin/agoravideocall.dart';
import 'package:pluginnext/plugin/animination.dart';
import 'package:pluginnext/plugin/cashfree.dart';
import 'package:pluginnext/plugin/hiveDatabbse.dart';
import 'package:pluginnext/plugin/pages/index.dart';
import 'package:pluginnext/plugin/pay.dart';
import 'package:pluginnext/plugin/paytm.dart';
import 'package:pluginnext/plugin/utils/razor/razorpayment.dart';
import 'package:pluginnext/plugin/slidinguppanel.dart';
import 'package:pluginnext/plugin/smoothpageindicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Containertransform.dart';


class PluginNext extends StatefulWidget {
  const PluginNext({Key? key}) : super(key: key);

  @override
  _PluginNextState createState() => _PluginNextState();
}

class _PluginNextState extends State<PluginNext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PluginNext"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Animination_Ani()));
            }, child: Text("Fade")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Animination_Sec()));
            }, child: Text("Container")),

            // ElevatedButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Shared_Ax_is_Transition()));
            // }, child: Text("SharedAxisTransition")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SmoothPage_Indicator()));
            }, child: Text("SmoothpageIndicator")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sliding_panel_up()));
            }, child: Text("Slidinguppannel")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Hive_dataBase()));
            }, child: Text("Hive")),


            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Razor()));
            }, child: Text("razorpay")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Pay_gateWay()));
            }, child: Text("Pay")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>IndexPage()));
            }, child: Text("aagroa videocall")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Ptym_Payment()));
            }, child: Text("paytm_allinonesdk")),


            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Agora_videocall()));
            }, child: Text("aggroa2")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cash_free_paymentgateway()));
            }, child: Text("Cashfree")),
          ],
        ),
      ),
    );
  }
}

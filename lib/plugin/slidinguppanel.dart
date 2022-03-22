import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';



class Sliding_panel_up extends StatefulWidget {
  const Sliding_panel_up({Key? key}) : super(key: key);

  @override
  _Sliding_panel_upState createState() => _Sliding_panel_upState();
}

class _Sliding_panel_upState extends State<Sliding_panel_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
        body: Center(
          child: Text("This is the Widget behind the sliding panel"),
        ),
      ),
    );
  }}
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';


class Animination_Ani extends StatefulWidget {
  const Animination_Ani({Key? key}) : super(key: key);

  @override
  _Animination_AniState createState() => _Animination_AniState();
}

class _Animination_AniState extends State<Animination_Ani> {
  bool _slowAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

Center(child: Text("this is home page"))
        ],
      ),
      floatingActionButton:OpenContainer(
          transitionDuration: Duration(seconds: 3),
          closedBuilder: (context,openWidget){

        return FloatingActionButton(onPressed: openWidget,
        );
      }, openBuilder: (context,closeWidget){




    return Destination();

    }
      ),
    );
  }
}


class Destination extends StatelessWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(

),

  body:Center(child: Text("welcome")),
    );
  }
}




class _TransitionListTile extends StatelessWidget {
  const _TransitionListTile({
    this.onTap,
    required this.title,
    required this.subtitle,
  });

  final GestureTapCallback? onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.black54,
          ),
        ),
        child: const Icon(
          Icons.play_arrow,
          size: 35,
        ),
      ),
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
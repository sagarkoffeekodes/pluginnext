import 'package:flutter/material.dart';
import 'package:ringtone_player/ringtone_player.dart';


class Ring_toneExamaple extends StatefulWidget {
  const Ring_toneExamaple({Key? key}) : super(key: key);

  @override
  State<Ring_toneExamaple> createState() => _Ring_toneExamapleState();
}

class _Ring_toneExamapleState extends State<Ring_toneExamaple> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Ringtone player'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Button(
                child: const Text('playRingtone'),
                onPressed: () {
                  RingtonePlayer.ringtone();
                },
              ),
              Button(
                child: const Text('playRingtone as alarm'),
                onPressed: () {


                  RingtonePlayer.play(
                    alarmMeta: AlarmMeta(
                      'com.example.pluginnext.MainActivity',
                      'ic_alarm_notification',
                      contentTitle: 'Alarm',
                      contentText: 'Alarm is active',
                      subText: 'Subtext',
                    ),
                    android: Android.ringtone,
                    ios: Ios.electronic,
                    loop: true, // Android only - API >= 28
                    volume: 1.0, // Android only - API >= 28
                    alarm: true, // Android only - all APIs
                  );                },
              ),
              Button(
                child: const Text('play'),
                onPressed: () {
                  RingtonePlayer.play(
                    android: Android.ringtone,
                    ios: Ios.electronic,
                    loop: true,
                    volume: 1.0,
                  );
                },
              ),
              Button(
                child: const Text('stop'),
                onPressed: () {
                  RingtonePlayer.stop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button({Key? key, this.onPressed, this.child}) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? child;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}
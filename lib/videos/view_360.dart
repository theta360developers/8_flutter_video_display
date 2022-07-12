import 'package:flutter/material.dart';
import 'package:video_360/video_360.dart';
import 'package:video_player/video_player.dart';

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => View360())));
        },
        child: Text('360 View'));
  }
}

class View360 extends StatefulWidget {
  const View360({Key? key}) : super(key: key);

  @override
  State<View360> createState() => _View360State();
}

class _View360State extends State<View360> {
  late Video360Controller controller;
  String durationText = '';
  String totalText = '';
  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: width,
              height: height,
              child: Video360View(
                onVideo360ViewCreated: _onVideo360ViewCreated,
                url:
                    'https://codetricity.github.io/flutter_video_display/ageda.MP4',
                onPlayInfo: (Video360PlayInfo info) {
                  setState(() {
                    durationText = info.duration.toString();
                    totalText = info.total.toString();
                  });
                },
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.play();
                    },
                    color: Colors.grey[100],
                    child: Text('Play'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.stop();
                    },
                    color: Colors.grey[100],
                    child: Text('Stop'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.reset();
                    },
                    color: Colors.grey[100],
                    child: Text('Reset'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _onVideo360ViewCreated(Video360Controller controller) {
    this.controller = controller;
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OpenerVideoPlayer extends StatefulWidget {
  final String videoLink;

  const OpenerVideoPlayer({Key? key, required this.videoLink}) : super(key: key);

  @override
  OpenerVideoPlayerState createState() => OpenerVideoPlayerState();
}

//https://stackoverflow.com/questions/58636185/how-to-get-the-actual-aspect-ratio-of-the-video
//https://pub.dev/packages/video_player/example
//https://www.google.com/search?q=flutter+video+errorDescription%3A+play%28%29+failed+because+the+user+didn%27t+interact+with+the+document+first.&rlz=1C1CHBF_huHU1014HU1014&ei=2XejY5aYF4nhkgWI5aKwAQ&ved=0ahUKEwjW6IKc0Yv8AhWJsKQKHYiyCBYQ4dUDCBo&uact=5&oq=flutter+video+errorDescription%3A+play%28%29+failed+because+the+user+didn%27t+interact+with+the+document+first.&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQA0oECEEYAEoECEYYAFAAWN8YYJcbaABwAXgAgAGkAYgBmwqSAQM0LjeYAQCgAQHAAQE&sclient=gws-wiz-serp
//https://github.com/flutter/flutter/issues/68482
class OpenerVideoPlayerState extends State<OpenerVideoPlayer> {
  late VideoPlayerController videoController;// = VideoPlayerController.asset( widget.videoLink );

  @override
  void initState() {
    super.initState();
  videoController = VideoPlayerController.asset( "assets/blender/videos/opener.mp4" );
  videoController.setVolume(0.0);
  videoController.initialize().then( 
      ( _ ) { 
        setState((){});
      } 
    );
    
    videoController.addListener(
      () {} 
    );

    videoController.play();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videoController.value.isInitialized ? 
    (
      AspectRatio(
        aspectRatio: videoController.value.aspectRatio,
        child:       VideoPlayer(videoController)
      )
    ):
    ( Container() );
  }
}

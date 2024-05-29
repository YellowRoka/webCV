import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RefVideoPlayer extends StatefulWidget {
  final String videoLink;
  final int    id;

  const RefVideoPlayer({Key? key, required this.videoLink, required this.id}) : super(key: key);

  @override
  RefVideoPlayerState createState() => RefVideoPlayerState();
}

class RefVideoPlayerState extends State<RefVideoPlayer> {
  late VideoPlayerController _controller;
  bool isEnded = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController
      .networkUrl(Uri.parse(widget.videoLink))
      //.asset( widget.videoLink )
      ..initialize().then( (_) => setState( () {} ) );
      _controller.addListener( (){ 

        if (_controller.value.duration ==_controller.value.position) { //checking the duration and position every time
          setState(() {
            isEnded = true;
          });
        }
        else{
          setState(() {
            isEnded = true;
          });
        }

      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [

          Center(
            child: 
            ( _controller.value.isInitialized )? 
            ( AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child:       VideoPlayer(_controller),
              )
            ): 
            ( const SizedBox() ),
          ),

          FloatingActionButton(
            backgroundColor: Colors.black,
            child:           Icon( ( _controller.value.isPlaying || !isEnded )?( Icons.pause ):( Icons.play_arrow ), color: Colors.white ),
            onPressed:       () => setState(
              () {
                ( _controller.value.isPlaying )?( _controller.pause() ):( _controller.play() );
              }
            ),
          ),

        ],
      ),
    );
  }
}

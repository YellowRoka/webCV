import 'package:flutter/material.dart';

import '../../../../common/widgets/base_card.dart';
import 'parts/ref_video_player.dart';

class RefCardVideo extends StatelessWidget {
  final String headText;
  final String videoUrl;
  
  const RefCardVideo({Key? key, required this.headText, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      children: [
        Column(
          children: [
            
            SizedBox(
                height: 100,
                child:  Center(child: Text( headText, style: const TextStyle(color: Colors.white, fontSize: 32) ))
            ),

            SizedBox( height: 400, child: RefVideoPlayer(videoLink: videoUrl)),

          ],
        ),
      ],
    );
  }
}

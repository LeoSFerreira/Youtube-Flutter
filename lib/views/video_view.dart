// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatefulWidget {
  final String videoID;
  const VideoView({
    Key? key,
    required this.videoID,
  }) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoID,
    flags: const YoutubePlayerFlags(autoPlay: true, enableCaption: false),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            progressColors: ProgressBarColors(
                backgroundColor: Colors.grey,
                playedColor: Colors.red,
                handleColor: Colors.redAccent),
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [player],
            );
          }),
    );
  }
}

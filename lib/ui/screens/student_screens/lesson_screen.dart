import 'package:course_task/data/model/lessons_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class LessonScreen extends StatefulWidget {
  LessonModel lessonDetails;
  LessonScreen(this.lessonDetails, {Key? key}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller=YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(widget.lessonDetails.videoLink).toString());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lessonDetails.lessonName),

      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          YoutubePlayerBuilder(
            builder: (context,player){
              return YoutubePlayer(controller: _controller);
            },
            player: YoutubePlayer(controller: _controller,),
          ),
          
          const SizedBox(height: 8),
          Text(widget.lessonDetails.lessonName,style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700
          ),),
          const SizedBox(height: 8),

          Text(widget.lessonDetails.lessonDescription,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.grey
          ),),

        ],
      ),
    );
  }
}

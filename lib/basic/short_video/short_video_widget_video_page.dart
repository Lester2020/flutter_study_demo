import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortVideoWidgetVideoPage extends StatefulWidget {
  const ShortVideoWidgetVideoPage({Key? key}) : super(key: key);

  @override
  _ShortVideoWidgetVideoPageState createState() => _ShortVideoWidgetVideoPageState();
}

class _ShortVideoWidgetVideoPageState extends State<ShortVideoWidgetVideoPage> {

  late VideoPlayerController _playerController;
  late bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.asset('videos/living_0.mp4');
    _playerController.addListener(() {
      bool isPlaying = _playerController.value.isPlaying;
      if(isPlaying != _isPlaying){
        setState(() {
          _isPlaying = isPlaying;
        });
      }
    });
    ///在初始化完成后必须更新界面
    _playerController.initialize().then((value) {
      setState(() {
        _playerController.play();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.pause();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: _playerController.value.isInitialized
          ? VideoPlayer(_playerController)
          : Container(),
    );
  }
}

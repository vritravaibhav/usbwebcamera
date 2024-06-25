import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class Screen3 extends StatefulWidget {
  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      "http://192.168.1.1:7070/?action=stream",
      autoInitialize: true,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VlcPlayer(
      controller: _videoPlayerController,
      aspectRatio: 16 / 9,
      placeholder: const Center(
          child: CircularProgressIndicator(
        color: Colors.white,
      )),
    );
  }
}

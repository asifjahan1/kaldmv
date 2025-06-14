import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  late YoutubePlayerController youtubeController;

  @override
  void onInit() {
    super.onInit();
    youtubeController = YoutubePlayerController(
      initialVideoId: 'dQw4w9WgXcQ', // Replace with actual video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void onClose() {
    youtubeController.dispose();
    super.onClose();
  }
}

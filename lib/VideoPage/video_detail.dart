import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'video_widget/meta_data_section.dart';
import 'video_widget/play_pause_button_bar.dart';
import 'video_widget/player_state_section.dart';
import 'video_widget/source_input_section.dart';
import 'video_widget/volume_slider.dart';

///

///
class VideoDetail extends StatefulWidget {
  @override
  _VideoDetail createState() => _VideoDetail();
}

class _VideoDetail extends State<VideoDetail> {
  late YoutubePlayerController _controller;

  @override
  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    List<dynamic> result =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final _youtubeId =
        YoutubePlayerController.convertUrlToId(result[1]).toString();
    final _controller = YoutubePlayerController(
      initialVideoId: _youtubeId,
      params: const YoutubePlayerParams(
        // startAt: const Duration(minutes: 1, seconds: 36),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: SafeArea(
        child: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 200) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: player),
                    const SizedBox(
                      height: 420,
                      // width: MediaQuery.of(context).size.width,
                      width: 600,
                      child: SingleChildScrollView(
                        child: Controls(),
                      ),
                    ),
                  ],
                );
              }
              return ListView(
                children: [
                  Stack(
                    children: [
                      player,
                      Positioned.fill(
                        child: YoutubeValueBuilder(
                          controller: _controller,
                          builder: (context, value) {
                            return AnimatedCrossFade(
                              firstChild: const SizedBox.shrink(),
                              secondChild: Material(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        YoutubePlayerController.getThumbnail(
                                          videoId:
                                              _controller.params.playlist.first,
                                          quality: ThumbnailQuality.medium,
                                        ),
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              crossFadeState: value.isReady
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Controls(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

///
class Controls extends StatelessWidget {
  ///
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _space,
          MetaDataSection(),
          _space,
          PlayPauseButtonBar(),
          _space,
          VolumeSlider(),
          _space,
          PlayerStateSection(),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}

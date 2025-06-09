import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortCard extends StatefulWidget {
  final Map<String, String> short;
  final double h;
  final double w;
  final bool autoPlay;
  final bool mute;

  const ShortCard({
    super.key,
    required this.short,
    required this.h,
    required this.w,
    this.autoPlay = false,
    this.mute = true,
  });

  @override
  State<ShortCard> createState() => _ShortCardState();
}

class _ShortCardState extends State<ShortCard> {
  late YoutubePlayerController _controller;
  late String _videoId;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _videoId =
        YoutubePlayer.convertUrlToId(widget.short['videoUrl'] ?? '') ?? '';
    _initController();
  }

  void _initController() {
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: widget.mute,
        loop: false, // We'll handle loop manually
        hideControls: true,
        disableDragSeek: true,
        controlsVisibleAtStart: false,
      ),
    )..addListener(_playerListener);
  }

  void _playerListener() {
    if (!_isPlayerReady && _controller.value.isReady) {
      setState(() {
        _isPlayerReady = true;
      });
      if (widget.autoPlay) {
        _controller.play();
      }
    }
  }

  @override
  void didUpdateWidget(covariant ShortCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newVideoId =
        YoutubePlayer.convertUrlToId(widget.short['videoUrl'] ?? '') ?? '';
    if (_videoId != newVideoId) {
      _controller.removeListener(_playerListener);
      _controller.dispose();
      _videoId = newVideoId;
      _initController();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_playerListener);
    _controller.dispose();
    super.dispose();
  }

  String getThumbnailUrl(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    return videoId != null
        ? 'https://img.youtube.com/vi/$videoId/sddefault.jpg'
        : '';
  }

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = getThumbnailUrl(widget.short['videoUrl'] ?? '');
    return SizedBox(
      height: widget.h,
      width: widget.w,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            widget.autoPlay
                ? YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                      bottomActions: [],
                      showVideoProgressIndicator: false,
                      onEnded: (metaData) {
                        _controller.seekTo(
                          Duration(seconds: 1),
                        ); // Avoid 0s to prevent bug
                        _controller.play();
                      },
                    ),
                    builder: (context, player) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: widget.w,
                          height: widget.h,
                          child: player,
                        ),
                      );
                    },
                  )
                : FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                      thumbnailUrl,
                      width: widget.w,
                      height: widget.h,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.broken_image, size: 40),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

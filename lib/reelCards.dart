import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortCard extends StatefulWidget {
  final Map<String, String> short;
  final double h;
  final double w;
  final bool autoPlay;

  const ShortCard({
    super.key,
    required this.short,
    required this.h,
    required this.w,
    this.autoPlay = false,
  });

  @override
  State<ShortCard> createState() => _ShortCardState();
}

class _ShortCardState extends State<ShortCard> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    if (widget.autoPlay) _initController();
  }

  void _initController() {
    _controller = VideoPlayerController.asset(widget.short['videoUrl']!)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller?.setLooping(true);
        _controller?.setVolume(0.0);
        _controller?.play();
      });
  }

  void _disposeController() {
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    _isInitialized = false;
  }

  @override
  void didUpdateWidget(covariant ShortCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.autoPlay && _controller == null) {
      _initController();
    } else if (!widget.autoPlay && _controller != null) {
      _disposeController();
    }
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.h,
      width: widget.w,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.autoPlay && _isInitialized)
              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller!.value.size.width,
                  height: _controller!.value.size.height,
                  child: VideoPlayer(_controller!),
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    widget.short['thumnailUrl']!,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.image, size: 2, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

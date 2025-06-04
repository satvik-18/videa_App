import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_app/shorts.dart';

class ShortCard extends StatefulWidget {
  final Map<String, String> short;
  final double h;
  final double w;

  const ShortCard({
    super.key,
    required this.short,
    required this.h,
    required this.w,
  });

  @override
  State<ShortCard> createState() => _ShortCardState();
}

class _ShortCardState extends State<ShortCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.h,
      width: widget.w,
      child: Card(color: Colors.black),
    );
  }
}

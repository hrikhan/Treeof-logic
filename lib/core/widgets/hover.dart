import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HoverRegion extends StatefulWidget {
  const HoverRegion({super.key, required this.builder, this.cursor});

  final Widget Function(BuildContext context, bool isHovered) builder;
  final MouseCursor? cursor;

  @override
  State<HoverRegion> createState() => _HoverRegionState();
}

class _HoverRegionState extends State<HoverRegion> {
  bool _isHovered = false;

  void _onEnter(PointerEnterEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor ?? SystemMouseCursors.click,
      onEnter: _onEnter,
      onExit: _onExit,
      child: widget.builder(context, _isHovered),
    );
  }
}

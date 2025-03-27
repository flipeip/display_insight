// from https://github.com/dtilhoo/ripple_wave/blob/master/lib/ripple_wave.dart

import 'package:flutter/material.dart';
import 'dart:math' as math show sqrt;

class Ondas extends StatefulWidget {
  const Ondas({
    super.key,
    this.color = Colors.teal,
    this.duration = const Duration(milliseconds: 1500),
    this.repeat = true,
    this.animationController,
    this.waveCount = 5,
    this.normalizeOpacity = true,
    this.offset = Offset.zero,
    this.strokeWidth = 4.0,
    this.offsetPadding = 0,
    required this.child,
  });

  ///Color of the ripple
  final Color color;

  ///General position of the ripple
  final Offset offset;

  ///Padding added to offset
  final double offsetPadding;

  ///Duration of the animation
  final Duration duration;

  ///Repeat the animation. True by default
  final bool repeat;

  ///optional animation controller to manually start or stop the animation
  final AnimationController? animationController;

  ///wave count
  final int waveCount;

  ///stroke width
  final double strokeWidth;

  //if the outer circles disappear
  final bool normalizeOpacity;

  final Widget child;

  @override
  OndasState createState() => OndasState();
}

class OndasState extends State<Ondas> with TickerProviderStateMixin {
  late AnimationController _controller;
  Size childSize = Size.zero;
  Widget? buildChild;

  @override
  void initState() {
    super.initState();
    _controller = widget.animationController ??
        AnimationController(
          duration: widget.duration,
          vsync: this,
        );

    if (widget.repeat) {
      _controller.repeat();
    } else if (widget.animationController == null) {
      _controller.forward();
      Future.delayed(widget.duration).then((value) => _controller.stop());
    }

    setState(() {
      buildChild = Builder(
        builder: (context) {
          calculateChildSize(context);
          return widget.child;
        },
      );
    });
  }

  void calculateChildSize(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.visitChildElements(
        (element) {
          final RenderBox renderBox = element.renderObject as RenderBox;
          setState(() {
            childSize = renderBox.size;
          });
        },
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RipplePainter(
        _controller,
        widget.waveCount,
        widget.normalizeOpacity,
        widget.strokeWidth,
        widget.offset,
        widget.offsetPadding,
        color: widget.color,
      ),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: <Color>[
                      widget.color,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (childSize.height * -0.5) + widget.offsetPadding,
            left: (childSize.width * -0.5) + widget.offsetPadding,
            child: buildChild ?? widget.child,
          ),
        ],
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  _RipplePainter(
    this.animation,
    this.waveCount,
    this.normalizeOpacity,
    this.strokeWidth,
    this.offset,
    this.posPadding, {
    required this.color,
  }) : super(repaint: animation);
  final Color color;
  final Animation<double> animation;
  final int waveCount;
  final bool normalizeOpacity;
  final double strokeWidth;
  final Offset offset;
  final double posPadding;

  void circle(Canvas canvas, Rect rect, double value) {
    final double maxRadius = math.sqrt(rect.longestSide * rect.longestSide +
        rect.shortestSide * rect.shortestSide);
    final double normalizedValue =
        value / (waveCount + 1); // Normalize value based on wave count
    final double radius =
        maxRadius * normalizedValue; // Scale radius based on normalized value
    final double opacity = (1.0 - normalizedValue)
        .clamp(0.0, 1.0); // Compute opacity based on normalized value
    final Color newColor = color.withAlpha((255.0 * opacity).round());

    final Paint paint = Paint()
      ..color = newColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
      offset + Offset(posPadding, posPadding),
      radius,
      paint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(
      0.0,
      0.0,
      size.width,
      size.height,
    );
    for (int wave = 0; wave <= waveCount; wave++) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(_RipplePainter oldDelegate) => true;
}

import 'package:flutter/material.dart';

class Quadriculado extends StatefulWidget {
  const Quadriculado({
    super.key,
    this.color = Colors.black,
    this.duration = const Duration(milliseconds: 1500),
    this.animationController,
    this.scale = 50,
  });

  ///Color of the ripple
  final Color color;

  final double scale;

  ///Duration of the animation
  final Duration duration;

  ///optional animation controller to manually start or stop the animation
  final AnimationController? animationController;

  @override
  QuadriculadoState createState() => QuadriculadoState();
}

class QuadriculadoState extends State<Quadriculado>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.animationController ??
        AnimationController(
          duration: widget.duration,
          vsync: this,
        );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _QuadriculadoPainter(
        _controller,
        scale: widget.scale,
        color: widget.color,
      ),
      child: Center(
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
    );
  }
}

class _QuadriculadoPainter extends CustomPainter {
  _QuadriculadoPainter(
    this.animation, {
    required this.color,
    required this.scale,
  }) : super(repaint: animation);

  final double scale;
  final Color color;
  final Animation<double> animation;

  void squares(Canvas canvas, Rect rect, double value) {
    final Paint paintDarker = Paint()
      ..color = color.withAlpha((color.a / 2 * 255).round());

    final Paint paintLigher = Paint()
      ..color = color.withAlpha((color.a / 4 * 255).round());

    // Animation
    canvas.translate(
      (scale * -2) + scale * value * 2,
      (scale * -2) + scale * value * 2,
    );

    // Draw the squares
    var y = 0.0;
    for (var j = 0; y < rect.height; j++) {
      y = j * scale;
      var x = 0.0;
      for (var i = 0; x < rect.width; i++) {
        x = i * scale;

        canvas.drawRect(
          Rect.fromLTWH(x * 2, y * 2, scale, scale),
          paintLigher,
        );
        canvas.drawRect(
          Rect.fromLTWH(x * 2 + scale, y * 2, scale, scale),
          paintDarker,
        );
        canvas.drawRect(
          Rect.fromLTWH(x * 2 + scale, (y * 2) + scale, scale, scale),
          paintLigher,
        );
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(
      0.0,
      0.0,
      size.width,
      size.height,
    );
    squares(canvas, rect, animation.value);
  }

  @override
  bool shouldRepaint(_QuadriculadoPainter oldDelegate) => true;
}

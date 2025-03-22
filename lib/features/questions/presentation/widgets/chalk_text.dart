// lib/features/test/presentation/widgets/chalk_text.dart
import 'package:flutter/material.dart';
import 'dart:math';

class ChalkText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final bool animate;
  final Duration duration;

  const ChalkText({
    Key? key,
    required this.text,
    required this.style,
    this.animate = true,
    this.duration = const Duration(milliseconds: 1500),
  }) : super(key: key);

  @override
  State<ChalkText> createState() => _ChalkTextState();
}

class _ChalkTextState extends State<ChalkText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final visibleLength = (widget.text.length * _animation.value).ceil();
        final visibleText = widget.text.substring(0, visibleLength);

        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: visibleText,
                style: widget.style,
              ),
              if (visibleLength < widget.text.length && _animation.value > 0.1)
                WidgetSpan(child: _buildChalkDust()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChalkDust() {
    return CustomPaint(
      size: const Size(10, 10),
      painter: ChalkDustPainter(
        color: widget.style.color ?? Colors.white,
        random: _random,
      ),
    );
  }
}

class ChalkDustPainter extends CustomPainter {
  final Color color;
  final Random random;

  ChalkDustPainter({
    required this.color,
    required this.random,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    // Dibujar partículas de tiza
    for (var i = 0; i < 5; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.2;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

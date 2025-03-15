import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  final double value;
  final Duration duration;
  final TextStyle style;
  final bool hasDecimal;
  final int decimalPlaces;

  const CounterAnimation({
    super.key,
    required this.value,
    this.duration = const Duration(seconds: 2),
    required this.style,
    this.hasDecimal = false,
    this.decimalPlaces = 1,
  });

  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late String _text;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(begin: 0, end: widget.value).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    )..addListener(() {
      setState(() {
        if (widget.hasDecimal) {
          _text = _animation.value.toStringAsFixed(widget.decimalPlaces);
        } else {
          _text = _animation.value.toInt().toString();
        }
      });
    });

    _controller.forward();

    // Inicializar el texto
    if (widget.hasDecimal) {
      _text = '0.${'0' * widget.decimalPlaces}';
    } else {
      _text = '0';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_text, style: widget.style);
  }
}

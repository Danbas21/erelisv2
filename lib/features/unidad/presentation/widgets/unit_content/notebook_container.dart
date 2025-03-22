// lib/presentation/widgets/unit_content/notebook_container.dart
import 'package:flutter/material.dart';

class NotebookContainer extends StatelessWidget {
  final Widget child;

  const NotebookContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: (.5)),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        // Líneas de cuaderno (horizontales y verticales)
        image: const DecorationImage(
          image: AssetImage('assets/images/notebook_pattern.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      margin: const EdgeInsets.all(16),
      child: child,
    );
  }
}

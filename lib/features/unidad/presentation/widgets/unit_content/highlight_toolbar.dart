// lib/presentation/widgets/unit_content/highlight_toolbar.dart
import 'package:flutter/material.dart';

class HighlightToolbar extends StatefulWidget {
  final Function(Color) onColorSelected;

  const HighlightToolbar({
    super.key,
    required this.onColorSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HighlightToolbarState createState() => _HighlightToolbarState();
}

class _HighlightToolbarState extends State<HighlightToolbar> {
  Color _selectedColor = const Color(0xFFF59E0B); // Naranja por defecto

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Herramientas de subrayado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _colorOption(const Color(0xFFF59E0B)), // Naranja
              const SizedBox(width: 12),
              _colorOption(const Color(0xFF22C55E)), // Verde
              const SizedBox(width: 12),
              _colorOption(const Color(0xFFFFD700)), // Amarillo
              const Spacer(),
              Tooltip(
                message: 'Selecciona texto para subrayar',
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Selecciona texto para subrayar',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _colorOption(Color color) {
    final isSelected = color == _selectedColor;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
        widget.onColorSelected(color);
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.3),
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                color: color,
                size: 20,
              )
            : null,
      ),
    );
  }
}

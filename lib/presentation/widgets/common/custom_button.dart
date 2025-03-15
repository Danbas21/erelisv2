import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, outlined, text }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.filled,
    this.width,
    this.height = 48.0,
    this.icon,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
        _controller.forward();
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
        _controller.reverse();
      }),
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) => _controller.reverse(),
        onTapCancel: () => _controller.reverse(),
        child: ScaleTransition(scale: _scaleAnimation, child: _buildButton()),
      ),
    );
  }

  Widget _buildButton() {
    switch (widget.type) {
      case ButtonType.filled:
        return _buildFilledButton();
      case ButtonType.outlined:
        return _buildOutlinedButton();
      case ButtonType.text:
        return _buildTextButton();
    }
  }

  Widget _buildFilledButton() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _isHovered
            ? (widget.backgroundColor ?? AppColors.primaryGreen).withValues(
                alpha: 0.9,
              )
            : widget.backgroundColor ?? AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(8),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: (widget.backgroundColor ?? AppColors.primaryGreen)
                      .withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: _buildButtonContent(widget.textColor ?? AppColors.textPrimary),
    );
  }

  Widget _buildOutlinedButton() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: _isHovered
              ? AppColors.primaryLightBlue
              : AppColors.primaryLightBlue
            ..withValues(alpha: 0.8),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: _buildButtonContent(
        widget.textColor ?? AppColors.primaryLightBlue,
      ),
    );
  }

  Widget _buildTextButton() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: _buildButtonContent(
        widget.textColor ?? AppColors.primaryLightBlue,
      ),
    );
  }

  Widget _buildButtonContent(Color textColor) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.isLoading ? null : widget.onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Center(
          child: widget.isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(textColor),
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(widget.icon, color: textColor, size: 20),
                      SizedBox(width: 8),
                    ],
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NeumorphicCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool isPressed;

  const NeumorphicCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.isPressed = false,
  });

  @override
  State<NeumorphicCard> createState() => _NeumorphicCardState();
}

class _NeumorphicCardState extends State<NeumorphicCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final baseColor = theme.colorScheme.surface;

    return GestureDetector(
      onTapDown: widget.onTap != null
          ? (_) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.onTap != null
          ? (_) {
              setState(() => _isPressed = false);
              widget.onTap?.call();
            }
          : null,
      onTapCancel: widget.onTap != null
          ? () => setState(() => _isPressed = false)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: widget.padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: (_isPressed || widget.isPressed)
              ? [
                  // Pressed state - inset shadows
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.5)
                        : Colors.black.withValues(alpha: 0.2),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: -2,
                  ),
                  BoxShadow(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.white.withValues(alpha: 0.8),
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: -2,
                  ),
                ]
              : [
                  // Normal state - raised shadows
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.6)
                        : Colors.black.withValues(alpha: 0.15),
                    offset: const Offset(8, 8),
                    blurRadius: 16,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.white.withValues(alpha: 0.9),
                    offset: const Offset(-8, -8),
                    blurRadius: 16,
                    spreadRadius: 0,
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}

class NeumorphicButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? color;

  const NeumorphicButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final buttonColor = widget.color ?? theme.colorScheme.primary;

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        _controller.forward();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _isPressed
                  ? [
                      buttonColor.withValues(alpha: 0.8),
                      buttonColor.withValues(alpha: 0.9),
                    ]
                  : [buttonColor, buttonColor.withValues(alpha: 0.85)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isPressed
                ? [
                    BoxShadow(
                      color: buttonColor.withValues(alpha: 0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: buttonColor.withValues(alpha: 0.4),
                      offset: const Offset(0, 8),
                      blurRadius: 16,
                    ),
                    BoxShadow(
                      color: isDark
                          ? Colors.black.withValues(alpha: 0.3)
                          : Colors.black.withValues(alpha: 0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

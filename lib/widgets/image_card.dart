import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String? imagePath;
  final IconData fallbackIcon;
  final Color fallbackColor;
  final double height;
  final double? width;
  final BorderRadius? borderRadius;
  final Widget? overlay;

  const ImageCard({
    super.key,
    this.imagePath,
    required this.fallbackIcon,
    required this.fallbackColor,
    this.height = 200,
    this.width,
    this.borderRadius,
    this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [fallbackColor, fallbackColor.withValues(alpha: 0.7)],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Try to load image, fallback to icon
          if (imagePath != null)
            ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(16),
              child: Image.asset(
                imagePath!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildFallback();
                },
              ),
            )
          else
            _buildFallback(),

          // Overlay
          if (overlay != null) overlay!,
        ],
      ),
    );
  }

  Widget _buildFallback() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [fallbackColor, fallbackColor.withValues(alpha: 0.7)],
        ),
      ),
      child: Center(
        child: Icon(
          fallbackIcon,
          size: 64,
          color: Colors.white.withValues(alpha: 0.9),
        ),
      ),
    );
  }
}

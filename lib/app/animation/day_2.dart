import 'package:flutter/material.dart';

class PowerButtonToggle extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const PowerButtonToggle({
    Key? key,
    this.initialValue = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<PowerButtonToggle> createState() => _PowerButtonToggleState();
}

class _PowerButtonToggleState extends State<PowerButtonToggle>
    with SingleTickerProviderStateMixin {
  bool _isChecked = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (_isChecked) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSwitch() {
    setState(() {
      _isChecked = !_isChecked;
    });

    if (_isChecked) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    widget.onChanged?.call(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggleSwitch,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isChecked
                      ? const Color(0xFF92B4B8)
                      : const Color(0xFF636363),
                  border: Border.all(
                    color: _isChecked
                        ? Colors.white
                        : const Color(0xFF7E7E7E),
                    width: 2,
                  ),
                  boxShadow: _isChecked
                      ? [
                          // Multiple inset-like shadows to simulate CSS inset shadows
                          BoxShadow(
                            color: const Color(0xFF97F3FF).withOpacity(0.3),
                            blurRadius: 1,
                            spreadRadius: -1,
                          ),
                          BoxShadow(
                            color: const Color(0xFF97F3FF).withOpacity(0.4),
                            blurRadius: 2,
                            spreadRadius: -2,
                          ),
                          BoxShadow(
                            color: const Color(0xFF97F3FF).withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: -8,
                          ),
                          // Outer glows
                          BoxShadow(
                            color: const Color(0xFF97F3FF).withOpacity(0.6),
                            blurRadius: 40,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: const Color(0xFF97F3FF).withOpacity(0.3),
                            blurRadius: 100,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: const Color(0xFF97F3FF).withOpacity(0.8),
                            blurRadius: 5,
                            spreadRadius: 0,
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: const Color(0xFF020202).withOpacity(0.8),
                            blurRadius: 3,
                            spreadRadius: -2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: CustomPaint(
                    size: const Size(70, 70),
                    painter: PowerIconPainter(
                      isChecked: _isChecked,
                      glowIntensity: _glowAnimation.value,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PowerIconPainter extends CustomPainter {
  final bool isChecked;
  final double glowIntensity;

  PowerIconPainter({
    required this.isChecked,
    required this.glowIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = isChecked ? Colors.white : const Color(0xFF303030);

    // Add glow effect when checked
    if (isChecked && glowIntensity > 0) {
      final glowPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = const Color(0xFF97F3FF).withOpacity(glowIntensity * 0.5)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5 * glowIntensity);
      
      _drawPowerIcon(canvas, size, glowPaint);
    }

    // Draw the main icon
    _drawPowerIcon(canvas, size, paint);
  }

  void _drawPowerIcon(Canvas canvas, Size size, Paint paint) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    const iconSize = 1.2 * 16; // 1.2em equivalent to 16px base
    final scale = iconSize / 512; // Scale from SVG viewBox 512x512

    // Transform the SVG path coordinates to fit our icon size
    final transform = Matrix4.identity()
      ..translate(center.dx - (512 * scale) / 2, center.dy - (512 * scale) / 2)
      ..scale(scale);

    // Vertical line (power button line)
    path.moveTo(288, 32);
    path.cubicTo(288, 14.3, 273.7, 0, 256, 0);
    path.cubicTo(238.3, 0, 224, 14.3, 224, 32);
    path.lineTo(224, 256);
    path.cubicTo(224, 273.7, 238.3, 288, 256, 288);
    path.cubicTo(273.7, 288, 288, 273.7, 288, 256);
    path.lineTo(288, 32);
    path.close();

    // Arc (power button arc)
    path.moveTo(143.5, 120.6);
    path.cubicTo(157.1, 109.3, 158.9, 89.1, 147.6, 75.5);
    path.cubicTo(136.3, 61.9, 116.1, 60.1, 102.5, 71.4);
    path.cubicTo(49.7, 115.4, 16, 181.8, 16, 256);
    path.cubicTo(16, 388.5, 123.5, 496, 256, 496);
    path.cubicTo(388.5, 496, 496, 388.5, 496, 256);
    path.cubicTo(496, 181.8, 462.2, 115.4, 409.4, 71.4);
    path.cubicTo(395.8, 60.1, 375.6, 61.9, 364.3, 75.5);
    path.cubicTo(353.0, 89.1, 354.9, 109.3, 368.5, 120.6);
    path.cubicTo(407.4, 152.9, 432, 201.6, 432, 256);
    path.cubicTo(432, 353.2, 353.2, 432, 256, 432);
    path.cubicTo(158.8, 432, 80, 353.2, 80, 256);
    path.cubicTo(80, 201.6, 104.7, 152.9, 143.5, 120.6);
    path.close();

    // Apply transformation and draw
    canvas.drawPath(path.transform(transform.storage), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is PowerIconPainter &&
        (oldDelegate.isChecked != isChecked ||
            oldDelegate.glowIntensity != glowIntensity);
  }
}
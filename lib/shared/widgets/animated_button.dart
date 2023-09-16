import 'package:flutter/material.dart';

import '../../app/app_constants.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  const AnimatedButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  State<AnimatedButton> createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: animationDuration);
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: widget.onTap == null
          ? null
          : (_) {
              _animationController.forward();
            },
      onTapUp: widget.onTap == null
          ? null
          : (_) {
              _animationController.reverse();
            },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, __) {
            return Transform.scale(scale: _animation.value, child: widget.child);
          }),
    );
  }
}

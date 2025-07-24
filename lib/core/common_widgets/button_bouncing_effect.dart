import 'package:flutter/material.dart';

class ButtonBouncingEffect extends StatefulWidget {
  const ButtonBouncingEffect({
    super.key,
    required this.child,
    this.onTap,
    this.fromSettingScreen = false,
    this.withSoundEffect = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool fromSettingScreen;
  final bool withSoundEffect;

  @override
  State<ButtonBouncingEffect> createState() => _ButtonBouncingEffectState();
}

class _ButtonBouncingEffectState extends State<ButtonBouncingEffect> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.95),
      onTapUp: (_) async {
        setState(() => _scale = 1.0);

        widget.onTap?.call();
      },
      onDoubleTap: () async {
        setState(() => _scale = 1.0);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        child: widget.child,
      ),
    );
  }
}

Future giveHapticFeedback({bool twoTimes = false}) async {
  return;
}

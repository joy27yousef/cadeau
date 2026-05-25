import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class FollowBottom extends StatefulWidget {
  final bool isFollowing;
  final void Function() ontapfun;
  final String text;
  final bool isLoading;

  const FollowBottom({
    super.key,
    required this.ontapfun,
    required this.text,
    this.isLoading = false,
    required this.isFollowing,
  });

  @override
  State<FollowBottom> createState() => _BoxtextState();
}

class _BoxtextState extends State<FollowBottom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    if (widget.isLoading) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant FollowBottom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isLoading && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // جعل الزر غير قابل للضغط فقط وقت الـ Loading لمنع تكرار الـ Requests للسيرفر بشكل عشوائي
    return IgnorePointer(
      ignoring: widget.isLoading,
      child: Material(
        // إضافة Material لضمان ظهور تأثير الـ Ripple الخاص بالـ InkWell
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.ontapfun,
          borderRadius: BorderRadius.circular(10),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              Widget buttonContent = Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: widget.isFollowing
                      ? AppColor.mainColor
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: widget.isFollowing
                          ? Colors.white
                          : AppColor.mainColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              );

              if (widget.isLoading) {
                return ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment(-2.0 + 4 * _controller.value, 0),
                      end: Alignment(2.0 + 4 * _controller.value, 0),
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.0),
                      ],
                      stops: const [0.3, 0.5, 0.7],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.srcATop,
                  child: buttonContent,
                );
              }

              return buttonContent;
            },
          ),
        ),
      ),
    );
  }
}

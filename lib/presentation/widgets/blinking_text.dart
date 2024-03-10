import 'package:flutter/material.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class BlinkingText extends StatefulWidget {
  const BlinkingText({super.key, required this.text});
  final String text;

  @override
  State<BlinkingText> createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Text(
        widget.text,
        style: TextStyle(
            fontFamily: FontFamily.urbanistSemiBold,
            fontSize: 10,
            color: AppColors.greenColor),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

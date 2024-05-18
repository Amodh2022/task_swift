import 'package:flutter/material.dart';
import 'package:task_swift/constants/color.dart';

class TaskSwiftButton extends StatelessWidget {
  final String? data;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const TaskSwiftButton(this.data,
      {super.key, this.height, this.width, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: AppColors.buttonColor, borderRadius: BorderRadius.circular(4)),
      child: Text(
        data!,
        style: const TextStyle(
          color: AppColors.pageIndicatorColorActive,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

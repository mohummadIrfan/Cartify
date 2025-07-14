import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? prevFocusNode;

  const OTPInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.prevFocusNode,
  });

  @override
  State<OTPInputField> createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_update);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_update);
    super.dispose();
  }

  void _update() {
    setState(() {}); // Rebuild to reflect border color change
  }

  @override
  Widget build(BuildContext context) {
    final bool isFilled = widget.controller.text.isNotEmpty;

    return Container(
      height: 48.h,
      width: 48.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: isFilled ? AppColors.yellowColor : AppColors.greyColor,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: 1,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        cursorHeight: 15.h, // 👈 Adjust height as needed
        cursorWidth: 2.w, // 👈 Adjust width as needed
        cursorColor: AppColors.blackColor, // Optional: keep it consistent
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          isCollapsed: true,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            widget.nextFocusNode?.requestFocus();
          }
        },
        onSubmitted: (_) {
          widget.nextFocusNode?.requestFocus();
        },
        onEditingComplete: () {
          if (widget.controller.text.isEmpty && widget.prevFocusNode != null) {
            widget.prevFocusNode!.requestFocus();
          }
        },
        onTap: () {
          widget.controller.selection = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length),
          );
        },
      ),
    );
  }
}

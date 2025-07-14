import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? obscureText;
  final Color? fillColor;
  final VoidCallback? onPrefixIconTap;
  final VoidCallback? onSuffixIconTap;
  final Widget? prefixIcon; // ✅ Changed from String to Widget
  final Widget? suffixIcon; // ✅ Changed from String to Widget
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? hintColor;
  final double? horizontal;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final Function()? onTap;
  final TextInputType keyboardType;
  final Color? borderColor;
  final int? maxLines;
  final Color? suffixIconColor;
  final double? verContentPadding;
  final double? suffixheight;
  final double? borderRadius;
  final double? suffixwidth;
  final EdgeInsetsGeometry? textFieldMargin;
  final bool? isSearch;
  final Color? cursorColor;
  final Color? prefixIconColor;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.horizontal,
    this.obscureText,
    this.fillColor,
    this.borderRadius,
    this.onPrefixIconTap,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.width,
    this.suffixheight,
    this.suffixwidth,
    this.textColor,
    this.hintColor,
    this.onChanged,
    this.borderColor,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.suffixIconColor,
    this.verContentPadding,
    this.onSuffixIconTap,
    this.textFieldMargin,
    this.isSearch,
    this.cursorColor,
    this.prefixIconColor,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (FormFieldState<String> fieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height ?? 56.h,
              width: width ?? 327.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
                border: Border.all(color: Colors.transparent, width: 1),
              ),
              child: TextField(
                controller: controller,
                onChanged: (val) {
                  onChanged?.call(val);
                  fieldState.didChange(val);
                },
                obscureText: obscureText ?? false,
                keyboardType: keyboardType,
                readOnly: readOnly,
                textAlignVertical: TextAlignVertical.center,
                onTap: onTap,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: cursorColor ?? AppColors.blackColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fillColor ?? const Color(0xffFAFAFA),
                  hintText: hintText ?? '',
                  hintStyle: GoogleFonts.inter(
                    color: hintColor ?? const Color(0xffA29FA6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  errorStyle: const TextStyle(height: 0),
                  suffixIconConstraints: BoxConstraints(
                    minHeight: 16.5.h,
                    minWidth: 16.5.w,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 16.5.h,
                    minWidth: 16.5.w,
                  ),

                  // ✅ Now supports Widget: Icon() or Image.asset()
                  prefixIcon:
                      prefixIcon == null
                          ? null
                          : GestureDetector(
                            onTap: onPrefixIconTap,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 5.0.h,
                              ),
                              child: SizedBox(
                                height: 14.h, // 🔒 Restrict size
                                width: 14.w,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: prefixIcon!,
                                ),
                              ),
                            ),
                          ),

                  suffixIcon:
                      suffixIcon == null
                          ? null
                          : GestureDetector(
                            onTap: onSuffixIconTap,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontal ?? 14.w,
                                vertical: 5.0.h,
                              ),
                              child: SizedBox(
                                height: 14.h,
                                width: 14.w,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: suffixIcon!,
                                ),
                              ),
                            ),
                          ),

                  contentPadding: EdgeInsets.symmetric(
                    vertical: verContentPadding ?? 14.h,
                    horizontal: 16.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.transparent,
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                    borderSide: BorderSide(
                      color: borderColor ?? const Color(0xffEBEAEC),
                      width: 1.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
                    borderSide: BorderSide(
                      color: borderColor ?? const Color(0xffEBEAEC),
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            fieldState.hasError
                ? Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    fieldState.errorText ?? '',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: Colors.red,
                    ),
                  ),
                )
                : SizedBox(
                  height: 16.h,
                ), // reserved space for consistent height
          ],
        );
      },
    );
  }
}

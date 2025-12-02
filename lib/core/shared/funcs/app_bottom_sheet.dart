import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future appBottomSheet(
  BuildContext context, {
  bool dismiss = true,
  // bool enableDrag = true,
  double? marginLeft,
  double? marginRight,
  Color? backgroundColor,
  // 1. Allow static widget (Optional)
  Widget? child,
  // 2. Allow builder function (Optional)
  Widget Function(BuildContext context)? builder,
}) {
  // SAFETY: Ensure at least one is provided
  assert(
    child != null || builder != null,
    'You must provide either a child or a builder',
  );
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: dismiss, // !! prevent tap outside to close
    enableDrag: dismiss, // !! prevent swipe down to close
    // enableDrag: enableDrag,
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (sheetContext) {
      return PopScope(
        canPop: dismiss,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: marginLeft ?? 16.w,
              right: marginRight ?? 16.w,
              bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
            ),
            child: builder != null ? builder(sheetContext) : child!,
          ),
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final Widget? titleWidget;
  final String title;
  final bool showLeading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.height,
    required this.title,
    this.titleWidget,
    this.showLeading = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: showLeading
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new))
          : null,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: titleWidget ?? Text(title, style: AppTextStyles.font18w600Black),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70.h);
}

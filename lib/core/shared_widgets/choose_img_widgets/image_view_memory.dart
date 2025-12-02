import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageViewMemory extends StatelessWidget {
  final File photoFile;
  final VoidCallback? onPressedDelete;
  const ImageViewMemory({
    super.key,
    required this.photoFile,
    this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.file(
                photoFile,
                fit: BoxFit.fill,
              ),
            ),
          ),
          if (onPressedDelete != null)
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.red, size: 20.sp),
                onPressed: onPressedDelete,
              ),
            ),
        ],
      ),
    );
  }
}

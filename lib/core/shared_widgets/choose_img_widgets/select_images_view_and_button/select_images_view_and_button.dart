import 'dart:io';

import 'package:citizen_service_platform/core/shared_widgets/choose_img_widgets/image_view_memory.dart';
import 'package:citizen_service_platform/core/shared_widgets/choose_img_widgets/select_images_view_and_button/image_choose_button_grid.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectImagesViewAndButton extends StatefulWidget {
  final Function(List<File>) onSaved;
  final List<File>? selectedImages;

  final String title;
  final Color? borderColor;

  const SelectImagesViewAndButton({
    super.key,
    this.borderColor,
    required this.onSaved,
    required this.title,
    this.selectedImages,
  });

  @override
  State<SelectImagesViewAndButton> createState() =>
      _SelectImagesViewAndButtonState();
}

class _SelectImagesViewAndButtonState extends State<SelectImagesViewAndButton> {
  List<File> images = [];
  void addImage(List<File> files) {
    images.insertAll(0, files);
    setState(() {});
    widget.onSaved(images);
  }

  void removeImage(int index) {
    images.removeAt(index);
    setState(() {});
    widget.onSaved(images);
  }

  @override
  void initState() {
    images = widget.selectedImages ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        Container(
          height: images.length > 2 ? 270.h : 140.h,
          width: double.infinity,
          padding: EdgeInsets.all(8.w),
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
            // color: Colors.black12,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: widget.borderColor ?? AppColors.bodercolorTextFormEnable,
              width: 1.5.w,
            ),
          ),
          child: images.isEmpty
              ? Center(
                  child: ImageChooseButtonGrid(
                    onPressed: addImage,
                    boderColor: Colors.transparent,
                  ),
                )
              : GridView.builder(
                  itemCount: images.length + 1,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: images.length > 2 ? 2 : 1,
                    childAspectRatio: 1,
                    mainAxisSpacing: 8.w,
                    crossAxisSpacing: 8.w,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ImageChooseButtonGrid(onPressed: addImage);
                    }
                    return ImageViewMemory(
                      photoFile: images[index - 1],
                      onPressedDelete: () {
                        removeImage(index - 1);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/choose_img_widgets/select_images_view_and_button/select_images_view_and_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectImagesViewAndButtonFormFeild extends StatelessWidget {
  final Function(List<File>) onSaved;
  final List<File>? selectedImages;

  final String title;
  final Color? borderColor;
  const SelectImagesViewAndButtonFormFeild({
    super.key,
    required this.onSaved,
    required this.title,
    this.borderColor,
    this.selectedImages,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<List<File>>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.pleaseSelectAtLeastOneImage.tr();
        }
        if (value.length > 5) {
          return LocaleKeys.maxmiumFivePhotosAllowed.tr();
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectImagesViewAndButton(
              title: title,
              selectedImages: selectedImages,
              onSaved: (List<File> v) {
                // Save paths or files
                onSaved(v);

                // Save to form field
                field.didChange(v);
              },
              borderColor: field.hasError ? Colors.red : null,
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
//!example use 
    // SelectImagesViewAndButtonFormFeild(
    //             title: LocaleKeys.malfunctionImages.tr(),
    //             selectedImages: cubit.selectedImages,
    //             onSaved: (v) {
    //               cubit.setSelectedImages(v);
    //               logger.e("v: $v");
    //             },
    //           ),
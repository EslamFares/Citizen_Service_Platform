import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class ChooseImg {
  static Future imagePickerDialog(
      {Function(File file)? onSubmit,
      bool withCrop = false,
      Function(List<File> file)? onSubmitMulti,
      bool isSingleImg = false,
      required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    ImagePicker pick = ImagePicker();
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoButton(
            child: const Text("cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            CupertinoButton(
              child: const Row(
                children: <Widget>[
                  Icon(CupertinoIcons.photo_camera_solid),
                  SizedBox(width: 20),
                  Text("camera"),
                ],
              ),
              onPressed: () async {
                if (context.mounted) Navigator.pop(context);
                XFile? pickedFile = await pick.pickImage(
                    source: ImageSource.camera, maxWidth: 400);

                if (pickedFile != null) {
                  // if (context.mounted) Navigator.pop(context);

                  if (onSubmit != null) onSubmit(File(pickedFile.path));
                  if (onSubmitMulti != null) {
                    onSubmitMulti([File(pickedFile.path)]);
                  }
                }
              },
            ),
            CupertinoButton(
              child: const Row(
                children: <Widget>[
                  Icon(Icons.insert_photo),
                  SizedBox(width: 20),
                  Text('gallery'),
                ],
              ),
              onPressed: () async {
                if (onSubmitMulti != null) {
                  if (context.mounted) Navigator.pop(context);
                  List<XFile> result = await pick.pickMultiImage();

                  if (result.isNotEmpty) {
                    // if (context.mounted) Navigator.pop(context);
                    onSubmitMulti(List.generate(
                        result.length, (index) => File(result[index].path)));
                  }
                } else if (onSubmit != null) {
                  XFile? pickedFile = await pick.pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 400,
                  );
                  if (pickedFile != null) {
                    // if (context.mounted) Navigator.pop(context);
                    onSubmit(File(pickedFile.path));
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
//!use
  //  List<File> image = [];
  //     await AppAlert.init.imagePickerDialog(
  //       context: context,
  //       onSubmitMulti: (List<File> file) {
  //         image = file;
  //       },
  //     );
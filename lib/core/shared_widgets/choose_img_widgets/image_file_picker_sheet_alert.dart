import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
  DEPENDENCIES:
  image_picker: ^1.0.0
  file_picker: ^8.0.0

  ---------------------------------------------------------
  ANDROID PERMISSIONS (android/app/src/main/AndroidManifest.xml):
  <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
  <uses-permission android:name="android.permission.CAMERA"/>
if(edit)
  <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
  ---------------------------------------------------------
  IOS PERMISSIONS (ios/Runner/Info.plist):
  <key>NSPhotoLibraryUsageDescription</key>
  <string>This app requires access to the photo library to upload profile pictures.</string>
  <key>NSCameraUsageDescription</key>
  <string>This app requires access to the camera to take photos for documentation.</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>This app requires access to the microphone if you record videos.</string>
  <key>UIBackgroundModes</key>
  <array>
     <string>fetch</string>
  </array>
  ---------------------------------------------------------
*/
abstract class ImageFilePickerSheetAlert {
  static Future<void> show({
    required BuildContext context,
    Function(File file)? onSubmit,
    Function(List<File> files)? onSubmitMulti,
    bool selectFile = true,
    List<String> allowedFileExtensions = const ['pdf'],
  }) async {
    FocusScope.of(context).unfocus();
    final ImagePicker picker = ImagePicker();

    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          if (selectFile)
            _buildAction(
              context: context,
              label: "Pdf",
              icon: CupertinoIcons.doc_fill,
              onTap: () => _handleFilePick(
                onSubmit,
                onSubmitMulti,
                allowedFileExtensions,
              ),
            ),
          _buildAction(
            context: context,
            label: "Camera",
            icon: CupertinoIcons.photo_camera_solid,
            onTap: () => _handleCamera(picker, onSubmit, onSubmitMulti),
          ),
          _buildAction(
            context: context,
            label: "Gallery",
            icon: CupertinoIcons.photo_fill,
            onTap: () => _handleGallery(picker, onSubmit, onSubmitMulti),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  /// Helper to create consistent Action Rows
  static Widget _buildAction({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return CupertinoActionSheetAction(
      onPressed: () {
        Navigator.pop(context);
        onTap();
      },
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.blue),
          const SizedBox(width: 15),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  /// Logic for picking Documents
  static Future<void> _handleFilePick(
    Function(File)? onSingle,
    Function(List<File>)? onMulti,
    List<String> allowedFileExtensions,
  ) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: onMulti != null,
      type: FileType.custom,
      allowedExtensions: allowedFileExtensions,
    );

    if (result == null || result.files.isEmpty) return;
    final files = result.files
        .where((f) => f.path != null)
        .map((f) => File(f.path!))
        .toList();

    if (onMulti != null) {
      onMulti(files);
    } else if (onSingle != null) {
      onSingle(files.first);
    }
  }

  /// Logic for Camera (Always returns one, but can trigger multi callback)
  static Future<void> _handleCamera(
    ImagePicker picker,
    Function(File)? onSingle,
    Function(List<File>)? onMulti,
  ) async {
    final XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
    );
    if (photo == null) return;

    final file = File(photo.path);
    if (onMulti != null) {
      onMulti([file]);
    } else if (onSingle != null) {
      onSingle(file);
    }
  }

  /// Logic for Gallery
  static Future<void> _handleGallery(
    ImagePicker picker,
    Function(File)? onSingle,
    Function(List<File>)? onMulti,
  ) async {
    if (onMulti != null) {
      final List<XFile> photos = await picker.pickMultiImage(maxWidth: 800);
      if (photos.isNotEmpty) {
        onMulti(photos.map((p) => File(p.path)).toList());
      }
    } else if (onSingle != null) {
      final XFile? photo = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
      );
      if (photo != null) onSingle(File(photo.path));
    }
  }
}

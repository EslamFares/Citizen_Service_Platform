part of '../app_image.dart';

class CheckImageType {
  static bool isSvg(String path) =>
      path.isNotEmpty && path.toLowerCase().endsWith('.svg');
  static bool isNetworkImage(String path) =>
      path.isNotEmpty &&
      (path.toLowerCase().startsWith('http') ||
          path.toLowerCase().startsWith('https'));
  static bool isFileImage(String path) =>
      path.isNotEmpty &&
      (path.toLowerCase().startsWith('file://') ||
          path.toLowerCase().startsWith('/data/user'));

  static bool isAssetImage(String path) =>
      path.isNotEmpty &&
      (path.toLowerCase().endsWith('.png') ||
          path.toLowerCase().endsWith('.jpg') ||
          path.toLowerCase().endsWith('.jpeg'));
}

// enum ImageType {
//   svg,
//   network,
//   file, // file:// || /data/user
//   asset, // png, jpg, jpeg
//   unknown;

//   static ImageType fromPath(String path) {
//     final lowerPath = path.toLowerCase().trim();

//     if (lowerPath.startsWith('http://') || lowerPath.startsWith('https://')) {
//       return ImageType.network;
//     }
//     if (lowerPath.endsWith('.svg')) {
//       return ImageType.svg;
//     }
//     if (lowerPath.startsWith('file://') || lowerPath.contains('/data/user/')) {
//       return ImageType.file;
//     }
//     if (lowerPath.endsWith('.png') ||
//         lowerPath.endsWith('.jpg') ||
//         lowerPath.endsWith('.jpeg')) {
//       return ImageType.asset;
//     } else {
//       return ImageType.unknown;
//     }
//   }
// }

// extension ImageTypeX on ImageType {
//   bool get isSvg => this == ImageType.svg;

//   bool get isAsset => this == ImageType.asset;

//   bool get isNetwork => this == ImageType.network;

//   bool get isFile => this == ImageType.file;

//   bool get isUnknown => this == ImageType.unknown;

//   String get name => toString().split('.').last;
// }

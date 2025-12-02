part of '../app_image.dart';

class AppImageAsset extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final Color? colorImage;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? colorShimmer;
  final Widget? shimmerWidget;
  final Widget? errorWidget;
  final Color? colorError;
  final IconData? errorIcon;
  final Alignment? alignment;
  final BoxFit? boxFit;
  const AppImageAsset(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.colorImage,
    this.borderRadius,
    this.radius,
    this.colorShimmer,
    this.shimmerWidget,
    this.errorWidget,
    this.colorError,
    this.errorIcon,
    this.alignment,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    if (CheckImageType.isSvg(imageUrl)) {
      return AppImageAssetSvg(
        imageUrl: imageUrl,
        height: height,
        width: width,
        colorImage: colorImage,
        borderRadius: borderRadius,
        radius: radius,
        colorShimmer: colorShimmer,
        shimmerWidget: shimmerWidget,
        errorWidget: errorWidget,
        colorError: colorError,
        errorIcon: errorIcon,
        alignment: alignment,
        boxFit: boxFit,
      );
    } else if (CheckImageType.isAssetImage(imageUrl)) {
      return Image.asset(
        imageUrl,
        height: height ?? _constImageHeight,
        width: width ?? _constImageWidth,
        color: colorImage,
        errorBuilder: (context, error, stackTrace) =>
            _AppNetworkImageErrorWidget(
              width: width,
              height: height,
              borderRadius: borderRadius,
              radius: radius,
              errorWidget: errorWidget,
              color: colorError,
              errorIcon: errorIcon,
            ),
        alignment: alignment ?? Alignment.center,
        fit: boxFit ?? BoxFit.none,
      );
    } else if (CheckImageType.isFileImage(imageUrl)) {
      return Image.file(
        File(imageUrl),
        height: height ?? _constImageHeight,
        width: width ?? _constImageWidth,
        color: colorImage,
        errorBuilder: (context, error, stackTrace) =>
            _AppNetworkImageErrorWidget(
              width: width,
              height: height,
              borderRadius: borderRadius,
              radius: radius,
              errorWidget: errorWidget,
              color: colorError,
              errorIcon: errorIcon,
            ),
        alignment: alignment ?? Alignment.center,
        fit: boxFit ?? BoxFit.none,
      );
    } else {
      return _AppNetworkImageErrorWidget(
        width: width,
        height: height,
        borderRadius: borderRadius,
        radius: radius,
        errorWidget: errorWidget,
        color: colorError,
        errorIcon: errorIcon,
      );
    }
  }
}

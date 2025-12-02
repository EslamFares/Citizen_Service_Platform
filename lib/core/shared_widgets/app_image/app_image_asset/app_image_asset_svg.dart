part of '../app_image.dart';

class AppImageAssetSvg extends StatelessWidget {
  const AppImageAssetSvg({
    super.key,
    required this.imageUrl,
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

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageUrl,
      height: height ?? _constImageHeight,
      width: width ?? _constImageWidth,
      colorFilter: colorImage != null
          ? ColorFilter.mode(colorImage!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (context) => _AppNetworkImagePlaceholderShimmerWidget(
        borderRadius:
            borderRadius ?? BorderRadius.circular(radius ?? _constImageRadius),
        height: height ?? _constImageHeight,
        width: width ?? _constImageWidth,
        radius: radius,
        color: colorShimmer,
        shimmerWidget: shimmerWidget,
      ),
      errorBuilder: (context, error, stackTrace) => _AppNetworkImageErrorWidget(
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
  }
}

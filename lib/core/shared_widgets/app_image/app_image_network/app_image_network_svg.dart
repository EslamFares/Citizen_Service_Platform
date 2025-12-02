part of '../app_image.dart';

class AppImageNetworkSvg extends StatelessWidget {
  const AppImageNetworkSvg({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.colorImage,
    required this.borderRadius,
    required this.radius,
    required this.colorShimmer,
    required this.shimmerWidget,
    required this.errorWidget,
    required this.colorError,
    required this.errorIcon,
    required this.alignment,
    required this.boxFit,
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
    return SvgPicture.network(
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

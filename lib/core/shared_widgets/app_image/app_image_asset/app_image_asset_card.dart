part of '../app_image.dart';

class AppImageAssetCard extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  final BorderRadius? borderRadius;
  final double? aspectRatio;
  final BoxFit? boxFit;
  final double? elevation;
  final String? cacheKey;
  final Widget? errorWidget;
  final Color? colorImage;
  final Color? cardColor;
  final Color? colorError;
  final Color? colorShimmer;
  final Alignment? alignment;
  final ImageWidgetBuilder? imageBuilder;
  final Widget? shimmerWidget;
  final IconData? errorIcon;
  final Function(Object)? errorListener;

  const AppImageAssetCard(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.radius,
    this.aspectRatio,
    this.boxFit,
    this.elevation,
    this.borderRadius,
    this.cacheKey,
    this.errorWidget,
    this.colorImage,
    this.colorError,
    this.colorShimmer,
    this.alignment,
    this.imageBuilder,
    this.shimmerWidget,
    this.errorIcon,
    this.errorListener,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return _AppImageCardView(
      height: height,
      width: width,
      aspectRatio: aspectRatio,
      boxFit: boxFit,
      elevation: elevation,
      borderRadius: borderRadius,
      radius: radius,
      cardColor: cardColor,
      child: AppImageAsset(
        imageUrl,
        boxFit: boxFit,
        borderRadius: borderRadius,
        radius: radius,
        height: height,
        width: width,
        errorWidget: errorWidget,
        colorError: colorError,
        colorImage: colorImage,
        colorShimmer: colorShimmer,
        alignment: alignment,
        shimmerWidget: shimmerWidget,
        errorIcon: errorIcon,
      ),
    );
  }
}

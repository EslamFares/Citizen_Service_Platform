part of '../app_image.dart';

class AppImageNetwork extends StatelessWidget {
  final String imageUrl;
  final BoxFit? boxFit;
  final BorderRadius? borderRadius;
  final double? radius;
  final double? height;
  final double? width;
  final String? cacheKey;
  final Widget? errorWidget;
  final Color? colorImage;
  final Color? colorError;
  final Color? colorShimmer;
  final Alignment? alignment;
  final ImageWidgetBuilder? imageBuilder;
  final Widget? shimmerWidget;
  final IconData? errorIcon;
  final Function(Object)? errorListener;

  const AppImageNetwork(
    this.imageUrl, {
    super.key,
    this.boxFit = BoxFit.fill,
    this.borderRadius,
    this.radius,
    this.height,
    this.width,
    this.cacheKey,
    this.errorWidget,
    this.errorIcon,
    this.colorError,
    this.colorImage,
    this.colorShimmer,
    this.alignment,
    this.imageBuilder,
    this.shimmerWidget,
    this.errorListener,
  });
  @override
  Widget build(BuildContext context) {
    if (CheckImageType.isSvg(imageUrl)) {
      return AppImageNetworkSvg(
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
    } else {
      return CachedNetworkImage(
        alignment: alignment ?? Alignment.center,
        color: colorImage,
        imageUrl: imageUrl,
        cacheKey: cacheKey,
        fit: boxFit,
        height: height ?? _constImageHeight,
        width: width ?? _constImageWidth,
        imageBuilder: imageBuilder,
        placeholder: (context, url) => _AppNetworkImagePlaceholderShimmerWidget(
          borderRadius:
              borderRadius ??
              BorderRadius.circular(radius ?? _constImageRadius),
          height: height ?? _constImageHeight,
          width: width ?? _constImageWidth,
          radius: radius,
          color: colorShimmer,
          shimmerWidget: shimmerWidget,
        ),
        errorWidget: (context, url, error) => _AppNetworkImageErrorWidget(
          width: width,
          height: height,
          borderRadius: borderRadius,
          radius: radius,
          errorWidget: errorWidget,
          color: colorError,
          errorIcon: errorIcon,
        ),
        errorListener:
            errorListener ??
            (e) {
              //handel exception showen
              if (e is SocketException) {
                logPro.e('Error with ${e.address} and message ${e.message}');
              } else {
                logPro.e('Image Exception is: $e ::: ${e.runtimeType}');
              }
            },
      );
    }
  }
}

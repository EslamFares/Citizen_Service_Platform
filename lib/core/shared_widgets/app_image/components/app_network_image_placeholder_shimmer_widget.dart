part of '../app_image.dart';

class _AppNetworkImagePlaceholderShimmerWidget extends StatelessWidget {
  const _AppNetworkImagePlaceholderShimmerWidget({
    this.borderRadius,
    this.height,
    this.width,
    this.color,
    this.radius,
    this.shimmerWidget,
  });
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final Widget? shimmerWidget;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: _constImageShimmerColorBg,
      ignoreContainers: false,
      child: Container(
        height: height ?? _constImageHeight,
        width: width ?? _constImageWidth,
        decoration: BoxDecoration(
          color: _constImageShimmerColorBg,
          borderRadius:
              borderRadius ??
              BorderRadius.circular(radius ?? _constImageRadius),
        ),
        child:
            shimmerWidget ??
            Icon(
              Icons.image,
              size: width != null ? width! * .5 : null,
              color: Colors.grey,
            ),
      ),
    );
  }
}

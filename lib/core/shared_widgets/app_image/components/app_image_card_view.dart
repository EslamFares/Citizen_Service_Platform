part of '../app_image.dart';

class _AppImageCardView extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? radius;
  final BorderRadius? borderRadius;
  final double? aspectRatio;
  final BoxFit? boxFit;
  final double? elevation;
  final Color? cardColor;

  const _AppImageCardView({
    required this.child,
    this.height,
    this.width,
    this.radius,
    this.borderRadius,
    this.aspectRatio,
    this.boxFit,
    this.elevation,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? _constImageHeight,
      width: width ?? _constImageWidth,
      child: Card(
        color: cardColor ?? Colors.transparent,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ??
              BorderRadius.circular(radius ?? _constImageRadius),
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio ?? 16 / 9,
          child: ClipRRect(
            borderRadius:
                borderRadius ??
                BorderRadius.circular(radius ?? _constImageRadius),
            child: child,
          ),
        ),
      ),
    );
  }
}

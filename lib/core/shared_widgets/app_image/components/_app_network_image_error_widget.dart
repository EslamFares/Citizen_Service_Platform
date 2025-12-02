part of '../app_image.dart';

class _AppNetworkImageErrorWidget extends StatelessWidget {
  const _AppNetworkImageErrorWidget({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.radius,
    this.errorWidget,
    this.color,
    this.errorIcon,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final double? radius;
  final Widget? errorWidget;
  final IconData? errorIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? _constImageErrorColorBg,
        borderRadius:
            borderRadius ?? BorderRadius.circular(radius ?? _constImageRadius),
      ),
      child: errorWidget ??
          Icon(
            errorIcon ?? Icons.image,
            size: width != null ? width! * .6 : null,
            color: Colors.grey[300],
          ),
    );
  }
}

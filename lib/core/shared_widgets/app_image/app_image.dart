import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'app_image_asset/app_image_asset.dart';
part 'app_image_asset/app_image_asset_card.dart';
part 'app_image_asset/app_image_asset_svg.dart';
part 'app_image_card.dart';
part 'app_image_network/app_image_network.dart';
part 'app_image_network/app_image_network_card.dart';
part 'app_image_network/app_image_network_svg.dart';
part 'components/_app_network_image_error_widget.dart';
part 'components/app_image_card_view.dart';
part 'components/app_network_image_constants.dart';
part 'components/app_network_image_placeholder_shimmer_widget.dart';
part 'components/check_image_type.dart';

class AppImage extends StatelessWidget {
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
  const AppImage(
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
    if (CheckImageType.isNetworkImage(imageUrl)) {
      return AppImageNetwork(
        imageUrl,
        boxFit: boxFit,
        borderRadius: borderRadius,
        radius: radius,
        height: height,
        width: width,
        cacheKey: cacheKey,
        errorWidget: errorWidget,
        colorError: colorError,
        colorImage: colorImage,
        colorShimmer: colorShimmer,
        alignment: alignment,
        imageBuilder: imageBuilder,
        shimmerWidget: shimmerWidget,
        errorIcon: errorIcon,
        errorListener: errorListener,
      );
    } else {
      return AppImageAsset(
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
      );
    }
  }
}

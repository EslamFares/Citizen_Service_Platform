import 'package:citizen_service_platform/core/shared/funcs/phone_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  const AppLoader({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
        radius: size ?? (PhoneSize.isTablet(context) ? 18.r : 12.r),
      ),
    );
  }
}

import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  final Function(double)? onChanged;
  final double valueCome;
  final double? max, min;
  final Color? color;
  final int? divisions;
  const AppSlider({
    super.key,
    this.onChanged,
    required this.valueCome,
    this.max,
    this.min,
    this.color,
    this.divisions,
  });

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  late double value;
  late double max;
  late double min;
  @override
  void initState() {
    value = widget.valueCome;

    if (widget.max != null) {
      if (widget.max! < widget.valueCome) {
        max = widget.valueCome;
      } else {
        max = widget.max!;
      }
    } else {
      max = 100;
    }
    if (widget.min != null) {
      if (widget.min! > widget.valueCome) {
        min = widget.valueCome;
      } else {
        min = widget.min!;
      }
    } else {
      min = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: widget.color ?? AppColors.primaryColor,
        inactiveTrackColor: AppColors.grey,
        trackHeight: 6,
        thumbColor: widget.color ?? AppColors.primaryColor,
        // overlayColor: AppColors.primaryColorLight,
        // thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        divisions: widget.divisions ?? max.toInt(),
        secondaryActiveColor: Colors.red,
        onChanged: (v) {
          setState(() {
            value = v;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}

import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/shared_widgets/condition_widget.dart';
import 'package:citizen_service_platform/core/shared_widgets/text_fileds/global_text_form.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//!===================use=======================
// onTap: () {
//                   showFilterBottomSheet(
//                       context: context,
//                       title: LocaleKeys.chooseContractor.tr(),
//                       showSelectAllButton: true,
//                       list: cubit.filterModel?.allContractors ?? [],
//                       selectedAllObject: null,
//                       selectedItem: cubit.selectedContractors,
//                       getPropertyForSearch: (value) {
//                         value = value as FilterModelContractors;
//                         return (value.text.toString());
//                       },
//                       onSave: (value) {
//                         cubit.changeSelectedContractors(value);
//                          logger.e("Contractors : $value");
//                       });
//                 },
//!==============================================
void showFilterBottomSheet<T>({
  required BuildContext context,
  required List<T> list,
  required String title,
  required Function(T?) onSave,
  required String Function(T) getPropertyForSearch,
  final T? selectedItem,
  final T? selectedAllObject,
  final bool showSelectAllButton = true,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return _FilterBottomSheet(
        title: title,
        list: list,
        onSave: onSave,
        getPropertyForSearch: getPropertyForSearch,
        selectedAllObject: selectedAllObject,
        selectedItemCome: selectedItem,
        showSelectAllButton: showSelectAllButton,
      );
    },
  );
}

class _FilterBottomSheet<T> extends StatefulWidget {
  final List<T> list;
  final T? selectedItemCome;
  final T? selectedAllObject;
  final bool showSelectAllButton;

  final String title;
  final Function(T?) onSave;
  final String Function(T) getPropertyForSearch;

  const _FilterBottomSheet({
    required this.list,
    required this.onSave,
    required this.getPropertyForSearch,
    required this.title,
    this.selectedItemCome,
    this.selectedAllObject,
    this.showSelectAllButton = true,
  });

  @override
  State<_FilterBottomSheet<T>> createState() => _FilterBottomSheetState<T>();
}

class _FilterBottomSheetState<T> extends State<_FilterBottomSheet<T>> {
  late List<T> filteredList;
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    filteredList = widget.list.isNotEmpty ? List.from(widget.list) : [];
    if (widget.selectedItemCome != null) {
      if (widget.selectedItemCome.runtimeType !=
          widget.list.first.runtimeType) {
        logger.e(
          "**send same object type for [selected Item Come] and [list]**",
        );
      } else {
        _selectItem(widget.selectedItemCome as T);
      }
    }
  }

  void _filterList(String query) {
    setState(() {
      filteredList = widget.list
          .where(
            (item) => widget
                .getPropertyForSearch(item)
                .toLowerCase()
                .contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  void _selectItem(T? item) {
    setState(() {
      selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: FractionallySizedBox(
        heightFactor: filteredList.isNotEmpty ? 0.7 : .3,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.grey,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.title,
                    style: AppTextStyles.font16w600Black,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (widget.showSelectAllButton)
                  AppButtonClick(
                    onPressed: () {
                      _selectItem(widget.selectedAllObject);
                    },
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Text(
                          LocaleKeys.all.tr(),
                          style: selectedItem == widget.selectedAllObject
                              ? AppTextStyles.font14w600MainColor
                              : AppTextStyles.font14w600Black,
                        ),
                        Icon(
                          selectedItem == widget.selectedAllObject
                              ? Icons.check_circle_outlined
                              : Icons.circle_outlined,
                          color: selectedItem == widget.selectedAllObject
                              ? AppColors.primaryColor
                              : AppColors.black,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            if (filteredList.isNotEmpty)
              GlobalTextForm(
                height: 45.h,
                onFieldSubmitted: _filterList,
                onchange: _filterList,
                margin: EdgeInsets.only(bottom: 8.w),
                hintText: LocaleKeys.search.tr(),
                hintStyle: AppTextStyles.font14W600Black,
                // fillColor: AppColors.bg2Color,
                borderRaduis: 50.r,
                borderWidth: 1.w,
                enabledBorderColor: AppColors.strockColor,
                icon: const Icon(CupertinoIcons.search, color: AppColors.black),
              ),
            Expanded(
              child: ConditionWidget(
                condition: filteredList.isNotEmpty,
                childFalse: const AppError(text: "No Filter Available"),
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    final isSelected = selectedItem == item;
                    return ItemFilterBottomSheet(
                      text: widget.getPropertyForSearch(item),
                      onTap: () => _selectItem(item),
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
            ),
            AppButton(
              margin: EdgeInsets.only(top: 10.h, bottom: 30.h),
              isActive: widget.selectedItemCome != selectedItem,
              onPressed: () {
                widget.onSave(selectedItem);
                Navigator.pop(context);
              },
              height: 50.h,
              text: LocaleKeys.confirm.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemFilterBottomSheet extends StatelessWidget {
  const ItemFilterBottomSheet({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.text,
  });

  final void Function()? onTap;
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppButtonClick(
      onPressed: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: AppTextStyles.font14w600Black.copyWith(
                      color: isSelected ? AppColors.primaryColor : null,
                    ),
                  ),
                ),
                gapHorizontal(8.w),
                if (isSelected)
                  const Icon(
                    Icons.check,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
              ],
            ),
          ),
          Divider(color: AppColors.greyBottomNavbar, height: 1.5.h),
        ],
      ),
    );
  }
}

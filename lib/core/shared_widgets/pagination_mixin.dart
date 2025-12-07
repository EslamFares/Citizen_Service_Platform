import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

mixin PaginationMixin<T extends StatefulWidget> on State<T> {
  final ScrollController scrollController = ScrollController();
  bool isLoadingPagination = false;
  double paginationTrigger = 0.7; // trigger at 70%

  /// MUST be implemented in your screen
  Future<void> onPaginate();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    final position = scrollController.position;
    setState(() {});
    // Only when user scrolls down
    if (position.userScrollDirection == ScrollDirection.reverse) {
      // Check if scroll position has passed the trigger point

      if (position.pixels >= paginationTrigger * position.maxScrollExtent) {
        if (!isLoadingPagination) {
          isLoadingPagination = true;
          await onPaginate();
          isLoadingPagination = false;
        }
      }
    }
  }
}

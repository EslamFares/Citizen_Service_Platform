extension StringExtensions on String {
  String maxLetters(int maxLength) {
    if (length > maxLength) {
      return '${substring(0, maxLength)}...';
    }
    return this;
  }
}

extension StringNullExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullAndNotEmpty => this != null && this!.isNotEmpty;
}

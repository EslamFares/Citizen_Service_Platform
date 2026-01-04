class VerifyOtpScreenArgs {
  final String phoneNumber;
  final bool autoSendOtpWhenOpen;
  final Function? onSuccess;

  VerifyOtpScreenArgs({
    required this.phoneNumber,
    required this.autoSendOtpWhenOpen,
    required this.onSuccess,
  });
}

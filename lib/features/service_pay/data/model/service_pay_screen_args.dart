class ServicePayScreenArgs {
  final String? serviceName;
  final int serviceId;
  final num? serviceFee;
  final num? serviceAmount;
  final num? serviceTax;
  ServicePayScreenArgs({
    required this.serviceTax,
    required this.serviceId,
    required this.serviceFee,
    required this.serviceAmount,
    required this.serviceName,
  });
}

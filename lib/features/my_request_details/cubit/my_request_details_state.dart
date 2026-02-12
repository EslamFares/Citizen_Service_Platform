part of 'my_request_details_cubit.dart';


class MyRequestDetailsState {
  final StateBox<RequestItem> getMyRequestDetails;
 
  const MyRequestDetailsState({
    required this.getMyRequestDetails,
  });

MyRequestDetailsState.initial()
      : this(
          getMyRequestDetails: const StateBox.initial(),
        );

  @override
  String toString() {
    return "\nMyRequestDetailsState( "
        "getMyRequestDetails: ${getMyRequestDetails.type.name.toUpperCase()}, "
        ")";
  }

  MyRequestDetailsState copyWith({
    StateBox<RequestItem>? getMyRequestDetails,
  }) {
    return MyRequestDetailsState(
      getMyRequestDetails: getMyRequestDetails ?? this.getMyRequestDetails,
    );
  }
}


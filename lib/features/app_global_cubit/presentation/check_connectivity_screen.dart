import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckConnectivityScreen extends StatelessWidget {
  const CheckConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLoC")),
      body: Center(
        child: BlocConsumer<AppGlobalCubit, AppGlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ConnectivityOnState) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.wifi), Text("Internet On")],
              );
            } else if (state is ConnectivityOffState) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.wifi_off_outlined), Text("Internet Off")],
              );
            } else {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Loading...")],
              );
            }
          },
        ),
      ),
    );
  }
}

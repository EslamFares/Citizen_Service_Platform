import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckConnctivetyWidget extends StatelessWidget {
  const CheckConnctivetyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppGlobalCubit, AppGlobalState>(
      listener: (context, state) {
        // if (state is ConnectivityOnState) {
        //   Loggery("Connectted");

        //   AppToast.animationSnackToast("Internet On",
        //           leadingIcon: Icons.signal_wifi_4_bar)
        //       .show(context);
        // } else if (state is ConnectivityOffState) {
        //   Loggery("Not Connectted");
        //   AppToast.animationSnackToast("Internet Off",
        //           leadingIcon: Icons.signal_wifi_off)
        //       .show(context);
        // }
      },
      builder: (context, state) {
        AppGlobalCubit appSettingCubit = AppGlobalCubit.get(context);
        if (state is ConnectivityOnState ||
            state is ConnectivityOnFirstTimeState ||
            appSettingCubit.isConnectted) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.wifi), Text("Internet On")],
          );
        } else if (state is ConnectivityOffState ||
            !appSettingCubit.isConnectted) {
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
    );
  }
}

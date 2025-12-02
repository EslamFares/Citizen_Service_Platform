import 'package:citizen_service_platform/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailText extends StatelessWidget {
  const EmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => current.isSuccess || current.isError,
      builder: (context, state) {
        if (state.isSuccess) {
          return Text(state.loginModel?.data?.fullName ?? "email");
        } else if (state.isError) {
          return Text(state.errorMessage ?? "error");
        }
        return const SizedBox();
      },
    );
  }
}

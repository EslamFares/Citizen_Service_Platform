import 'package:citizen_service_platform/features/home/presentation/screens/home_screen.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/presentation/widgets/my_main_bottom_navigation_bar/my_main_bottom_navigation_bar.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/screens/my_requests_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/main_bottom_nav_cubit.dart';
import '../../data/repo/main_bottom_nav_repo.dart';

class MainBottomNavScreen extends StatelessWidget {
  const MainBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBottomNavCubit(getIt<MainBottomNavRepo>()),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: MyMainBottomNavigationBar(),
          body: BlocBuilder<MainBottomNavCubit, MainBottomNavState>(
            builder: (context, state) {
              final cubit = MainBottomNavCubit.get(context);
              return screens[cubit.selectedIndex];
            },
          ),
        ),
      ),
    );
  }
}

List<Widget> screens = [
  HomeScreen(),
  MyRequestsScreen(),
  Center(child: Text("3")),
];

import 'package:flutter/material.dart';
import 'package:sky_booker/presentation/home_screen/view/home_tabs/return_trip_screen/view/return_trip_view.dart';
import 'package:sky_booker/presentation/resources/string_manger.dart';
import 'package:sky_booker/presentation/resources/value_manger.dart';

import '../../resources/color_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(
elevation: AppSize.s0,
backgroundColor: ColorManager.primary,
          bottom:  const TabBar(
            unselectedLabelColor: ColorManager.grey,
              dividerColor: ColorManager.primary,
            labelColor: ColorManager.white,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: ColorManager.primary,
            tabs: [
              Tab( text: AppStrings.homeTab1),
              Tab( text: AppStrings.homeTab2),
              Tab(text: AppStrings.homeTab3),
            ],
          ),

          leading: const SizedBox(),
        ),
        body: const TabBarView(

          children: [
            ReturnTripScreen(),
            Center(child: Text('Transit Tab')),
            Center(child: Text('Bike Tab')),
          ],
        ),
      ),
    );
  }
}



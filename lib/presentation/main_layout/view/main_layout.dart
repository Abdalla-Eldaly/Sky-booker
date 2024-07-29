import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sky_booker/presentation/main_layout/viewmodel/main_layout_viewmodel.dart';
import 'package:sky_booker/presentation/resources/assets_manger.dart';
import 'package:sky_booker/presentation/resources/color_manager.dart';
import 'package:sky_booker/presentation/resources/value_manger.dart';

class MainLayOut extends StatelessWidget {
  const MainLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainLayoutViewModel(),
      child: Consumer<MainLayoutViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel.currentScreen,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(SVGAssets.homeIcon, viewModel.selectedIndex == 0),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(SVGAssets.favouriteIcon, viewModel.selectedIndex == 1),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(SVGAssets.profileIcon, viewModel.selectedIndex == 2),
                  label: 'Profile',
                ),
              ],
              currentIndex: viewModel.selectedIndex,
              onTap: viewModel.onItemTapped,
              backgroundColor: ColorManager.white,
              selectedItemColor: ColorManager.secondary,
              unselectedItemColor: ColorManager.grey.withOpacity(.8),
              iconSize: AppSize.s28,
              elevation: AppSize.s0,
            ),
          );
        },
      ),
    );
  }

  Widget _buildIcon(String assetName, bool isSelected) {
    return SvgPicture.asset(
      assetName,
      color: isSelected ? ColorManager.secondary : ColorManager.grey.withOpacity(.8),
      width: AppSize.s28,
    );
  }
}

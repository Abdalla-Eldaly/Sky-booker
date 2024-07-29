import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_booker/presentation/common/widgets/main_text_field.dart';
import 'package:sky_booker/presentation/resources/string_manger.dart';
import 'package:sky_booker/presentation/resources/value_manger.dart';

import '../../../../../resources/color_manager.dart';

class ReturnTripScreen extends StatelessWidget {
  const ReturnTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(

          // alignment: Alignment.bottomCenter,
          children: [
            Container(

              color: ColorManager.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p16),
                child: Column(
                  children: [
                    Stack(
                      alignment:Alignment.centerRight,
                      children: [
                        const Column(
                          children: [
                            MainTextField(hint: AppStrings.flightFrom,prefixIcon: Icon(Icons.flight_takeoff_outlined,size: AppSize.s25,),),
                            SizedBox(height: AppSize.s5,),
                            MainTextField(hint: AppStrings.flightTo,prefixIcon: Icon(Icons.flight_land_outlined,size: AppSize.s25,),),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            margin: const EdgeInsets.all(AppMargin.m8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle
                                  ,color: ColorManager.secondary
                            ),
                            child: const Icon(Icons.swap_vert,size: AppSize.s24,color: ColorManager.white,))
                      ],
                    ),
                    const SizedBox(height: AppSize.s5,),

                    const Row(
                      children: [
                        Expanded(child: MainTextField(prefixIcon: Icon(Icons.calendar_month,size: AppSize.s25,)),),

                        SizedBox(width: AppSize.s8,),

                        Expanded(child: MainTextField(prefixIcon: Icon(Icons.calendar_month,size: AppSize.s25,))),
                      ],
                    )



                  ],
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width*.99,
                bottom: -7,
                child: const Divider(color: ColorManager.white,thickness: AppSize.s1,)),
          ],
        ),
      ),
    );
  }
}

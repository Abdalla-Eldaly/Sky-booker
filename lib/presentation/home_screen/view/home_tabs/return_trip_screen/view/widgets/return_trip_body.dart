import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sky_booker/presentation/home_screen/view/home_tabs/return_trip_screen/viewmodel/return_trip_view_model.dart';

import '../../../../../../common/widgets/main_text_field.dart';
import '../../../../../../common/widgets/mian_dialoge.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../resources/string_manger.dart';
import '../../../../../../resources/value_manger.dart';

class ReturnTripBody extends StatelessWidget {
  const ReturnTripBody({super.key, required this.viewModel});
  final ReturnTripViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: ColorManager.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20,
                vertical: AppPadding.p16,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Column(
                        children: [
                          MainTextField(
                            controller: viewModel.getFlightFrom,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                enableDrag: false,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => FullScreenDialog(
                                  headerText: AppStrings.whereFrom.tr(),
                                  searchText: AppStrings.from.tr(),
                                  onPlaceSelected: (placeName) {
                                    viewModel.getFlightFrom.text = placeName;
                                  },
                                ),
                              );
                            },
                            readOnly: true,
                            hint: AppStrings.flightFrom,
                            prefixIcon: const Icon(
                              Icons.flight_takeoff_outlined,
                              size: AppSize.s25,
                            ),
                          ),
                          const SizedBox(height: AppSize.s5),
                          MainTextField(
                            controller: viewModel.getFlightTo,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                enableDrag: false,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => FullScreenDialog(
                                  headerText: AppStrings.whereTo.tr(),
                                  searchText: AppStrings.to.tr(),
                                  onPlaceSelected: (placeName) {
                                    viewModel.getFlightTo.text = placeName;
                                  },
                                ),
                              );
                            },
                            readOnly: true,
                            hint: AppStrings.flightTo,
                            prefixIcon: const Icon(
                              Icons.flight_land_outlined,
                              size: AppSize.s25,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppPadding.p5),
                        margin: const EdgeInsets.all(AppMargin.m8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.secondary,
                        ),
                        child: InkWell(
                          onTap: () => viewModel.switchFlightFromTo(),
                          child: const Icon(
                            Icons.swap_vert,
                            size: AppSize.s24,
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s5),
                  Row(
                    children: [
                      Expanded(
                        child: MainTextField(
                          controller: viewModel.getFlightDateFrom,
                          onTap: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    datePickerTheme: DatePickerThemeData(
                                      shape: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(AppSize.s16),
                                      ),
                                    ),
                                    colorScheme:
                                    const ColorScheme.light().copyWith(
                                      primary: ColorManager.secondary,
                                      onPrimary: Colors.white,
                                      surface: ColorManager.white,
                                      onSurface: ColorManager.black,
                                    ),
                                    dialogBackgroundColor: Colors.white,
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (selectedDate != null) {
                              final selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (selectedTime != null) {
                                final combinedDateTime = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  selectedDate.day,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );
                                viewModel.getFlightDateFrom.text = combinedDateTime as String;
                              }
                            }
                          },
                          readOnly: true,
                          prefixIcon: const Icon(
                            Icons.calendar_month,
                            size: AppSize.s25,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSize.s3),
                      Expanded(
                        child: MainTextField(
                          controller: viewModel.getFlightDateTo,
                          onTap: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    datePickerTheme: DatePickerThemeData(
                                      shape: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(AppSize.s16),
                                      ),
                                    ),
                                    colorScheme:
                                    const ColorScheme.light().copyWith(
                                      primary: ColorManager.secondary,
                                      onPrimary: Colors.white,
                                      surface: ColorManager.white,
                                      onSurface: ColorManager.black,
                                    ),
                                    dialogBackgroundColor: Colors.white,
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (selectedDate != null) {
                              final selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (selectedTime != null) {
                                final combinedDateTime = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  selectedDate.day,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );
                                viewModel.getFlightDateTo.text = combinedDateTime as String;
                              }
                            }
                          },

                          readOnly: true,
                          prefixIcon: const Icon(
                            Icons.calendar_month,
                            size: AppSize.s25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * .99,
            bottom: -7,
            child: const Divider(
              color: ColorManager.white,
              thickness: AppSize.s1,
            ),
          ),
        ],
      ),
    );
  }
}

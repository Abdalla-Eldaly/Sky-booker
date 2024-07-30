import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_booker/presentation/base/base_states.dart';
import 'package:sky_booker/presentation/base/cubit_builder.dart';
import 'package:sky_booker/presentation/home_screen/view/home_tabs/return_trip_screen/view/widgets/return_trip_body.dart';
import 'package:sky_booker/presentation/home_screen/view/home_tabs/return_trip_screen/viewmodel/return_trip_view_model.dart';

class ReturnTripScreen extends StatelessWidget {
  const ReturnTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ReturnTripViewModel()..start(),
        child: BlocConsumer<ReturnTripViewModel, BaseStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return baseBuilder(
                context,
                state,
                ReturnTripBody(
                  viewModel: ReturnTripViewModel.get(context),
                ));
          },

        ),
      ),
    );
  }
}

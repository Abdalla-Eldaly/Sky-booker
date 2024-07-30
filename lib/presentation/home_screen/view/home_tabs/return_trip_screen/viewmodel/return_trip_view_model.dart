import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import 'package:sky_booker/presentation/base/base_cubit.dart';

class ReturnTripViewModel extends BaseCubit
    implements ReturnTripViewModelInput, ReturnTripViewModelOutput {

  static ReturnTripViewModel get(context) => BlocProvider.of(context);

  final TextEditingController _flightTo = TextEditingController();
  final TextEditingController _flightFrom = TextEditingController();
  final TextEditingController _flightDateTo = TextEditingController();
  final TextEditingController _flightDateFrom = TextEditingController();

  @override
  void dispose() {
    _flightTo.dispose();
    _flightFrom.dispose();
    _flightDateTo.dispose();
    _flightDateFrom.dispose();
  }

  @override
  void start() {
    final now = DateTime.now();
    final threeDaysLater = now.add(const Duration(days: 3));
    final sevenDaysLater = now.add(const Duration(days: 10));

    final dateFormat = DateFormat('yyyy-MM-dd');

    _flightDateFrom.text = dateFormat.format(now);
    _flightDateTo.text = dateFormat.format(sevenDaysLater);
  }

  void switchFlightFromTo() {
    final temp = _flightTo.text;
    _flightTo.text = _flightFrom.text;
    _flightFrom.text = temp;
  }

  @override
  TextEditingController get getFlightFrom => _flightFrom;

  @override
  TextEditingController get getFlightTo => _flightTo;

  @override
  TextEditingController get getFlightDateFrom => _flightDateFrom;

  @override
  TextEditingController get getFlightDateTo => _flightDateTo;
}

abstract class ReturnTripViewModelInput {}

abstract class ReturnTripViewModelOutput {
  TextEditingController get getFlightTo;
  TextEditingController get getFlightFrom;
  TextEditingController get getFlightDateTo;
  TextEditingController get getFlightDateFrom;
}

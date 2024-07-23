import 'package:sky_booker/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZeroForInt() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return Constants.falseBool;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZeroForDouble() {
    if (this == null) {
      return Constants.zeroForD;
    } else {
      return this!;
    }
  }
}

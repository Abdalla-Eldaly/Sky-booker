import '../../data/network/failure.dart';

enum DisplayType { fullScreen, popUpDialog }

abstract class BaseStates {
  final DisplayType displayType;
  BaseStates({this.displayType = DisplayType.fullScreen});
}

class InitState extends BaseStates {}


class EmptyState extends BaseStates {
  EmptyState({super.displayType, this.retry});

  final void Function()? retry;}

class LoadingState extends BaseStates {
   LoadingState({super.displayType});
}

class ErrorState extends BaseStates {
  final Failure failure;
  final void Function()? retry;

  ErrorState({super.displayType, this.retry, required this.failure});

}



class SuccessState extends BaseStates {
  SuccessState(this.message) : super(displayType: DisplayType.popUpDialog);
  final String message;
}

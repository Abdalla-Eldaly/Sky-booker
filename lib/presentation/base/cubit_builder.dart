import 'package:flutter/material.dart';

import '../resources/assets_manger.dart';
import '../resources/string_manger.dart';
import 'base_states.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseStates state, Widget content) {
  if (state.displayType == DisplayType.popUpDialog) return content;

  if (state is SuccessState) {
    //do nothing
    return content;
  } else if (state is LoadingState) {

    return Center(
      child: BaseWidgets.buildAnimatedImage(LottieAssets.loading),
    );
  } else if (state is ErrorState) {
    return BaseWidgets.buildItemsColumn([
      const Spacer(),
      BaseWidgets.buildAnimatedImage(LottieAssets.error),
      BaseWidgets.buildMessage(context, state.failure.message),
      const Spacer(),
      BaseWidgets.buildButton(
        displayType: state.displayType,
        context: context,
        onTap: state.retry,
        title: AppStrings.retryAgain,
      ),
    ]);
  } else if (state is EmptyState) {
    return BaseWidgets.buildItemsColumn([
      // BaseWidgets.buildAnimatedImage(LottieAssets.empty),
      BaseWidgets.buildMessage(context, AppStrings.emptyContent),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain),
    ]);
  }  else {
    return content;
  }
}

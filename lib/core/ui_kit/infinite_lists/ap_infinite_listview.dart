import 'package:flicker_api_app/core/base/presentation/widget/base_stateless_widget.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/core/ui_kit/button/button.dart';
import 'package:flicker_api_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ApInfiniteListview extends BaseStatelessWidget {
  const ApInfiniteListview(
      {Key? key,
      required this.moreItemAction,
      required this.itemCount,
      required this.itemBuilder,
      required this.showLoading,
      required this.tryAgain,
      this.separatorBuilder,
      this.loadingWidget,
      this.scrollDirection,
      this.itemScrollController,
      this.scrollController,
      this.physics,
      this.shrinkWrap,
      this.mainAxisSize,
      this.reversed = false,
      this.onRefresh})
      : super(key: key);

  final VoidCallback moreItemAction;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget? loadingWidget;
  final bool showLoading;
  final bool tryAgain;
  final Axis? scrollDirection;
  final ItemScrollController? itemScrollController;
  final ScrollController? scrollController;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final MainAxisSize? mainAxisSize;
  final bool reversed;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return (scrollDirection ?? Axis.vertical) == Axis.vertical
        ? Column(mainAxisSize: mainAxisSize ?? MainAxisSize.max, children: _listview(context))
        : Row(mainAxisSize: mainAxisSize ?? MainAxisSize.max, children: _listview(context));
  }

  List<Widget> _listview(BuildContext context) {
    double lastPixels = 0.0;
    return [
      if (showLoading && itemCount > 0 && reversed)
        loadingWidget ??
            const SizedBox(
                width: 40,
                height: 40,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
                )),
      if (tryAgain && reversed)
        SizedBox(
          height: 40,
          child: ApButton(title: S.of(context).try_again, onTap: moreItemAction),
        ),
      if (itemCount > 0)
        NotificationListener(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                scrollInfo.metrics.pixels != lastPixels) {
              lastPixels = scrollInfo.metrics.pixels;
              moreItemAction();
            }
            return true;
          },
          child: Flexible(
            child: onRefresh != null
                ? LiquidPullToRefresh(
                    showChildOpacityTransition: false,
                    animSpeedFactor: 1.0,
                    backgroundColor: Theme.of(context).primary,
                    color: Theme.of(context).background,
                    springAnimationDurationInMilliseconds: 500,
                    onRefresh: onRefresh!,
                    child: list(),
                  )
                : list(),
          ),
        ),
      if (itemCount <= 0)
        Flexible(
          child: Center(
            child: showLoading
                ? const CircularProgressIndicator()
                : Text(
                    S.of(context).list_is_empty,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
          ),
        ),
      if (showLoading && itemCount > 0 && !reversed)
        loadingWidget ??
            const SizedBox(
                width: 40,
                height: 40,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
                )),
      if (tryAgain && !reversed)
        SizedBox(
          height: 40,
          child: ApButton(title: S.of(context).try_again, onTap: moreItemAction),
        ),
    ];
  }

  Widget list() {
    return ScrollablePositionedList.separated(
      padding: (scrollDirection ?? Axis.vertical) == Axis.vertical
          ? reversed
              ? const EdgeInsets.only(top: 40)
              : const EdgeInsets.only(bottom: 40)
          : reversed
              ? const EdgeInsets.only(left: 40)
              : const EdgeInsets.only(right: 40),
      shrinkWrap: shrinkWrap ?? false,
      physics: physics,
      itemScrollController: itemScrollController,
      scrollDirection: scrollDirection ?? Axis.vertical,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder ?? (BuildContext context, int index) => const SizedBox(),
      itemCount: itemCount,
      reverse: reversed,
    );
  }
}

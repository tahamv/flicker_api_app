import 'package:flicker_api_app/core/base/presentation/widget/base_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseStateFulWidget extends StatefulWidget {
  const BaseStateFulWidget({super.key});
}

abstract class BaseState<Page extends BaseStateFulWidget> extends State<Page> with BaseWidgetMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      resizeToAvoidBottomInset: removeBottomInset(),
      backgroundColor: pageBackgroundColor(context),
      body: setBlocProviders(context).isNotEmpty
          ? MultiBlocProvider(
              providers: [...setBlocProviders(context)],
              child: Builder(
                builder: (context) {
                  return body(context);
                },
              ),
            )
          : body(context),
    );
  }
}

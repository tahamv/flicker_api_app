import 'package:flicker_api_app/core/base/presentation/page/base_page_mixin.dart';
import 'package:flutter/material.dart';

abstract class BaseStateFulPage extends StatefulWidget {
  const BaseStateFulPage({super.key});
}

abstract class BaseState<Page extends BaseStateFulPage> extends State<Page> with BasePageMixin {
  @override
  Widget build(BuildContext context) {
    return annotatedRegion(context);
  }
}

import 'package:flicker_api_app/core/base/presentation/page/base_page_mixin.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessPage extends StatelessWidget with BasePageMixin {
  const BaseStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return annotatedRegion(context);
  }
}

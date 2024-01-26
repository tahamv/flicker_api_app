import 'package:flicker_api_app/core/base/presentation/widget/base_stateless_widget.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmptyList extends BaseStatelessWidget {
  const EmptyList({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).list_is_empty,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).black),
          ),
        ],
      ),
    );
  }
}

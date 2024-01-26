import 'package:flicker_api_app/core/base/presentation/page/base_stateless_page.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/features/photoes/presentation/widgets/photos_widget.dart';
import 'package:flicker_api_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PhotosPage extends BaseStatelessPage {
  const PhotosPage({
    super.key,
  });

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Text(
          S.of(context).photos,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primary,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
        actions: appBarActions(context),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return PhotosWidget();
  }
}

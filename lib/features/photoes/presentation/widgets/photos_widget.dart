import 'package:cached_network_image/cached_network_image.dart';
import 'package:flicker_api_app/core/base/domain/entities/text_input_entity.dart';
import 'package:flicker_api_app/core/base/presentation/widget/base_stateless_widget.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/core/di/base/di_setup.dart';
import 'package:flicker_api_app/core/ui_kit/empty_page/empty_list.dart';
import 'package:flicker_api_app/core/ui_kit/infinite_lists/ap_infinite_listview.dart';
import 'package:flicker_api_app/core/ui_kit/infinite_lists/bloc/infinite_list_pagination_state.dart';
import 'package:flicker_api_app/core/ui_kit/input/text_form_field.dart';
import 'package:flicker_api_app/core/ui_kit/spacing.dart';
import 'package:flicker_api_app/features/photoes/domain/entities/photo_entity.dart';
import 'package:flicker_api_app/features/photoes/presentation/manager/photos_cubit.dart';
import 'package:flicker_api_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosWidget extends BaseStatelessWidget {
  PhotosWidget({
    super.key,
  });

  final TextInEntity search = TextInEntity();

  @override
  List setBlocProviders(BuildContext context) {
    return [
      BlocProvider(create: (context) {
        final bloc = getIt<PhotosCubit>();
        return bloc;
      }),
    ];
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        children: [
          ApTextFormField.search(
            textInput: search,
            label: S.of(context).search,
            hint: S.of(context).search,
            onSubmit: (text) {
              context.read<PhotosCubit>().resetPagination();
              context.read<PhotosCubit>().getPhotos(searchText: text);
            },
          ),
          Expanded(child: BlocBuilder<PhotosCubit, InfiniteListPaginationState>(builder: (context, state) {
            return state.whenOrNull(
                  refreshLoading: (data) {
                    return _buildList(context, data, showLoading: false);
                  },
                  loading: (data) {
                    return _buildList(context, data, showLoading: true);
                  },
                  success: (data) {
                    return _buildList(context, data);
                  },
                  error: (msg, data) {
                    return _buildList(context, data, tryAgain: true);
                  },
                ) ??
                _buildList(context, []);
          }))
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, List<PhotoEntity> items, {bool showLoading = false, bool? tryAgain = false}) {
    if (items.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ApInfiniteListview(
          showLoading: showLoading,
          tryAgain: tryAgain!,
          itemCount: items.length,
          onRefresh: () async {
            await context.read<PhotosCubit>().refresh(text: search.textController.text);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Text(
                        items[index].title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).black),
                      ),
                      Space.h8,
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "https://farm${items[index].farm}.staticflickr.com/${items[index].server}/${items[index].id}_${items[index].secret}_m.jpg",
                                  fit: BoxFit.fitWidth)))
                    ],
                  ),
                ));
          },
          moreItemAction: () {
            context.read<PhotosCubit>().getPhotos(searchText: search.textController.text);
          },
        ),
      );
    }
    if (showLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const EmptyList();
  }
}

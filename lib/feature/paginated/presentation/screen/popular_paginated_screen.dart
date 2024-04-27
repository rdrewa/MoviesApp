import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/empty_box.dart';
import '../../../common/presentation/widget/error_box.dart';
import '../../../common/presentation/widget/headline_text.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../../../common/presentation/widget/skyscraper/skyscraper_grid.dart';
import '../bloc/popular/popular_paginated_bloc.dart';

class PopularPaginatedScreen extends StatelessWidget {
  const PopularPaginatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineText(text: 'home.popular.title'.tr()),
      ),
      body: BlocProvider(
        create: (_) => sl<PopularPaginatedBloc>()..add(GetPopularPaginatedEvent()),
        child: BlocBuilder<PopularPaginatedBloc, PopularPaginatedState>(
            builder: (context, state) => switch (state) {
                  PopularPaginatedInitial() => const SizedBox.shrink(),
                  PopularPaginatedEmpty() => EmptyBox(message: 'home.popular.empty'.tr()),
                  PopularPaginatedLoading() => const ProgressWheel(height: 250),
                  PopularPaginatedLoaded() => SkyscraperGrid(
                      title: 'home.popular.title'.tr(),
                      list: state.data,
                    ),
                  PopularPaginatedFailure() => ErrorBox(message: state.message),
                }),
      ),
    );
  }
}

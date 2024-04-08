import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/domain/model/movie.dart';
import '../../../common/presentation/widget/top_bar.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../../../../app/di.dart';
import '../bloc/details/details_bloc.dart';
import '../widget/details_container.dart';
import '../widget/watch_icon.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<DetailsBloc>()..add(GetDetailsEvent(id)),
        child: BlocBuilder<DetailsBloc, DetailsState>(
            builder: (context, state) => switch (state) {
                  DetailsInitial() => const SizedBox.shrink(),
                  DetailsLoading() => const ProgressWheel(),
                  DetailsLoaded() => Scaffold(
                      appBar: TopBar(title: 'details.title'.tr(), actions: [
                        WatchIcon(item: Movie.fromDetails(state.data))
                      ]),
                      body: DetailsContainer(details: state.data)),
                  DetailsFailure() => Text(state.message),
                }),
      );
}

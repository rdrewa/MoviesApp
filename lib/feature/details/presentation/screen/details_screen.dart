import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/presentation/widget/progress_wheel.dart';
import '../../../../app/di.dart';
import '../bloc/details/details_bloc.dart';
import '../widget/details_container.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => sl<DetailsBloc>()..add(GetDetailsEvent(id)),
    child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<DetailsBloc, DetailsState>(
            builder: (context, state) => switch (state) {
              DetailsInitial() => const SizedBox.shrink(),
              DetailsLoading() => const ProgressWheel(),
              DetailsLoaded() => DetailsContainer(details: state.data),
              DetailsFailure() => Text(state.message),
            })),
  );
}

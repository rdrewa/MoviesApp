import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/model/movie.dart';
import '../../../domain/usecase/get_popular_paginated_usecase.dart';

part 'popular_paginated_event.dart';

part 'popular_paginated_state.dart';

class PopularPaginatedBloc
    extends Bloc<PopularPaginatedEvent, PopularPaginatedState> {
  final GetPopularPaginatedUsecase _getPopularPaginatedUsecase;

  PopularPaginatedBloc(this._getPopularPaginatedUsecase)
      : super(PopularPaginatedInitial()) {
    on<GetPopularPaginatedEvent>(_onGetPopularPaginatedEvent);
  }

  FutureOr<void> _onGetPopularPaginatedEvent(GetPopularPaginatedEvent event,
      Emitter<PopularPaginatedState> emit) async {
    final isLoadingMore = state is PopularPaginatedLoaded &&
        (state as PopularPaginatedLoaded).hasMore;
    final int page =
        isLoadingMore ? (state as PopularPaginatedLoaded).next ?? 1 : 1;
    List<Movie> list = [];

    if (isLoadingMore) {
      list = (state as PopularPaginatedLoaded).data;
    } else {
      emit(PopularPaginatedLoading());
    }

    (await _getPopularPaginatedUsecase(page)).fold(
        (fail) => emit(const PopularPaginatedFailure('Something went wrong')),
        (data) {
      final int? next = data.hasNext ? data.page + 1 : null;
      final bool hasMore = data.hasNext;

      if (isLoadingMore) {
        list.addAll(data.results);
      } else {
        list = data.results;
      }
      emit(PopularPaginatedLoaded(list, hasMore, next));
    });
  }
}

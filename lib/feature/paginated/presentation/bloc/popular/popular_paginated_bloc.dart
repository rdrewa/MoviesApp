import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/data/model/movie_response.dart';
import '../../../domain/usecase/get_popular_paginated_usecase.dart';

part 'popular_paginated_event.dart';

part 'popular_paginated_state.dart';

class PopularPaginatedBloc extends Bloc<PopularPaginatedEvent, PopularPaginatedState> {
  final GetPopularPaginatedUsecase _getPopularPaginatedUsecase;

  PopularPaginatedBloc(this._getPopularPaginatedUsecase) : super(PopularPaginatedInitial()) {
    on<GetPopularPaginatedEvent>(_onGetPopularPaginatedEvent);
  }

  FutureOr<void> _onGetPopularPaginatedEvent(
      GetPopularPaginatedEvent event, Emitter<PopularPaginatedState> emit) async {
    emit(PopularPaginatedLoading());

    (await _getPopularPaginatedUsecase(event.page)).fold(
            (fail) => emit(const PopularPaginatedFailure('Something went wrong')),
            (data) => emit( PopularPaginatedLoaded(data)));
  }
}

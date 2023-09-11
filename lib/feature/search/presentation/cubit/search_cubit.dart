import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/favorites/domain/entity/composition_entity.dart';
import 'package:aizere_app/feature/search/domain/use_case/search_book_by_name_use_case.dart';
import 'package:aizere_app/mixins/request_worker_mixin.dart';
import 'package:aizere_app/utils/exeption/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> with CoreRequestWorkedMixin {
  SearchCubit()
      : _searchBookByName = sl(),
        super(SearchInitial());

  late List<CompositionEntity> listData;
  final SearchBookByNameUseCase _searchBookByName;

  void onSearchChanged(String query) {
    if (query.trim().isNotEmpty) {
      launchDelay(
        800,
        onLoading: () {
          emit(SearchLoadingState());
        },
        request: () => searchCompany(
          query,
          onSuccess: () => emit(
            SearchSuccessState(bookList: listData),
          ),
        ),
      );
    } else {
      clear();
      emit(SearchInitial());
    }
  }

  Future<void> searchCompany(
    String symbol, {
    Function()? onSuccess,
  }) async {
    final request = _searchBookByName.execute(symbol);

    await launchWithError<List<CompositionEntity>, HttpRequestException>(
      request: request,
      loading: (isLoading) {},
      resultData: (result) {
        listData = result;
        if (listData.isEmpty) {
          emit(
            SearchEmptyResultState(),
          );
        } else {
          onSuccess?.call();
        }
      },
      errorData: (exception) => emit(
        SearchHttpErrorState(exception.message ?? GlobalConstant.empty),
      ),
    );
  }
}

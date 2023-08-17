import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_index_state.dart';

class ChangeIndexCubit extends Cubit<IndexState> {
  ChangeIndexCubit() : super(IndexState(0));

  void changeState(int value) {
    emit(IndexState(value));
  }
}


/// Обертка поверх int значения так как cubit не емитит одинаковые значения
/// данная логика необходима для логики возврата на первый роут в рамках одного таба
class IndexState {
  final int value;

  IndexState(this.value);
}

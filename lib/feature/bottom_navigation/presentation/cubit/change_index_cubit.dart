import 'package:flutter_bloc/flutter_bloc.dart';

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

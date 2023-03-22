import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/choose_local/data/repository/setting_local_global_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_app_local_state.dart';

class SettingAppLocalCubit extends Cubit<SettingAppLocalState> {
  SettingAppLocalCubit()
      : _localRepository = sl(),
        super(SettingAppLocalInitial());

  final CoreGlobalSettingLocalRepository _localRepository;

  Future<void> initCubit() async {
    final defaultLocal = await _localRepository.isSelectedLocal;
    emit(SettingAppLocalCommonState(defaultLocal));
  }

  Future<void> changeLocal(int code) async {
    await _localRepository.setAppLocal(code);
    emit(SettingAppLocalCommonState(code));
  }
}

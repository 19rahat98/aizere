import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/repository/setting_speaker_global_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_speaker_state.dart';

class AppSpeakerCubit extends Cubit<AppSpeakerState> {
  AppSpeakerCubit()
      : _repository = sl(),
        super(AppSpeakerInitial());

  final CoreGlobalSettingSpeakerRepository _repository;

  Future<void> initCubit() async {
    final speakerId = await _repository.selectedSpeaker;
    emit(AppSpeakerCommonState(speakerId));
  }

  Future<void> changeSpeakerId(int id) async {
    await _repository.setAppLocal(id);
    emit(AppSpeakerCommonState(id));
  }
}

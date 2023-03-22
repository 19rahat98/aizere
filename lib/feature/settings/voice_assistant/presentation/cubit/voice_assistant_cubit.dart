import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/start_settings/domain/usecase/global_app_setting_usercase.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/repository/setting_speaker_global_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'voice_assistant_state.dart';

class VoiceAssistantCubit extends Cubit<VoiceAssistantState> {
  VoiceAssistantCubit()
      : _repository = sl(),
        _configureAppUseCase = sl(),
        super(VoiceAssistantInitial());

  final CoreGlobalSpeakerSpeedRepository _repository;
  final GlobalRegisterConfigureAppUseCase _configureAppUseCase;

  Future<void> initCubit() async {
    final speed = await _repository.selectedSpeaker;
    emit(VoiceAssistantCommonState(speed));
  }

  Future<void> setSpeed(double speed) async {
    await _repository.setAppLocal(speed);
    emit(
      VoiceAssistantCommonState(
        speed,
      ),
    );
  }

  Future<void> setApplicationConfiguredState() async {
    await _configureAppUseCase.execute();
    emit(SuccessAppConfigured());
  }
}

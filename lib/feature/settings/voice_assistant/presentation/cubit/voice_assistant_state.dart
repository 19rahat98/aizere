part of 'voice_assistant_cubit.dart';

@immutable
abstract class VoiceAssistantState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VoiceAssistantInitial extends VoiceAssistantState {}

class SuccessAppConfigured extends VoiceAssistantState {}

class VoiceAssistantCommonState extends VoiceAssistantState {
  final double speed;

  VoiceAssistantCommonState(this.speed);

  @override
  List<Object?> get props => [
    speed,
  ];
}

part of 'app_speaker_cubit.dart';

@immutable
abstract class AppSpeakerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppSpeakerInitial extends AppSpeakerState {}

class AppSpeakerCommonState extends AppSpeakerState {
  final int speakerId;

  AppSpeakerCommonState(this.speakerId);

  @override
  // TODO: implement props
  List<Object?> get props => [
    speakerId,
  ];
}

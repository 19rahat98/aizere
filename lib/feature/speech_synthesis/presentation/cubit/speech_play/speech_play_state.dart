part of 'speech_play_cubit.dart';

@immutable
abstract class SpeechPlayState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SpeechPlayInitial extends SpeechPlayState {}

class SpeechPlayCommonState extends SpeechPlayState {
  final int speakerId;
  final bool isLoading;
  final bool isContain;
  final int playerState;
  final double speedSpeaker;

  final int totalTime;
  final int initialTime;

  SpeechPlayCommonState copyWith({
    int? totalTime,
    int? initialTime,
    int? speakerId,
    int? playerState,
    bool? isLoading,
    bool? isContain,
    double? speedSpeaker,
  }) {
    return SpeechPlayCommonState(
      isContain: isContain ?? this.isContain,
      totalTime: totalTime ?? this.totalTime,
      initialTime: initialTime ?? this.initialTime,
      isLoading: isLoading ?? this.isLoading,
      playerState: playerState ?? this.playerState,
      speakerId: speakerId ?? this.speakerId,
      speedSpeaker: speedSpeaker ?? this.speedSpeaker,
    );
  }

  SpeechPlayCommonState({
    this.totalTime = 0,
    this.initialTime = 0,
    this.playerState = 0,
    required this.isLoading,
    required this.isContain,
    required this.speakerId,
    required this.speedSpeaker,
  });

  String get playPauseIconAsset {
    return playerState == 1 ? AppIcons.icPlay : AppIcons.icStop;
  }

  @override
  List<Object?> get props => [
        initialTime,
        totalTime,
        playerState,
        isLoading,
        isContain,
        speakerId,
        speedSpeaker,
      ];
}

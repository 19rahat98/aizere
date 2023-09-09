part of 'speech_play_cubit.dart';

@immutable
abstract class SpeechPlayState extends Equatable {}

class SpeechPlayInitial extends SpeechPlayState {
  @override
  List<Object?> get props => [];
}

class SpeechPlayCommonState extends SpeechPlayState {
  final int playerState;
  final double speedSpeaker;

  final int totalTime;
  final int initialTime;

  SpeechPlayCommonState copyWith({
    int? totalTime,
    int? initialTime,
    int? playerState,
    double? speedSpeaker,
  }) {
    return SpeechPlayCommonState(
      totalTime: totalTime ?? this.totalTime,
      initialTime: initialTime ?? this.initialTime,
      playerState: playerState ?? this.playerState,
      speedSpeaker: speedSpeaker ?? this.speedSpeaker,
    );
  }

  SpeechPlayCommonState({
    this.totalTime = 0,
    this.initialTime = 0,
    this.playerState = 1,
    required this.speedSpeaker,
  });

  String get playPauseIconAsset {
    return playerState == 2 ? AppIcons.icStop : AppIcons.icPlay;
  }

  @override
  List<Object?> get props => [
        initialTime,
        totalTime,
        playerState,
        speedSpeaker,
      ];
}

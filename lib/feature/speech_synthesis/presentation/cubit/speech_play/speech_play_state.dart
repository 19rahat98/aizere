part of 'speech_play_cubit.dart';

@immutable
abstract class SpeechPlayState {}

class SpeechPlayInitial extends SpeechPlayState {}

class SpeechCommonState extends SpeechPlayState {
  final int speakerId;
  final bool isLoading;
  final bool isContain;
  final int playerState;
  final double speedSpeaker;

  final int totalTime;
  final int initialTime;

  SpeechCommonState copyWith({
    int? totalTime,
    int? initialTime,
    int? speakerId,
    int? playerState,
    bool? isLoading,
    bool? isContain,
    double? speedSpeaker,
  }) {
    return SpeechCommonState(
      isContain: isContain ?? this.isContain,
      totalTime: totalTime ?? this.totalTime,
      initialTime: initialTime ?? this.initialTime,
      isLoading: isLoading ?? this.isLoading,
      playerState: playerState ?? this.playerState,
      speakerId: speakerId ?? this.speakerId,
      speedSpeaker: speedSpeaker ?? this.speedSpeaker,
    );
  }

  SpeechCommonState({
    this.totalTime = 0,
    this.initialTime = 0,
    this.playerState = 0,
    required this.isLoading,
    required this.isContain,
    required this.speakerId,
    required this.speedSpeaker,
  });

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

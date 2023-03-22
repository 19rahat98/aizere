part of 'speech_cubit.dart';

@immutable
abstract class SpeechState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SpeechInitial extends SpeechState {}

class SpeechCommonState extends SpeechState {
  final int speakerId;
  final bool isLoading;
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
    double? speedSpeaker,
  }) {
    return SpeechCommonState(
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
    required this.speakerId,
    required this.speedSpeaker,
  });

  @override
  List<Object?> get props => [
        initialTime,
        totalTime,
        playerState,
        isLoading,
        speakerId,
        speedSpeaker,
      ];
}

class SpeechDownloadError extends SpeechState {
  final String error;

  SpeechDownloadError(this.error);
}

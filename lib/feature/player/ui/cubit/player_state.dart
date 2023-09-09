part of 'player_cubit.dart';



@immutable
abstract class PlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayerInitial extends PlayerState {}

class PlayerCommonState extends PlayerState {
  final bool isLoading;
  final bool isContain;
  final int playerState;
  final double speedSpeaker;
  final int totalTime;
  final int initialTime;

  PlayerCommonState copyWith({
    int? totalTime,
    int? initialTime,
    int? playerState,
    bool? isLoading,
    bool? isContain,
    double? speedSpeaker,
  }) {
    return PlayerCommonState(
      isContain: isContain ?? this.isContain,
      totalTime: totalTime ?? this.totalTime,
      initialTime: initialTime ?? this.initialTime,
      isLoading: isLoading ?? this.isLoading,
      playerState: playerState ?? this.playerState,
      speedSpeaker: speedSpeaker ?? this.speedSpeaker,
    );
  }

  PlayerCommonState({
    this.totalTime = 0,
    this.initialTime = 0,
    this.playerState = 0,
    required this.isLoading,
    required this.isContain,
    required this.speedSpeaker,
  });

  @override
  List<Object?> get props => [
    initialTime,
    totalTime,
    playerState,
    isLoading,
    isContain,
    speedSpeaker,
  ];
}

class PlayerDownloadError extends PlayerState {
  final String error;

  PlayerDownloadError(this.error);
}

class PlayerSuccessDownloaded extends PlayerState {}


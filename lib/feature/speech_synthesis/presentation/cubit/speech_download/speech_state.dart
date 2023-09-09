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

  SpeechCommonState copyWith({
    int? speakerId,
    bool? isLoading,
  }) {
    return SpeechCommonState(
      isLoading: isLoading ?? this.isLoading,
      speakerId: speakerId ?? this.speakerId,
    );
  }

  SpeechCommonState({
    required this.isLoading,
    required this.speakerId,
  });

  @override
  List<Object?> get props => [
        isLoading,
        speakerId,
      ];
}

class SpeechDownloadError extends SpeechState {
  final String error;

  SpeechDownloadError(this.error);
}

class SpeechSuccessDownloaded extends SpeechState {
  SpeechSuccessDownloaded(this.audioPath);

  final String audioPath;
}

extension TimeFormatting on int {
  String formatTime() {
    int hours = this ~/ 3600;
    int minutes = (this % 3600) ~/ 60;
    int remainingSeconds = this % 60;

    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes:$formattedSeconds';
  }
}

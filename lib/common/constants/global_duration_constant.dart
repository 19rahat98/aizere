class GlobalDurationConstant {
  static const defaultDuration = Duration(milliseconds: 200);

  /// задержка при нажатии на счетчик
  static const delayTimer = Duration(milliseconds: 500);

  /// задержка для перерисовки UI с акуальными высотами для выписок и контента страницы
  static const delayResizeLayout = Duration(milliseconds: 10);

  /// задержка при открытии нижнего диалога (используеться для избежания наложения при закрытии/открытии экрана)
  static const delayBottomSheet = Duration(milliseconds: 10);

  /// значение по умочанию при выборе времени через [showSelectTime]
  static const selectTimeDuration =
      Duration(hours: 0, minutes: 30);

}

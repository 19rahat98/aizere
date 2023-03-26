/// содержит все ключи для глобальных преференсов
class GlobalPrefConstant {
  /// launcher (первичный запуск и действия пользователя)
  static const isBeforeViewOnboarding = "isBeforeViewOnboarding";
  static const isBeforeSettingApplication = "isBeforeSettingApplication";

  /// настройки
  static const prefLocalization = 'prefLocalization';
  static const prefPushNotification = "prefPushNotification";
  static const prefGeoLocation = "prefGeoLocation";
  static const prefSpeaker = "prefSpeaker";
  static const prefVoiceSpeed = "prefVoiceSpeed";

  /// персональные данные
  static const prefAccessToken = "prefAccessToken";
  static const prefRefreshToken = "prefRefreshToken";
  static const prefPhoneNumber = "prefPhoneNumber";
  static const prefPassword = "prefPassword";
  static const prefPinCode = "prefPinCode";
  static const prefUseBiometric = "prefUseBiometric";
  static const prefFavoritesList = "prefFavoritesList";

  /// данные юзера
  static const prefUserData = "prefUserData";

  /// локальная сессия
  static const prefLastTimeActionSession = "prefLastTimeActionSession";

  /// apple wallet
  static const prefShowAppleWalletOnboarding = "prefShowAppleWalletOnboarding";
}

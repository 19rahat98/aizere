part of 'setting_app_local_cubit.dart';

@immutable
abstract class SettingAppLocalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingAppLocalInitial extends SettingAppLocalState {}

class SettingAppLocalCommonState extends SettingAppLocalState {
  final int appLocal;

  SettingAppLocalCommonState(this.appLocal);

  @override
  List<Object?> get props => [
        appLocal,
      ];
}

import 'package:equatable/equatable.dart';

class LanguageEntityModel extends Equatable {
  const LanguageEntityModel({
    required this.code,
    required this.value,
  }) : super();

  final int? code;
  final String? value;

  @override
  List<Object?> get props => [
    code ?? 0,
    value ?? 0,
  ];
}

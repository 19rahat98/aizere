part of 'favorites_cubit.dart';

class FavoriteState extends Equatable {
  final List<String> list;
  final index = DateTime.now().microsecondsSinceEpoch;

  FavoriteState(this.list);
  @override
  List<Object?> get props => [
    list,
    index,
  ];
}
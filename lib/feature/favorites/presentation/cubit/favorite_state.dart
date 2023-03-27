part of 'favorites_cubit.dart';

class FavoriteState extends Equatable {
  FavoriteState(this.list);

  final List<String> list;
  final index = DateTime.now().microsecondsSinceEpoch;


  @override
  List<Object?> get props => [
        list,
        index,
      ];
}

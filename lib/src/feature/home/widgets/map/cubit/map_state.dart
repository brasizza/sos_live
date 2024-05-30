part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class MapLoading extends MapState {}

final class MapLoaded extends MapState {
  final List<UserModel> users;
  MapLoaded(this.users);
}

final class MapError extends MapState {}

final class MapEmpty extends MapState {}

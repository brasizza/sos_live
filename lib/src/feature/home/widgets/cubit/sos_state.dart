part of 'sos_cubit.dart';

@immutable
sealed class SosState {}

final class SosInitial extends SosState {}

final class DistressOnState extends SosState {}

final class DistressOffState extends SosState {}

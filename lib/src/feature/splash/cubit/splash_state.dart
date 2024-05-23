part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoggedState extends SplashState {}

final class SplashErrorState extends SplashState {
  final String erro;

  SplashErrorState({required this.erro});
}

part of 'theme_ctrl_bloc.dart';

@immutable
sealed class ThemeCtrlState {}

final class ThemeCtrlInitial extends ThemeCtrlState {}

final class ThemeCtrlLightMode extends ThemeCtrlState {}

final class ThemeCtrlNightMode extends ThemeCtrlState {}

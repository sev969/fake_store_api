import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_ctrl_event.dart';
part 'theme_ctrl_state.dart';

class ThemeCtrlBloc extends Bloc<ThemeCtrlEvent, ThemeCtrlState> {
  ThemeCtrlBloc() : super(ThemeCtrlLightMode()) {
    on<ThemeSwitchEvent>((event, emit) {
      if (state is ThemeCtrlNightMode) {
        emit(ThemeCtrlLightMode());
      } else {
        emit(ThemeCtrlNightMode());
      }
    });
  }
}

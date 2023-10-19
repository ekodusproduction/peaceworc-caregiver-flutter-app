part of 'settings_bloc.dart';

@immutable
abstract class SettingsState extends Equatable {}

class LogoutInitial extends SettingsState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class LogoutLoadingState extends SettingsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LogoutSuccessState extends SettingsState{
  final CommonResponse commonResponse;
  LogoutSuccessState(this.commonResponse);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LogoutFailureState extends SettingsState{
  final String message;
  LogoutFailureState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}



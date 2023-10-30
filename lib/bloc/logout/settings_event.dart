part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {

}
 class LogoutButtonClickEvent extends SettingsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

 }

 class LogoutSuccessfulEvent extends SettingsEvent {
  @override
  // TODO: implement props
  List<Object?> get props =>[];

 }
 class LogoutFailureEvent extends SettingsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

 }
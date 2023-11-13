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

 class ChangePasswordButtonClickEvent extends SettingsEvent{
 final String currentPassword;
 final String password;
 final String confirmPassword;

 ChangePasswordButtonClickEvent({ required this.currentPassword, required this.password, required this.confirmPassword});
  @override
  // TODO: implement props
  List<Object?> get props => [currentPassword, password, confirmPassword];

 }

 class ChangePasswordSuccessEvent extends SettingsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

 }

 class ChangePasswordFailureEvent extends SettingsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

 }
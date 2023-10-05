part of 'add_certificate_bloc.dart';

@immutable
abstract class AddCertificateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

 class AddCertificateButtonClickEvent extends AddCertificateEvent{
  final AddCertificateDataModel addCertificateDataModel;
  AddCertificateButtonClickEvent(this.addCertificateDataModel);
 }
 class AddCertificateSuccessEvent extends AddCertificateEvent{}
class AddCertificateErrorEvent extends AddCertificateEvent{}

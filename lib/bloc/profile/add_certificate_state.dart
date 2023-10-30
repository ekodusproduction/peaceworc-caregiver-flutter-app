part of 'add_certificate_bloc.dart';

@immutable
abstract class AddCertificateState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCertificateInitial extends AddCertificateState {}

class AddCertificateLoadingState extends AddCertificateState{}
class AddCertificateSuccessState extends AddCertificateState {
  final AddCertificateResponse addCertificateResponse;
   AddCertificateSuccessState(this.addCertificateResponse);
}
class AddCertificateErrorState extends AddCertificateState {
  final String message;
  AddCertificateErrorState(this.message);
}



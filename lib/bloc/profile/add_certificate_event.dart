part of 'add_certificate_bloc.dart';

@immutable
abstract class AddCertificateEvent extends Equatable {

}

 class AddCertificateButtonClickEvent extends AddCertificateEvent{
  final String certificateOrCourse;
  final XFile? documnent;
  final String startYear;
  final String endYear;
  AddCertificateButtonClickEvent({required this.certificateOrCourse, required this.documnent, required this.startYear, required this.endYear});

  @override
  List get props => [certificateOrCourse, documnent, startYear, endYear];
 }
 class AddCertificateSuccessEvent extends AddCertificateEvent{
   @override
   List<Object> get props => [];
 }
class AddCertificateErrorEvent extends AddCertificateEvent{
  @override
  List<Object> get props => [];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/profile/add_certificate_model.dart';
import 'package:peace_worc/model/profile/add_certificate_response.dart';
import 'package:peace_worc/repository/profile_repository.dart';

part 'add_certificate_event.dart';
part 'add_certificate_state.dart';

class AddCertificateBloc extends Bloc<AddCertificateEvent, AddCertificateState> {
  final ProfileRepo _profileRepo = new ProfileRepo();
  AddCertificateBloc() : super(AddCertificateInitial()) {
    on<AddCertificateButtonClickEvent>(addCertificateButtonClikEvent);

  }

  Future<FutureOr<void>> addCertificateButtonClikEvent(AddCertificateButtonClickEvent event, Emitter<AddCertificateState> emit) async {
    try{
      emit(AddCertificateLoadingState());
      print("email"+event.startYear+"....."+event.endYear);
      final certificateAddResponse = await _profileRepo.uploadCertificate(event.certificateOrCourse, event.documnent, event.startYear, event.endYear);
      print("responsessss"+ certificateAddResponse.httpStatusCode.toString());
      emit(AddCertificateSuccessState(certificateAddResponse));
    } catch(e){
      print("expection"+e.toString());
    }
  }
}

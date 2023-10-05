import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/profile/add_certificate_model.dart';
import 'package:peace_worc/model/profile/add_certificate_response.dart';
import 'package:peace_worc/repository/profile_repository.dart';

part 'add_certificate_event.dart';
part 'add_certificate_state.dart';

class AddCertificateBloc extends Bloc<AddCertificateEvent, AddCertificateState> {
  final ProfileRepo _profileRepo = new ProfileRepo();
  AddCertificateBloc() : super(AddCertificateInitial()) {
    on<AddCertificateButtonClickEvent>(addCertificateButtonClikEvent as EventHandler<AddCertificateButtonClickEvent, AddCertificateState>);

  }

  Future<FutureOr<void>> addCertificateButtonClikEvent(AddCertificateDataModel addCertificateDataModel, Emitter<AddCertificateState> emit) async {
    try{
      emit(AddCertificateLoadingState());
      print("email"+addCertificateDataModel.startYear+"....."+addCertificateDataModel.endYear);
      final certificateAddResponse = await _profileRepo.uploadCertificate(addCertificateDataModel);
      print("responsessss"+ certificateAddResponse.httpStatusCode.toString());
      emit(AddCertificateSuccessState(certificateAddResponse));
    } catch(e){
      print("expection"+e.toString());
    }
  }
}

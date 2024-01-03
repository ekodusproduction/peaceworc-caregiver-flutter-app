import 'dart:io';

import 'package:peace_worc/model/doc_upload/doc_upload_response.dart';
import 'package:rxdart/rxdart.dart';

import '../../repository/profile_registration/upload_doc_repository.dart';

class UploadDocBloc{
  final  _repo = UploadDocRepository();
  final BehaviorSubject<GetDocumentResponse> _behaviourSubject = BehaviorSubject<GetDocumentResponse>();

  uploadDoc(
      File empFace,
      String empCode,
      String documentCategory,
      String expiry_date,
      ) async{
    GetDocumentResponse response = await _repo.uploadDoc(empFace, empCode, documentCategory, expiry_date);
    _behaviourSubject.sink.add(response);
  }
  BehaviorSubject<GetDocumentResponse> get subject => _behaviourSubject;
  dispose(){
    _behaviourSubject.close();
    subject.close();
  }
}
final uploadDocBloc = UploadDocBloc();
import 'package:peace_worc/model/doc_upload/doc_upload_response.dart';
import 'package:peace_worc/repository/profile_registration/get_document_repo.dart';
import 'package:rxdart/rxdart.dart';

class GetDocumentBloc{
  final  _repo = GetDocumentRepo();
  final BehaviorSubject<GetDocumentResponse> _behaviourSubject = BehaviorSubject<GetDocumentResponse>();

  getDocument() async{
    GetDocumentResponse response = await _repo.getDocument();
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetDocumentResponse> get subject => _behaviourSubject;
}
final getDocumentBloc = GetDocumentBloc();
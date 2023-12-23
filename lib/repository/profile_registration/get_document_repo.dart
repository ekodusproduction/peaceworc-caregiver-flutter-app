import 'package:dio/dio.dart';
import 'package:peace_worc/model/doc_upload/doc_upload_response.dart';
import '../../api/api_client.dart';
import '../../api/api_links.dart';

class GetDocumentRepo{
  Future<GetDocumentResponse> getDocument() async{
    GetDocumentResponse documentUploadResponse;
    final _apiClient = ApiClient.http();
    try{
      Response  response =  await _apiClient!.get(ApiLinks.getDocument);
      documentUploadResponse = GetDocumentResponse.fromJson(response.data);
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      documentUploadResponse = GetDocumentResponse.withError(e.message);
    }
    return documentUploadResponse;
  }
}
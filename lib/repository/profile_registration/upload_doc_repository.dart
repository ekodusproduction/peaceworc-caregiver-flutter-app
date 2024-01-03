import 'dart:io';

import 'package:dio/dio.dart';
import 'package:peace_worc/model/doc_upload/doc_upload_response.dart';
import '../../api/api_client.dart';
import '../../api/api_links.dart';

class UploadDocRepository{
  Future<GetDocumentResponse> uploadDoc(
      File empFace,
      String empCode,
      String documentCategory,
      String expiry_date,
      ) async {
    GetDocumentResponse _uploadDoc;
    final _apiClient = ApiClient.httpMultipartWithToken();
    try {
      var formData = FormData.fromMap({
        'document': await MultipartFile.fromFile(empFace.path, filename: empCode),
        'documentCategory': documentCategory,
        'expiry_date' : expiry_date,
      });

      Response response = await _apiClient!.post(
        '${ApiLinks.uploadDocument}',
        data: formData,
      );
      _uploadDoc = GetDocumentResponse.fromJson(response.data);
    } on DioError catch (e){
      _uploadDoc = GetDocumentResponse.withError(e.message);
    }

    return _uploadDoc;
  }
}
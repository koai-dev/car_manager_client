import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../const/strings.dart';

class ApiClient extends GetxController {
  String baseUrl = AppConfig.baseUrl;
  final String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;
  late Map<String, String> _mainHeaders;
  String? token;

  ApiClient({this.token}) {
    if (kDebugMode) {
      print(" token.............................................$token");
    }
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      var callUri = Uri.https(baseUrl, uri, query);
      debugPrint('====> API Call: $callUri\nHeader: $_mainHeaders');
      http.Response response = await http.get(
        callUri,
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, callUri.toString());
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(
      String uri, dynamic body, {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    try {
        if (kDebugMode) {
          print('====> GetX Base URL: $baseUrl');
          print('====> GetX Call: $uri');
          print('====> GetX Body: $body');
      }
      http.Response res = await http.post(
        Uri.https(baseUrl,uri,query),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      if (kDebugMode) {
        print("++++++++++++>>>=====");
      }
      Response response = handleResponse(res, uri);

      if(kDebugMode) {
        print('====> API Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
  Future<Response> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, {Map<String, String>? headers, Map<String, dynamic>? query,}) async {
      try {
        if(kDebugMode) {
          print('====> API Call: $uri\nToken: $token');
          print('====> API Body: $body with ${multipartBody.length} image ');
        }
        http.MultipartRequest _request = http.MultipartRequest('POST', Uri.https(baseUrl,uri, query));
        _request.headers.addAll(headers ?? _mainHeaders);
        for(MultipartBody multipart in multipartBody) {
          if(multipart.file != null) {
            if(kIsWeb) {
              Uint8List _list = await multipart.file!.readAsBytes();
              http.MultipartFile _part = http.MultipartFile(
                multipart.key, multipart.file!.readAsBytes().asStream(), _list.length,
                filename: basename(multipart.file!.path), contentType: MediaType('image', 'jpg'),
              );
              _request.files.add(_part);
            }else {
              File _file = File(multipart.file!.path);
              _request.files.add(http.MultipartFile(
                multipart.key, _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last,
              ));
            }
          }
        }
        _request.fields.addAll(body);
        http.Response _response = await http.Response.fromStream(await _request.send());
        Response response = handleResponse(_response, uri);
        if(kDebugMode) {
          print('====> API Response: [${response.statusCode}] $uri\n${response.body}');
        }
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
  Future<Response> putData(
      String uri,
      dynamic body, {
        Map<String, dynamic>? query,
        String? contentType,
        Map<String, String>? headers,
        Function(dynamic)? decoder,
        Function(double)? uploadProgress
      }) async {
      try {
        if (kDebugMode) {
          print('====> GetX Call: $uri');
          print('====> GetX Body: $body');
        }
        http.Response res = await http.put(
          Uri.https(baseUrl,uri, query),
          body: jsonEncode(body),
          headers: headers ?? _mainHeaders,
        ).timeout(Duration(seconds: timeoutInSeconds));
        Response response = handleResponse(res, uri);
        if(kDebugMode) {
          print('====> API Response: [${response.statusCode}] $uri\n${response.body}');
        }
        return response;

      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }

  }

  Future<Response> putMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, {Map<String, String>? headers, Map<String, dynamic>? query,}) async {

      try {
        if(kDebugMode) {
          print('====> API Call: $uri\nToken: $token');
          print('====> API Body: $body');
        }
        http.MultipartRequest _request = http.MultipartRequest('PUT', Uri.https(baseUrl,uri,query));
        _request.headers.addAll(headers ?? _mainHeaders);
        for(MultipartBody multipart in multipartBody) {
          if(multipart.file != null) {
            if(kIsWeb) {
              Uint8List _list = await multipart.file!.readAsBytes();
              http.MultipartFile _part = http.MultipartFile(
                multipart.key, multipart.file!.readAsBytes().asStream(), _list.length,
                filename: basename(multipart.file!.path), contentType: MediaType('image', 'jpg'),
              );
              _request.files.add(_part);
            }else {
              File _file = File(multipart.file!.path);
              _request.files.add(http.MultipartFile(
                multipart.key, _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last,
              ));
            }
          }
        }
        _request.fields.addAll(body);
        http.Response _response = await http.Response.fromStream(await _request.send());
        Response response = handleResponse(_response, uri);
        if(kDebugMode) {
          print('====> API Response: [${response.statusCode}] $uri\n${response.body}');
        }
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
  }

  Future<Response> deleteData(String uri, {Map<String, String>? headers, Map<String, dynamic>? query,}) async {
      try {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        http.Response _response = await http.delete(
          Uri.https(baseUrl,uri, query),
          headers: headers ?? _mainHeaders,
        ).timeout(Duration(seconds: timeoutInSeconds));
        return handleResponse(_response, uri);
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    }catch(e) {
      if (kDebugMode) {
        print("$uri: $e");
      }
    }
    Response _response = Response(
      body: _body ?? response.body, bodyString: response.body.toString(),
      request: Request(headers: response.request!.headers, method: response.request!.method, url: response.request!.url),
      headers: response.headers, statusCode: response.statusCode, statusText: response.reasonPhrase,
    );
    if(_response.statusCode != 200 && _response.body != null && _response.body is !String) {
      if(_response.body.toString().startsWith('{errors: [{code:')) {
        _response = Response(statusCode: _response.statusCode, body: _response.body);
      }else if(_response.body.toString().startsWith('{message')) {
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _response.body['message']);
      }
    }else if(_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    debugPrint('====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    return _response;
  }

}
class MultipartBody {
  String key;
  File? file;
  MultipartBody(this.key, this.file);
}
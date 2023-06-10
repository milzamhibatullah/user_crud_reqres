import 'dart:async';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiConfig {
  ApiConfig._();

  static ApiConfig? _instance;

  static ApiConfig get instance => _instance ?? ApiConfig._();
  static const String _baseUrl = 'https://reqres.in/api/';

  _header() => {'Content-Type': 'application/json'};

  get(String url) async {
    // print('GET : $url');
    try {
      log('api url => ${_baseUrl + url}', name: 'API URL');
      final response = await http
          .get(Uri.parse(_baseUrl + url), headers: _header())
          .timeout(const Duration(seconds: 30));
      log('response get => ${response.body}', name: 'API GET');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } on TimeoutException catch (_) {
      return 'fatal';
    } catch (e) {
      return 'fatal';
    }
  }

  post(String url, {dynamic data}) async {
    log('api url => ${_baseUrl + url}', name: 'API POST URL');
    try {
      print(data);
      var response = await http
          .post(
            Uri.parse(_baseUrl + url),
            headers: _header(),
            body: data,
          )
          .timeout(Duration(seconds: 30));
      log('response post => ${response.body}', name: 'API POST');

      if (response.statusCode == 201) {
        return response.body;
      } else {
        return "error";
      }
    } on TimeoutException {
      return 'fatal';
    } catch (e) {
      return 'fatal';
    }
  }

  delete(String url) async {
    log('api url => ${_baseUrl + url}', name: 'API Delete URL');
    try {
      var response = await http
          .delete(
        Uri.parse(_baseUrl + url),
        headers: _header(),
      )
          .timeout(const Duration(seconds: 30));
      log('response delete => ${response.body}', name: 'API DELETE');

      if (response.statusCode == 204) {
        return 'success';
      } else {
        return "error";
      }
    } on TimeoutException {
      return 'fatal';
    } catch (e) {
      return 'fatal';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:teramedik/app/utils/network/index.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseProvider extends GetConnect {
  @override
  InternalFinalCallback<void> get onStart {
    httpClient.baseUrl = Url.baseUrl;
    httpClient.addRequestModifier((Request<dynamic> request) {
      return request;
    });
    return super.onStart;
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    Map<String, String>? additionalHeader = headers;
    additionalHeader ??= <String, String>{};
    additionalHeader.addAll(RequestInterceptor.getHeaders);
    additionalHeader.forEach((String key, dynamic value) {
      additionalHeader![key] = value.toString();
    });
    Map<String, dynamic>? queries = query;
    queries ??= <String, dynamic>{};
    queries.addAll(RequestInterceptor.getQueries);
    queries.forEach((String key, dynamic value) {
      queries![key] = value.toString();
    });
    return super.get(
      url,
      headers: additionalHeader,
      contentType: contentType,
      query: queries,
      decoder: decoder,
    );
  }
}

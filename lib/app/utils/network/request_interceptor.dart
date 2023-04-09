class RequestInterceptor {
  static Map<String, String> get getHeaders {
    final Map<String, String> headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      "Accept-Type": "application/json",
      'Accept': '*/*'
    };
    return headers;
  }

  static Map<String, dynamic> get getQueries {
    final Map<String, dynamic> queries = <String, dynamic>{};

    return queries;
  }
}

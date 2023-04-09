class Url {
  // Base URLs
  // static const String baseUrl = 'https://www.gadingtech.id/api/teramedik';
  // static const String baseUrl = 'http://10.0.2.2:8000/api/';
  static const String baseUrl = 'http://192.168.2.92:8000/api/';
  // static const String baseUrl = 'http://36.72.18.168:8000/api/';
  // static const String baseUrl = 'http://127.0.0.1:8000/api/';

  // Hospital List
  static const String hospitals = 'hospitals';

  // Hospital Detail
  static String hospitalDetail(dynamic hospitalId) => 'hospitals/$hospitalId';
}

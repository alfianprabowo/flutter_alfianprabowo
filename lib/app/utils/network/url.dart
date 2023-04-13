class Url {
  // Base URLs
  static const String baseUrl = 'https://www.gadingtech.id/teramedik/api/';
  // static const String baseUrl = 'http://10.0.2.2:8000/api/';
  // static const String baseUrl = 'http://192.168.2.92:8000/api/';

  // Hospital List
  static const String hospitals = 'hospitals';

  // Hospital Detail
  static String hospitalDetail(dynamic hospitalId) => 'hospitals/$hospitalId';
}

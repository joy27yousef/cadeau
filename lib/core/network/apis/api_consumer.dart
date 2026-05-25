// abstract class ApiConsumer {
//   Future<dynamic> get(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//   });
//   Future<dynamic> post(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     bool isFromData = false,
//     required bool withToken,
//   });
//   Future<dynamic> patch(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//   });
//   Future<dynamic> delete(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     bool isFromData = false,
//   });
// }
// core/data/apis/api_consumer.dart

abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool withToken = true,
  });

  Future<dynamic> post(
    String path, {
    Object? data, // غيرناه إلى Object ليتوافق مع مواصفات dio
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    bool withToken = true,
  });

  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    bool withToken = true,
  });

  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    bool withToken = true,
  });
}
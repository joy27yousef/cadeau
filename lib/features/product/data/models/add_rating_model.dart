import 'package:cadeau/core/constant/app_endpoint.dart';

class AddRatingResponse {
  final bool status;
  final String? message;
  final double rating;
  final String? review;
  final int code;

  AddRatingResponse({
    required this.status,
    this.message,
    required this.rating,
    this.review,
    required this.code,
  });

  factory AddRatingResponse.fromJson(Map<String, dynamic> json) {
    return AddRatingResponse(
      status: json[ApiKey.status] ?? false,
      message: json[ApiKey.message],
      rating: double.tryParse(json[ApiKey.rating]?.toString() ?? '') ?? 0.0,
      review: json[ApiKey.review],
      code: json[ApiKey.code] ?? 0,
    );
  }
}

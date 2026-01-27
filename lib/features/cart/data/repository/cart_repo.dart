import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/cart/data/model/add_to_cart_model.dart';

class CartRepo {
  final ApiConsumer api;

  CartRepo({required this.api});

  Future<AddToCartModel> addtoCart() async {
    try {
      final response = await api.get(AppEndpoint.addtoCart);
      final cart = AddToCartModel.fromJson(response);
      return cart;
    } catch (e) {
      throw Exception('Failed to add to cart');
    }
  }
}

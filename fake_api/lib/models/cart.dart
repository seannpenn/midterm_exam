import 'package:fake_api/models/cart_product.dart';
import 'package:fake_api/models/product.dart';

class Cart{
  String id;
  String userId;
  String date;
  List<CartProduct> products = [];

  Cart({
    this.id = '',
    this.userId = '',
    this.date = '',
    this.products = const [],
  });

  factory Cart.fromJson(Map<String, dynamic> item) {
    final productCart = <CartProduct>[];
    for(var item in item['products']){
      productCart.add(CartProduct.fromJsonProductCart(item));
    }
    
    return Cart(
        id: item['id'].toString(),
        userId: item['userID'].toString(),
        date: item['date'].toString(),
        products: productCart,
    );
  }

}
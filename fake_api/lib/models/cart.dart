import 'package:fake_api/models/cart_product.dart';
import 'package:fake_api/models/product.dart';

class Cart{
  int? id;
  String userId;
  String date;
  List<dynamic>? products;

  Cart({
    this.id = 0,
    this.userId = '',
    this.date = '',
    this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> item) {
    // final productCart = <CartProduct>[];
    // for(var item in item['products']){
    //   productCart.add(CartProduct.fromJsonProductCart(item));
    // }
    
    return Cart(
        id: item['id'],
        userId: item['userID'].toString(),
        date: item['date'].toString(),
        products: item['products'],
    );
  }

}
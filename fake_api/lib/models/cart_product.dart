class CartProduct{
  String productId;
  String quantity;

  CartProduct({
    this.productId = '',
    this.quantity = '',
  });

  factory CartProduct.fromJsonProductCart(Map<String, dynamic> item) {
    return CartProduct(
      productId: item['productId'].toString(),
      quantity: item['quantity'].toString(),
    );
  }
}
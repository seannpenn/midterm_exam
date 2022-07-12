class Product {
  String id;
  String title;
  String price;
  String category;
  String description;
  String image;
  String quantity;
  String productId;

  Product(
      {this.id = '',
      this.title = '',
      this.price = '',
      this.category = '',
      this.description = '',
      this.image = '',
      this.quantity = '',
      this.productId = ''
      });

  factory Product.fromJson(Map<String, dynamic> item) {
    return Product(
      id: item['id'].toString(),
      title: item['title'],
      price: item['price'].toString(),
      category: item['category'],
      description: item['description'],
      image: item['image'],
    );
  }
  factory Product.fromJsonProductCart(Map<String, dynamic> item) {
    return Product(
      productId: item['productId'].toString(),
      quantity: item['quantity'].toString(),
    );
  }
}

class OrderManage {
  final int id;
  final String customerName;
  final String email;
  final String phoneNumber;
  final String shippingAddress;
  final List<String> products;
  final String orderDate;
  final int totalPrice;
  final String paymentMethod;
  final bool status;

  OrderManage(
      {required this.id,
      required this.customerName,
      required this.email,
      required this.phoneNumber,
      required this.shippingAddress,
      required this.products,
      required this.orderDate,
      required this.totalPrice,
      required this.paymentMethod,
      required this.status});

  factory OrderManage.fromJson(Map<String, dynamic> json) {
    return OrderManage(
        id: int.parse(json['id']),
        customerName: json['customerName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        shippingAddress: json['shippingAddress'],
        products: List<String>.from(json['products']),
        orderDate: json['orderDate'],
        totalPrice: int.parse(json['totalPrice']),
        paymentMethod: json['paymentMethod'],
        status: json['status'] == "0" ? false : true);
  }
}

class Account {
  final String name;
  final String email;
  final int orderCount;

  Account({required this.name, required this.email, required this.orderCount});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      name: json['name'],
      email: json['email'],
      orderCount: json['order_count'] is String
          ? int.parse(json['order_count'])
          : json['order_count'],
    );
  }
}

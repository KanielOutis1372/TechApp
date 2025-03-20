class Order {
  final int id;
  final int userID;
  final DateTime date;
  final int totalprice;
  final bool status;

  Order(
      {required this.id,
      required this.userID,
      required this.date,
      required this.totalprice,
      required this.status});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      userID: json['user_id'] is String
          ? int.parse(json['user_id'])
          : json['user_id'],
      date: json['order_date'] is String
          ? DateTime.parse(json['order_date'])
          : json['order_date'],
      totalprice: json['totalprice'] is String
          ? int.parse(json['totalprice'])
          : json['totalprice'],
      status: json['status'] == "0" ? false : true,
    );
  }
}

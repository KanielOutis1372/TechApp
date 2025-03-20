class User {
  final int id;
  final String username;
  final String password;
  final String email;
  final String phoneNumber;
  final String avatarURL;
  final String deliveryAddress;
  final bool isAdmin;

  User(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber,
      required this.avatarURL,
      required this.deliveryAddress,
      required this.isAdmin});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      avatarURL: json['avatarURL'] ?? "",
      deliveryAddress: json['delivery_address'] ?? "",
      isAdmin: json['isAdmin'] == '0' ? false : true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'phone_number': phoneNumber,
      'avatarURL': avatarURL,
      'delivery_address': deliveryAddress,
      'isAdmin': isAdmin,
    };
  }
}

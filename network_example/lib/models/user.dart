class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final Object company;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.company,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      company: json['company'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'company': company,
        'username': username,
      };
}

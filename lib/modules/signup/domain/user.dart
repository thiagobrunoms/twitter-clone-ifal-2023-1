class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final int code;

  User({
    required this.id,
    required this.name, 
    required this.email, 
    required this.password, 
    required this.code
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      code: map['code'],
    );
  }

}
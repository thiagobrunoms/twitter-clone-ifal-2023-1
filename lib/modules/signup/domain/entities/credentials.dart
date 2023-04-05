class Credentials { 

  Credentials({
    required this.firstName,
    required this.lastName, 
    required this.email, 
    this.age = 25
  });  

  final String firstName;
  final String lastName;
  final String email;
  final int age;

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": "UFAL IFAL",
      "age": age,
      "email": email
    };
  }

}
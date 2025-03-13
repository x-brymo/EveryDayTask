class UserModel {
  final String name;
  final String email;
  final String? password;

  UserModel({required this.name, required this.email,  this.password});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password)';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.name == name &&
      other.email == email &&
      other.password == password;
  }
  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ password.hashCode;
  }



}
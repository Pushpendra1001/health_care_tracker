class User {
  final String id;
  final String name;
  final String email;
  final String userType;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'userType': userType,
      'imageUrl': imageUrl,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      userType: map['userType'],
      imageUrl: map['imageUrl'],
    );
  }
}

import 'package:health_care/models/usermodel.dart';

class Patient extends User {
  Patient({
    required String id,
    required String name,
    required String email,
    required String imageUrl,
  }) : super(
            id: id,
            name: name,
            email: email,
            userType: 'patient',
            imageUrl: imageUrl);

  // Method to convert a Patient instance into a Map
  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }

  // Method to create a Patient instance from a Map
  static Patient fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      imageUrl: map['imageUrl'],
    );
  }
}

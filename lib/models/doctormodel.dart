import 'package:health_care/models/usermodel.dart';

class Doctor extends User {
  final String specialization;
  final int charge;

  Doctor({
    required String id,
    required String name,
    required String email,
    required String imageUrl,
    required this.specialization,
    required this.charge,
  }) : super(
            id: id,
            name: name,
            email: email,
            userType: 'doctor',
            imageUrl: imageUrl);

  // Method to convert a Doctor instance into a Map
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map.addAll({
      'specialization': specialization,
      'charge': charge,
    });
    return map;
  }

  // Method to create a Doctor instance from a Map
  static Doctor fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      imageUrl: map['imageUrl'],
      specialization: map['specialization'],
      charge: map['charge'],
    );
  }
}

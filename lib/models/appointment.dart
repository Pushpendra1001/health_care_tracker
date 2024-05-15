class Appointment {
  final String id;
  final String doctorId;
  final String patientId;
  final DateTime date;
  final String status; // 'urgent' or 'normal'

  Appointment({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.date,
    required this.status,
  });

  // Method to convert an Appointment instance into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'doctorId': doctorId,
      'patientId': patientId,
      'date': date.toIso8601String(),
      'status': status,
    };
  }

  // Method to create an Appointment instance from a Map
  static Appointment fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      doctorId: map['doctorId'],
      patientId: map['patientId'],
      date: DateTime.parse(map['date']),
      status: map['status'],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:health_care/data/dart.dart';
import 'package:health_care/pages/ClientSection/common/doctorProfile.dart';

class DoctorMyAppointmentScreen extends StatelessWidget {
  const DoctorMyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                "Your appointments",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("No Appointments"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

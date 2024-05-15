import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Accept_Decline_Page extends StatelessWidget {
  Accept_Decline_Page(
      {super.key, required this.caseData, required this.doctorId});

  final Map<String, dynamic> caseData;
  final String doctorId;

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Case Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Case Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Patient Name: ${caseData["patientName"]}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Patient Disease Name : ${caseData["diseaseName"]}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Patient Description: ${caseData["description"]}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Date of Appointment: ${caseData["date"]}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Time : ${caseData["time"]}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Appointment Status: ${caseData["status"]}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final docRef = FirebaseFirestore.instance
                          .collection('urgent_cases')
                          .doc(caseData['id']);

                      try {
                        if (caseData['doctorId'] == doctorId) {
                          await docRef.update({'status': 'accepted'});
                          showSnackBar(context, "Appointment is accepted");
                        } else {
                          showSnackBar(context, "Accepted");
                        }
                      } catch (e) {
                        showSnackBar(context, "Error updating appointment: $e");
                      }

                      Navigator.pop(context);
                    },
                    child: Text("Accept"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final docRef = FirebaseFirestore.instance
                          .collection('urgent_cases')
                          .doc(caseData['id']);

                      try {
                        if (caseData['doctorId'] == doctorId) {
                          await docRef.update({'status': 'rejected'});
                          showSnackBar(context, "Appointment is rejected");
                        } else {
                          showSnackBar(context, "Rejected");
                        }
                      } catch (e) {
                        showSnackBar(context, "Error updating appointment: $e");
                      }

                      Navigator.pop(context);
                    },
                    child: Text("Decline"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

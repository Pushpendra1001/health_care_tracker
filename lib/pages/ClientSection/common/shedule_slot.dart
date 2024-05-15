import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class shedule_slot extends StatefulWidget {
  const shedule_slot({super.key});

  @override
  State<shedule_slot> createState() => _shedule_slotState();
}

class _shedule_slotState extends State<shedule_slot> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final _patientNameController = TextEditingController();

  final _diseaseNameController = TextEditingController();

  final _descriptionController = TextEditingController();

  bool _isUrgent = false;

  String _userId = FirebaseAuth.instance.currentUser!.uid;

  void showEmailNotExistSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: message == "Account Created successfully"
              ? const TextStyle(color: Colors.green)
              : const TextStyle(color: Colors.red),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void saveAppointment() {
    String collection = _isUrgent ? 'urgent_cases' : 'normal_cases';

    FirebaseFirestore.instance.collection(collection).add({
      'patientName': _patientNameController.text,
      'diseaseName': _diseaseNameController.text,
      'description': _descriptionController.text,
      'date': _selectedDate?.toIso8601String(),
      'time': _selectedTime?.format(context),
      'userId': _userId,
      'isUrgent': _isUrgent,
      'status': 'pending',
    }).then((value) {
      print("Appointment saved");
    }).catchError((error) {
      print("Failed to save appointment: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _patientNameController,
                  decoration: InputDecoration(labelText: 'Patient Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _diseaseNameController,
                  decoration: InputDecoration(labelText: 'Disease Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter disease name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 1),
                        );
                        if (datePicked != null) {
                          setState(() {
                            _selectedDate = datePicked;
                          });
                        }
                      },
                      child: const Text('Select Date'),
                    ),
                    if (_selectedDate != null)
                      Text('Selected date: ${_selectedDate!.toString()}'),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? timePicked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (timePicked != null) {
                          setState(() {
                            _selectedTime = timePicked;
                          });
                        }
                      },
                      child: const Text('Select Time'),
                    ),
                    if (_selectedTime != null)
                      Text('Selected time: ${_selectedTime!.format(context)}'),
                  ],
                ),
                CheckboxListTile(
                  title: Text('Urgent Case'),
                  value: _isUrgent,
                  onChanged: (bool? value) {
                    setState(() {
                      _isUrgent = value!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveAppointment();

                      showEmailNotExistSnackBar(
                          context, "Your Appointment is sent");

                      Navigator.pop(context);
                    }
                  },
                  child: Text('Book Appointment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

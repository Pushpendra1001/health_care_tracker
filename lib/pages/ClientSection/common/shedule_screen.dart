import 'package:flutter/material.dart';

class SheduleScreen extends StatefulWidget {
  const SheduleScreen({super.key});

  @override
  State<SheduleScreen> createState() => _SheduleScreenState();
}

class _SheduleScreenState extends State<SheduleScreen> {
  final DateTime _selectedDateTime = DateTime.now();

  final List<String> _timeSlots = [
    '8:00 - 8:30',
    '8:30 - 9:00',
    '9:00 - 9:30',
    '9:30 - 10:00',
    '10:00 - 10:30',
    '10:30 - 11:00',
    '11:00 - 11:30',
    '11:30 - 12:00',
    '12:00 - 12:30',
    '12:30 - 13:00',
    '14:00 - 14:30',
    '14:30 - 15:00',
    '15:00 - 15:30',
    '15:30 - 16:00',
    '16:00 - 16:30',
    '16:30 - 17:00',
    '17:00 - 17:30',
    '17:30 - 18:00',
    '18:00 - 18:30',
    '18:30 - 19:00',
    '19:00 - 19:30',
    '19:30 - 20:00',
  ];

  String _selectedTimeSlot = '';
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Shedule Your Appointment',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    DateTime? DatePicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2023, 10, 20),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2024),
                    );
                    if (DatePicked != null) {
                      print("Dateselected");
                    }
                  },
                  child: const Text('Select Date')),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Select a Time Slot',
                style: TextStyle(fontSize: 23),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _timeSlots.map((slot) {
                  // Create a button for each time slot
                  return SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        // Update the selected time slot
                        setState(() {
                          _selectedTimeSlot = slot;
                        });
                      },
                      // Change the button color based on the selection
                      style: ElevatedButton.styleFrom(
                        backgroundColor: slot == _selectedTimeSlot
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text(slot),
                    ),
                  );
                }).toList(),
              ),
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Book Now")))
            ],
          ),
        ),
      ),
    );
  }
}

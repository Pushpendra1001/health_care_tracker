import 'package:flutter/material.dart';
import 'package:health_care/pages/ClientSection/common/shedule_slot.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key, required this.DoctorDetails})
      : super(key: key);

  final Map DoctorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          DoctorDetails["UrlImage"]?.toString() ?? ''),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DoctorDetails["name"]?.toString() ?? 'Unknown',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DoctorDetails["doctorSpecialization"]?.toString() ??
                              'Unknown',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const Text(
                              "Age:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              DoctorDetails["doctorAge"]?.toString() ??
                                  'Unknown',
                              style: const TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const Text(
                              "Email: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              DoctorDetails["username"]?.toString() ??
                                  'Unknown',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const Text(
                              "Experience: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              DoctorDetails["doctorExperience"]?.toString() ??
                                  'Unknown',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const Text(
                              "Description: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              DoctorDetails["doctorDescription"]?.toString() ??
                                  'Unknown',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const Text(
                              "Charge P/hr: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              DoctorDetails["doctorCharge"]?.toString() ??
                                  'Unknown',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shedule_slot(),
                                ));
                          },
                          child: Text("Book Appointment"))
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

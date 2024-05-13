import 'package:flutter/material.dart';
import 'package:health_care/pages/ClientSection/common/shedule_screen.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key, required this.DoctorDetails});

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
                      backgroundImage: NetworkImage(DoctorDetails["UrlImage"]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DoctorDetails["Name"],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          DoctorDetails["Specialization"],
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
                              DoctorDetails["Age"].toString(),
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
                              "Contact: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              DoctorDetails["PhoneNo"].toString(),
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
                              DoctorDetails["Email"].toString(),
                              style: const TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              "Experience: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Spacer(),
                            Text(
                              "10+ Year",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Comprehensive and compassionate healthcare with Dr. Emma Chen, specializing in Cardiology. With 10+ years of experience, Dr. Chen offers expert care, utilizing cutting-edge technology to ensure accurate diagnoses and personalized treatment plans. Dedicated to patient well-being, she combines medical expertise with empathy, creating a supportive and reassuring environment. Trust Dr. Chen for a holistic approach to cardiovascular health, where every patient receives individualized attention and top-notch medical care.",
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SheduleScreen(),
                          ));
                    },
                    child: const Text("Book Your Slot"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

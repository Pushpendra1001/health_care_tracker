import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/pages/ClientSection/login/signupScreen.dart';
import 'package:health_care/pages/ClientSection/mainScreens/AppointmentScreen.dart';
import 'package:health_care/pages/DoctorSection/accept_decline.dart';
import 'package:health_care/pages/DoctorSection/myappointments.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  int _currentIndex = 0;
  final screens = [
    HomeScreen(),
    DoctorMyAppointmentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Dashboard',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<DocumentSnapshot>> _future;
  late Future<List<DocumentSnapshot>> _futureNormal;
  String? uid;

  @override
  void initState() {
    super.initState();
    _future = fetchUrgentCases();
    _futureNormal = fetchNormalCases();
  }

  Future<List<DocumentSnapshot>> fetchUrgentCases() async {
    final urgentCasesCollection =
        FirebaseFirestore.instance.collection('urgent_cases');

    final querySnapshot = await urgentCasesCollection.get();
    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot>> fetchNormalCases() async {
    final NormalCasesCollection =
        FirebaseFirestore.instance.collection('normal_cases');

    final querySnapshot = await NormalCasesCollection.get();
    return querySnapshot.docs;
  }

  void getCurrentUserId() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    uid = user?.uid;
    print('Current user ID: $uid');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Urgent Cases',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      fetchUrgentCases();
                    });
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<DocumentSnapshot>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data![index];
                    final caseData = doc.data() as Map<String, dynamic>;

                    return Card(
                      child: ListTile(
                        title: Text(
                            'Patient Name: ${caseData['patientName']}'), // replace 'patientName' with the field name of the patient name
                        subtitle: Text(
                            'Case Details: ${caseData['caseDetails']}'), // replace 'caseDetails' with the field name of the case details
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Accept_Decline_Page(
                                  caseData: caseData,
                                  doctorId: uid.toString(),
                                ),
                              ),
                            );
                          },
                          child: const Text('View'),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Normal Cases',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      fetchNormalCases();
                    });
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<DocumentSnapshot>>(
            future: _futureNormal,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data![index];
                    final caseData = doc.data() as Map<String, dynamic>;

                    return Card(
                      child: ListTile(
                        title: Text(
                            'Patient Name: ${caseData['patientName']}'), // replace 'patientName' with the field name of the patient name
                        subtitle: Text(
                            'Case Details: ${caseData['caseDetails']}'), // replace 'caseDetails' with the field name of the case details
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Accept_Decline_Page(
                                  caseData: caseData,
                                  doctorId: uid.toString(),
                                ),
                              ),
                            );
                          },
                          child: const Text('View'),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

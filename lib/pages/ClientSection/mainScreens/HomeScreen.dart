import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/data/dart.dart';
import 'package:health_care/pages/ClientSection/common/doctorProfile.dart';
import 'package:health_care/pages/ClientSection/mainScreens/SearchScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneheight = MediaQuery.of(context).size.height;
    var phonewidth = MediaQuery.of(context).size.width;

    String getGreetingMessage() {
      var hour = DateTime.now().hour;

      if (hour < 12) {
        return 'Good Morning,';
      }
      if (hour < 17) {
        return 'Good Afternoon,';
      }
      return 'Good Evening,';
    }

    Future<List<Map<String, dynamic>>> fetchDoctorsData() async {
      final ref = FirebaseDatabase.instance.ref('doctors');
      final snapshot = await ref.get();

      if (snapshot.exists) {
        return snapshot.children.map((child) {
          if (child.value is Map) {
            final doctorData = Map<String, dynamic>.from(
                child.child('doctorDetails').value as Map);
            return {
              'doctorId': child.key,
              'doctorDetails': doctorData,
            };
          } else {
            throw Exception('Invalid data format');
          }
        }).toList();
      } else {
        throw Exception('No data available');
      }
    }

    Future<List<Map<String, dynamic>>> doctorsDataFuture = fetchDoctorsData();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            "https://th.bing.com/th/id/R.7d1eeb9a0b22fbbb9c99dbfbdad26915?rik=pC4tuK%2bF6V8Eag&riu=http%3a%2f%2fwww.newdesignfile.com%2fpostpic%2f2009%2f03%2fuser-icon_88182.png&ehk=t1ne3u3qnvYkCzMjziNf4os8ystdCogSWqUfBluXwA8%3d&risl=&pid=ImgRaw&r=0"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: phoneheight / 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreetingMessage(),
                      style: GoogleFonts.gabriela(
                          fontSize: 25, fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "User",
                      style: GoogleFonts.gabriela(
                        fontSize: 20,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        "Most Popular",
                        style: GoogleFonts.inconsolata(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 8, top: 10, bottom: 10),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchScreen(),
                                  )),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: colorList[index],
                                    borderRadius: BorderRadius.circular(20)),
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.white),
                                          child: const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Icon(Icons.favorite,
                                                color: Colors.red),
                                          )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        doctorsData[index]['doctorDetails']
                                            ["Specialization"],
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        "${randomNumbers[index]} Doctors",
                                        style: const TextStyle(
                                            color: Colors.white60),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text("Top Doctors",
                            style: GoogleFonts.inconsolata(fontSize: 20)),
                      ),
                      const Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('users')
                              .where('role', isEqualTo: 'doctor')
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final doctorsData = snapshot.data!.docs;

                              if (doctorsData.isEmpty) {
                                return Text('No doctors available');
                              }

                              return ListView.builder(
                                itemCount: doctorsData.length,
                                itemBuilder: (context, index) {
                                  final doctorData = doctorsData[index].data()
                                      as Map<String, dynamic>;

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DoctorProfile(
                                                        DoctorDetails:
                                                            doctorData,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                title: Text(
                                                    doctorData["name"] ??
                                                        'Unknown'),
                                                leading: CircleAvatar(
                                                  radius: 32,
                                                  backgroundImage: NetworkImage(
                                                    doctorData["UrlImage"]
                                                            ?.toString() ??
                                                        '',
                                                  ),
                                                ),
                                                subtitle: Text(doctorData[
                                                        "doctorSpecialization"] ??
                                                    'Unknown'),
                                                trailing: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text(
                                                      "View More",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${doctorData["doctorCharge"]?.toString() ?? 'Unknown'}",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      )
                    ],
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

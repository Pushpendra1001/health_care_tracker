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
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7)),
                        child: CircleAvatar(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.sunny,
                              )),
                        ),
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
                      "Good Evening ,",
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
                        child: Text("Top Doctors in Jaipur",
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
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
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
                                                              doctorsData[index]
                                                                  [
                                                                  "doctorDetails"]),
                                                ));
                                          },
                                          title: Text(doctorsData[index]
                                              ["doctorDetails"]["Name"]),
                                          leading: CircleAvatar(
                                              radius: 32,
                                              backgroundImage: NetworkImage(
                                                  doctorsData[index]
                                                              ["doctorDetails"]
                                                          ["UrlImage"]
                                                      .toString())),
                                          subtitle: Text(doctorsData[index]
                                                  ["doctorDetails"]
                                              ["Specialization"]),
                                          trailing: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text(
                                                  "View More",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                    "₹ ${doctorsData[index]["doctorDetails"]["Charge"].toString()}")
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
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

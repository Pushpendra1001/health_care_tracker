// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:health_care/pages/ClientSection/mainScreens/AppointmentScreen.dart';
import 'package:health_care/pages/loginPages/loginPage.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  Widget profile_option(String optionName, iconName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              iconName,
              size: 30,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(optionName,
                style: const TextStyle(color: Colors.black, fontSize: 20)),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_rounded,
              size: 30,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/R.7d1eeb9a0b22fbbb9c99dbfbdad26915?rik=pC4tuK%2bF6V8Eag&riu=http%3a%2f%2fwww.newdesignfile.com%2fpostpic%2f2009%2f03%2fuser-icon_88182.png&ehk=t1ne3u3qnvYkCzMjziNf4os8ystdCogSWqUfBluXwA8%3d&risl=&pid=ImgRaw&r=0"),
                radius: 70,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Text(
                "User Baswal",
                style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                profile_option("Edit Profile", Icons.person),
                InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppointmentScreen(),
                        )),
                    child: profile_option(
                        "Your Appointments", Icons.calendar_month)),
                profile_option("Your Reports", Icons.edit_document),
                profile_option("Payments", Icons.payment),
                profile_option("Settings", Icons.settings),
                InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Future.delayed(const Duration(seconds: 2));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        ).then((value) {
                          messageBar(context, "Sign Out Successfully");
                        });
                      });
                    },
                    child: profile_option("Logout", Icons.logout))
              ],
            )
          ],
        ),
      ),
    ));
  }
}

void messageBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: message == "Sign Out Successfully"
            ? const TextStyle(color: Colors.red)
            : const TextStyle(color: Colors.red),
      ),
    ),
  );
}

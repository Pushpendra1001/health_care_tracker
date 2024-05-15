import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/pages/ClientSection/common/imagePicker.dart';
import 'package:health_care/pages/loginPages/loginPage.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _username = TextEditingController();
  final Name = TextEditingController();
  final _password = TextEditingController();
  final Otp = TextEditingController();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _experienceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _doctorSpecialization = TextEditingController();
  final _doctorCharge = TextEditingController();
  String role = 'patient';

  final ImagePicker _picker = ImagePicker();

  void saveUserToFirebase(User user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(user.uid).set({
      'username': _username.text,
      'name': Name.text,
      'role': role,
      'doctorAge': _ageController.text,
      'doctorExperience': _experienceController.text,
      'doctorDescription': _descriptionController.text,
      "doctorSpecialization": _doctorSpecialization.text,
      "doctorCharge": _doctorCharge.text,
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  height: MediaQuery.of(context).size.height / 2 / 2,
                  'assets/signin.png',
                  fit: BoxFit.contain,
                ),
                Text(
                  "Join Our Family",
                  style: GoogleFonts.aBeeZee(fontSize: 23),
                ),
                const SizedBox(
                  height: 30,
                ),
                login_field(
                  controller: Name,
                  hint_text: "What's Your Name ",
                  obscuretext: false,
                  SendButton: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                login_field(
                  controller: _username,
                  hint_text: "Enter Your Email",
                  obscuretext: false,
                  SendButton: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                login_field(
                  controller: _password,
                  hint_text: "Create Your Password",
                  obscuretext: true,
                  SendButton: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: DropdownButtonFormField(
                    value: role,
                    items: ['patient', 'doctor'].map((String role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        role = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (role == 'doctor') ...[
                  SizedBox(
                    height: 20,
                  ),
                  login_field(
                    controller: _ageController,
                    hint_text: "What's Your Age ",
                    obscuretext: false,
                    SendButton: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  login_field(
                    controller: _doctorSpecialization,
                    hint_text: "What is Your Specialization ",
                    obscuretext: false,
                    SendButton: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  login_field(
                    controller: _experienceController,
                    hint_text: "Tell Me your Experience",
                    obscuretext: false,
                    SendButton: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  login_field(
                    controller: _descriptionController,
                    hint_text: "Give Your Description ",
                    obscuretext: false,
                    SendButton: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  login_field(
                    controller: _doctorCharge,
                    hint_text: "What is your P/hr charge",
                    obscuretext: false,
                    SendButton: false,
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    child: TextButton(
                      style: const ButtonStyle(),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        try {
                          final userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _username.text,
                            password: _password.text,
                          );

                          User? user = userCredential.user;
                          print('Signed in: ${user!.uid}');
                          print("Starting !!!!!!!!");

                          saveUserToFirebase(user);
                          print("yeh save data to firebase !!!!!!!!");

                          showEmailNotExistSnackBar(
                              context, "Account Created successfully");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            showEmailNotExistSnackBar(
                                context, "Email is already in use.");
                          } else {
                            showEmailNotExistSnackBar(
                                context, "An error occurred: ${e.message}");
                          }
                        } catch (e) {
                          showEmailNotExistSnackBar(
                              context, "An error occurred: $e");
                        }
                      },
                    ))
              ]),
        ),
      ),
    );
  }
}

class login_field extends StatelessWidget {
  final controller;
  final String hint_text;
  final bool obscuretext;
  final bool SendButton;

  const login_field(
      {super.key,
      this.controller,
      required this.hint_text,
      required this.obscuretext,
      required this.SendButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          border: const OutlineInputBorder(),
          suffixIcon: SendButton == true
              ? const Icon(Icons.send_rounded)
              : const SizedBox(),
          hintText: hint_text,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade700),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        obscureText: obscuretext,
      ),
    );
  }
}

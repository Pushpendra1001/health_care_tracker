import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_care/firebase_options.dart';
import 'package:health_care/pages/loginPages/loginPage.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpAll(() async {});

  group('SignInScreen', () {
    test('getUserRole returns correct role', () async {
      final signInScreen = SignInScreen();

      final role =
          await signInScreen.getUserRole('Lx6BcoYif8TUJSHXMfcIZSjKpjC3');

      expect(role, "doctor");
    });
  });
}

// import 'package:flutter/material.dart';
// import 'package:health_care/models/doctormodel.dart';
// //  this import points to wherever your model file is located

// class UploadDoctorForm extends StatefulWidget {
//   @override
//   _UploadDoctorFormState createState() => _UploadDoctorFormState();
// }

// class _UploadDoctorFormState extends State<UploadDoctorForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _doctor = Doctor(
//       id: 0,
//       name: '',
//       specialization: '',
//       age: 0,
//       phoneNo: 0,
//       email: '',
//       charge: 0,
//       urlImage: '');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Doctor Data'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: const EdgeInsets.all(16.0),
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Name'),
//               onSaved: (value) {
//                 _doctor.name = value ?? '';
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the doctor\'s name';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Specialization'),
//               onSaved: (value) {
//                 _doctor.specialization = value ?? '';
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the specialization';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Age'),
//               onSaved: (value) {
//                 _doctor.age = int.tryParse(value!) ?? 0;
//               },
//               validator: (value) {
//                 if (value == null ||
//                     value.isEmpty ||
//                     int.tryParse(value) == null) {
//                   return 'Please enter a valid age';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Phone Number'),
//               onSaved: (value) {
//                 _doctor.phoneNo = int.tryParse(value!) ?? 0;
//               },
//               validator: (value) {
//                 if (value == null ||
//                     value.isEmpty ||
//                     int.tryParse(value) == null) {
//                   return 'Please enter a valid phone number';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Email'),
//               onSaved: (value) {
//                 _doctor.email = value ?? '';
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty || !value.contains('@')) {
//                   return 'Please enter a valid email';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Charge'),
//               onSaved: (value) {
//                 _doctor.charge = int.tryParse(value!) ?? 0;
//               },
//               validator: (value) {
//                 if (value == null ||
//                     value.isEmpty ||
//                     int.tryParse(value) == null) {
//                   return 'Please enter a valid charge';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Image URL'),
//               onSaved: (value) {
//                 _doctor.urlImage = value ?? '';
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter an image URL';
//                 }
//                 return null;
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     // Here, you would usually send the data to a server or database
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             content: Text(
//                                 "Doctor '${_doctor.name}' saved successfully!"),
//                           );
//                         });
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

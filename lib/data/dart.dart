import 'package:flutter/material.dart';

List<Map<String, dynamic>> doctorsData = [
  {
    'id': 1,
    'doctorDetails': {
      'Name': 'Dr. Emma Chen',
      'Specialization': 'Cardiology',
      'Age': 39,
      'PhoneNo': 9458395345,
      'Email': 'dr.emma@gmail.com',
      'Charge': 5600,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.StApr-7Q0Q9dBAoQ1ZBzQQAAAA?w=146&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7',
    },
  },
  {
    'id': 2,
    'doctorDetails': {
      'Name': 'Dr. Benjamin Rodriguez',
      'Specialization': 'Dermatology',
      'Age': 45,
      'PhoneNo': 9876543210,
      'Email': 'dr.benjamin@gmail.com',
      'Charge': 1200,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.d_lK64ndKMScucEh3JfGmAAAAA?w=129&h=194&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 3,
    'doctorDetails': {
      'Name': 'Dr. Sophia Nguyen',
      'Specialization': 'Endocrinology',
      'Age': 41,
      'PhoneNo': 8765432109,
      'Email': 'dr.sophia@gmail.com',
      'Charge': 3400,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.2MRS9GqBagKCuGnI8JYMQAHaE8?w=276&h=185&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 4,
    'doctorDetails': {
      'Name': 'Dr. Alexander Patel',
      'Specialization': 'Gastroenterology',
      'Age': 48,
      'PhoneNo': 7654321098,
      'Email': 'dr.alexander@gmail.com',
      'Charge': 7800,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.APjmKmC7pAwcvBCbKoxVmgHaGO?w=196&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 5,
    'doctorDetails': {
      'Name': 'Dr. Mia Johnson',
      'Specialization': 'Hematology',
      'Age': 36,
      'PhoneNo': 6543210987,
      'Email': 'dr.mia@gmail.com',
      'Charge': 2300,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.kQU0H1EIV3-D2z-sSstUtwHaE8?w=277&h=185&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 6,
    'doctorDetails': {
      'Name': 'Dr. Elijah Kim',
      'Specialization': 'Neurology',
      'Age': 42,
      'PhoneNo': 5432109876,
      'Email': 'dr.elijah@gmail.com',
      'Charge': 4500,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.vOGywcXxSvHo53x34qigeAHaFv?w=235&h=182&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 7,
    'doctorDetails': {
      'Name': 'Dr. Ava Gupta',
      'Specialization': 'Oncology',
      'Age': 40,
      'PhoneNo': 4321098765,
      'Email': 'dr.ava@gmail.com',
      'Charge': 8900,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.d_X6BOe12DEsoiTVaceuRQHaDt?w=314&h=174&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 8,
    'doctorDetails': {
      'Name': 'Dr. Lucas Smith',
      'Specialization': 'Orthopedics',
      'Age': 50,
      'PhoneNo': 3210987654,
      'Email': 'dr.lucas@gmail.com',
      'Charge': 6700,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.iVs3gb0RXSckBSdQL_mF_wHaF8?w=201&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 9,
    'doctorDetails': {
      'Name': 'Dr. Ethan Brown',
      'Specialization': 'Ophthalmology',
      'Age': 38,
      'PhoneNo': 2109876543,
      'Email': 'dr.ethan@gmail.com',
      'Charge': 9000,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.Ul6Lk3WL9rqVLprX43-U5QHaHa?w=182&h=182&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 10,
    'doctorDetails': {
      'Name': 'Dr. Isabella Lee',
      'Specialization': 'Otolaryngology (ENT)',
      'Age': 44,
      'PhoneNo': 1098765432,
      'Email': 'dr.isabella@gmail.com',
      'Charge': 1500,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.Fw8sntSBXrhCJd8VFVog_gHaFT?w=254&h=182&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 11,
    'doctorDetails': {
      'Name': 'Dr. Aiden Kumar',
      'Specialization': 'Pediatrics',
      'Age': 35,
      'PhoneNo': 9876543210,
      'Email': 'dr.aiden@gmail.com',
      'Charge': 8800,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.fm-dFpvsfNR8VzcsFJHX0QHaGK?w=208&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 12,
    'doctorDetails': {
      'Name': 'Dr. Harper Wilson',
      'Specialization': 'Psychiatry',
      'Age': 46,
      'PhoneNo': 8765432109,
      'Email': 'dr.harper@gmail.com',
      'Charge': 3000,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.nilDsRE6nfUvFNaWTiTGRwHaE8?w=257&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 13,
    'doctorDetails': {
      'Name': 'Dr. Daniel Davis',
      'Specialization': 'Pulmonology',
      'Age': 37,
      'PhoneNo': 7654321098,
      'Email': 'dr.daniel@gmail.com',
      'Charge': 4100,
      'UrlImage':
          'https://th.bing.com/th/id/OIP.BvsqmgN4Hd9bLUshBWYRBgHaFE?w=237&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 14,
    'doctorDetails': {
      'Name': 'Dr. Amelia Patel',
      'Specialization': 'Rheumatology',
      'Age': 49,
      'PhoneNo': 6543210987,
      'Email': 'dr.amelia@gmail.com',
      'Charge': 7200,
      'UrlImage':
          'https://th.bing.com/th/id/OIP._Bm7z_5Y4fd5g9cQiXdSzgAAAA?w=271&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7'
    },
  },
  {
    'id': 15,
    'doctorDetails': {
      'Name': 'Dr. Logan Taylor',
      'Specialization': 'Urology',
      'Age': 33,
      'PhoneNo': 5432109876,
      'Email': 'dr.logan@gmail.com',
      'Charge': 3000,
      'UrlImage':
          'https://th.bing.com/th?id=OIP.s3mQLGK7nHMzwrv3BNgQTAHaEl&w=317&h=196&c=8&rs=1&qlt=90&o=6&dpr=1.6&pid=3.1&rm=2'
    },
  },
  {
    'id': 16,
    'doctorDetails': {
      'Name': 'Dr. Grace Chen',
      'Specialization': 'Anesthesiology',
      'Age': 47,
      'PhoneNo': 4321098765,
      'Email': 'dr.grace@gmail.com',
      'Charge': 6200,
      'UrlImage':
          'https://th.bing.com/th?id=OIP.rzvJIIoK4rs7kpN44Q5YegHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.6&pid=3.1&rm=2'
    },
  },
  {
    'id': 17,
    'doctorDetails': {
      'Name': 'Dr. Jackson White',
      'Specialization': 'Emergency Medicine',
      'Age': 43,
      'PhoneNo': 3210987654,
      'Email': 'dr.jackson@gmail.com',
      'Charge': 9400,
      'UrlImage':
          'https://th.bing.com/th?id=OIP.Unwzw3FJ3-gpe-ydfkSJmgHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.6&pid=3.1&rm=2'
    },
  },
  {
    'id': 18,
    'doctorDetails': {
      'Name': 'Dr. Aria Hernandez',
      'Specialization': 'Geriatrics',
      'Age': 41,
      'PhoneNo': 2109876543,
      'Email': 'dr.aria@gmail.com',
      'Charge': 1700,
      'UrlImage':
          'https://th.bing.com/th?id=OIP.WPYPa4GubQVLa0kQqXcfvwHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.6&pid=3.1&rm=2'
    },
  },
  {
    'id': 19,
    'doctorDetails': {
      'Name': 'Dr. Oliver Kim',
      'Specialization': 'Infectious Disease',
      'Age': 39,
      'PhoneNo': 1098765432,
      'Email': 'dr.oliver@gmail.com',
      'Charge': 5000,
      'UrlImage':
          'https://th.bing.com/th?id=OIP.Nm1veNvgPX_af5ZkMbngagHaLJ&w=203&h=306&c=8&rs=1&qlt=90&o=6&dpr=1.6&pid=3.1&rm=2'
    },
  },
  {
    'id': 20,
    'doctorDetails': {
      'Name': 'Dr. Mia Johnson',
      'Specialization': 'Nephrology',
      'Age': 45,
      'PhoneNo': 9876543210,
      'Email': 'dr.mia@gmail.com',
      'Charge': 8000,
      'UrlImage':
          'https://th.bing.com/th?id=OIP.IVwf85npYYUcwRp4EIhqDgHaJm&w=219&h=284&c=8&rs=1&qlt=90&o=6&dpr=1.6&pid=3.1&rm=2'
    },
  },
];

List<Color> colorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
  Colors.amber,
  Colors.brown,
  Colors.grey,
  Colors.lime,
  Colors.deepOrange,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.deepPurple,
  Colors.pink,
  Colors.deepOrange,
];

List<int> randomNumbers = [
  6,
  12,
  14,
  28,
  23,
  45,
  39,
  27,
  9,
  15,
  8,
  3,
  23,
  7,
  8,
  2,
  4,
  7,
  5,
  8,
];

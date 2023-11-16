import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? _name;
  String? _address;
  String? _bloodGroup;
  int? _cnic;
  String? _phoneNumber;
  String? _emergencyContact;
  String? _gender;
  DateTime? _dateOfBirth;
  String? _medicalDetails;

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _name ?? '');
    await prefs.setString('address', _address ?? '');
    await prefs.setString('bloodGroup', _bloodGroup ?? '');
    await prefs.setInt('cnic', _cnic ?? 0);
    await prefs.setString('phoneNumber', _phoneNumber ?? '');
    await prefs.setString('emergencyContact', _emergencyContact ?? '');
    await prefs.setString('gender', _gender ?? '');
    await prefs.setString(
        'dateOfBirth', _dateOfBirth != null ? _dateOfBirth.toString() : '');
    await prefs.setString('medicalDetails', _medicalDetails ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(75.0),
              child: AppBar(
                backgroundColor: Colors.red,
                elevation: 0.0,
                flexibleSpace: Container(
                  height: 68.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFb7b6b6), // Gray color in hex
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pop(); // Navigate to main page
                          },
                          child: Container(
                            width: 150, // Set your desired width
                            height: 50, // Set your desired height
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/logo_text.png'), // Replace with your logo
                              ),
                            ),
                          ),
                        ), // Profile Icon and Name
                        const Column(
                          children: [
                            SizedBox(height: 2),
                            Icon(
                              Icons.person_rounded,
                              size: 35,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Abdullah', // Replace with the actual name
                              style: TextStyle(
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (value) => _name = value,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    onChanged: (value) => _address = value,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  TextFormField(
                    onChanged: (value) => _bloodGroup = value,
                    decoration: InputDecoration(labelText: 'Blood Group'),
                  ),
                  TextFormField(
                    onChanged: (value) => _cnic = int.tryParse(value),
                    decoration: InputDecoration(labelText: 'CNIC Number'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    onChanged: (value) => _phoneNumber = value,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    onChanged: (value) => _emergencyContact = value,
                    decoration: InputDecoration(labelText: 'Emergency Contact'),
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    onChanged: (value) => _gender = value,
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      // Assuming date is entered as text in format 'YYYY-MM-DD'
                      if (value.isNotEmpty) {
                        _dateOfBirth = DateTime.tryParse(value);
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Date of Birth (YYYY-MM-DD)'),
                    keyboardType: TextInputType.datetime,
                  ),
                  TextFormField(
                    onChanged: (value) => _medicalDetails = value,
                    decoration: InputDecoration(labelText: 'Medical Details'),
                    maxLines: null, // Allow multiple lines for medical details
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: _saveUserData,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

    Navigator.pushReplacementNamed(context, '/');
  }

  OutlineInputBorder redBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
      borderRadius: BorderRadius.circular(8.0),
    );
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
                  buildTextFormField('Name'),
                  buildTextFormField('Address'),
                  buildTextFormField('Blood Group'),
                  buildTextFormField('CNIC Number', TextInputType.number),
                  buildTextFormField('Phone Number', TextInputType.phone),
                  buildTextFormField('Emergency Contact', TextInputType.phone),
                  buildTextFormField('Gender'),
                  buildTextFormField(
                      'Date of Birth (YYYY-MM-DD)', TextInputType.datetime),
                  buildTextFormField('Medical Details'),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: _saveUserData,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
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

  Widget buildTextFormField(String labelText,
      [TextInputType? keyboardType, int? maxLines]) {
    return TextFormField(
      onChanged: (value) {
        switch (labelText) {
          case 'Name':
            _name = value;
            break;
          case 'Address':
            _address = value;
            break;
          case 'Blood Group':
            _bloodGroup = value;
            break;
          case 'CNIC Number':
            _cnic = int.tryParse(value);
            break;
          case 'Phone Number':
            _phoneNumber = value;
            break;
          case 'Emergency Contact':
            _emergencyContact = value;
            break;
          case 'Gender':
            _gender = value;
            break;
          case 'Date of Birth (YYYY-MM-DD)':
            if (value.isNotEmpty) {
              _dateOfBirth = DateTime.tryParse(value);
            }
            break;
          case 'Medical Details':
            _medicalDetails = value;
            break;
          default:
            break;
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }
}

import 'package:sharedpref_app/screens/data_retrieval.dart';
import 'package:sharedpref_app/service/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:sharedpref_app/responsive/device_dimensions.dart';

class DataInput extends StatefulWidget {
  const DataInput({super.key});

  @override
  State<DataInput> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  final SharedPrefsService _prefsService = SharedPrefsService();

  void _saveData() async {
    if (_nameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _designationController.text.isEmpty ||
        _companyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields before saving!')),
      );
    } else {
      //save if all fields are filled
      await _prefsService.saveUserData(
        name: _nameController.text,
        username: _usernameController.text,
        age: _ageController.text,
        designation: _designationController.text,
        company: _companyController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully!')),
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DataRetrieval()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Profile',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text("Enter your data here",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            DeviceDimensions.responsiveSize(context) * 0.045)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: TextFormField(
                  style: TextStyle(
                      height: DeviceDimensions.screenHeight(context) * 0.0006),
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder())),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: TextFormField(
                  style: TextStyle(
                      height: DeviceDimensions.screenHeight(context) * 0.0006),
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      labelText: 'Username', border: OutlineInputBorder())),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: TextFormField(
                  style: TextStyle(
                      height: DeviceDimensions.screenHeight(context) * 0.0006),
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Age', border: OutlineInputBorder())),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: TextFormField(
                  style: TextStyle(
                      height: DeviceDimensions.screenHeight(context) * 0.0006),
                  controller: _designationController,
                  decoration: const InputDecoration(
                      labelText: 'Designation', border: OutlineInputBorder())),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: TextFormField(
                  style: TextStyle(
                      height: DeviceDimensions.screenHeight(context) * 0.0006),
                  controller: _companyController,
                  decoration: const InputDecoration(
                      labelText: 'Company', border: OutlineInputBorder())),
            ),
            SizedBox(
              width: DeviceDimensions.screenWidth(context) * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _saveData,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white),
                  child: Text('Save',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize:
                              DeviceDimensions.responsiveSize(context) * 0.045,
                          letterSpacing: 1)),
                ),
              ),
            )
          ],
        )));
  }
}
